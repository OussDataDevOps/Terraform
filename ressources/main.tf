# Main Configuration

locals {
  resource_name_prefix          = "${var.resources_prefix}-${var.env}"
}

# Ce module est conçu pour créer un VPC. 
# Il inclut la création de sous-réseaux publics et privés, d'un Internet Gateway, de tables de routage, et de différents endpoints VPC pour les services AWS comme SSM, EC2 Messages, et S3.
module "vpc" {
  source                        = "../modules/vpc"
  tag_vpc                       = local.resource_name_prefix
  tag_vpc_public_subnet         = local.resource_name_prefix
  tag_vpc_private_subnet        = local.resource_name_prefix
  tag_vpc_igw                   = local.resource_name_prefix
  tag_vpc_route_table           = local.resource_name_prefix
  vpc_endpoint_ec2_ssm          = local.resource_name_prefix
  vpc_endpoint_ec2_ssm_messages = local.resource_name_prefix
  vpc_endpoint_ec2_messages     = local.resource_name_prefix
  vpc_endpoint_s3               = local.resource_name_prefix
  endpoint_sg                   = local.resource_name_prefix
  aws_region                    = var.region
  cidr_block                    = "10.0.0.0/16"
  cidr_block_route_table        = "0.0.0.0/0"
  vpc_endpoint_type             = "Interface"
  vpc_endpoint_type_s3          = "Gateway"
}

# Module Security Group EC2
module "ec2_security_group" {
  source                        = "../modules/ec2_security_group"
  name                          = "${local.resource_name_prefix}-ec2-sg"
  vpc_id                        = module.vpc.vpc_id
  alb_sg_id                     = module.alb_security_group.security_group_id
}

# Module Security Group ALB
module "alb_security_group" {
  source                        = "../modules/alb_security_group"
  name                          = "${local.resource_name_prefix}-alb-sg"
  vpc_id                        = module.vpc.vpc_id
}

# Ce module est conçu pour créer un équilibreur de charge (Load Balancer) de type application
module "load_balancer" {
  source                        = "../modules/load_balancer"
  name                          = "${local.resource_name_prefix}-alb"
  subnet_ids                    = module.vpc.public_subnet_ids
  security_group_id             = module.alb_security_group.security_group_id
  vpc_id                        = module.vpc.vpc_id
}

# Module AutoScaling Group
module "autoscaling_group" {
  source                        = "../modules/autoscaling_group"
  image_id                      = data.aws_ami.ubuntu.id
  instance_type                 = "t2.micro"
  security_group_id             = module.ec2_security_group.security_group_id
  subnet_ids                    = module.vpc.private_subnet_ids
  min_size                      = 3
  max_size                      = 6
  iam_instance_profile_name     = module.ec2_ssm_iam.instance_profile_name
  lb_target_group_arn           = module.load_balancer.lb_target_group_arn
}

# Module IAM EC2 SSM
## Pour se connecter à une instance à l'aide du Gestionnaire de session sans SSH
module "ec2_ssm_iam" {
  source                        = "../modules/ec2_ssm_iam"
}

# Ce module crée un rôle IAM avec des politiques permettant l'accès aux services S3 depuis les instances EC2 via le service AWS Systems Manager (SSM).
module "ssm_iam_s3" {
  source                        = "../modules/ssm_iam_s3"
  s3_bucket_arn                 = module.s3.bucket_arn
}

# Module pour créer un bucket S3 et y télécharger un fichier ZIP contenant le code d'une fonction Lambda
module "s3" {
  source                        = "../modules/s3"
  bucket_name                   = "bucket-lambda-sqs-tada-exo"
  type_archive_file             = "zip"
  key_s3_bucket_object          = "lambda_function.zip"

}

# Ce module est utilisé pour créer une file d'attente SQS
module "sqs" {
  source                        = "../modules/sqs"
  sqs_name                      = "${local.resource_name_prefix}-sqs-queue"
  sqs_delayseconds              = 5
  max_message_size              = 2048
  message_retention_seconds     = 86000
  visibility_timeout_seconds    = 200
  receive_wait_time_seconds     = 10
}

# Ce module est conçu pour créer et configurer une fonction AWS Lambda avec des déclencheurs SQS et une intégration S3.
module "lambda_module" {
  source                        = "../modules/lambda"
  lambda_name                   = "${local.resource_name_prefix}-lambda"
  lambda_description            = "Lambda function which calls code from S3 and invokes when S3 queue recieves a message"
  handler                       = "lambda_function.lambda_handler"
  lambda_memory_size            = 128
  s3_bucket                     = "bucket-lambda-sqs-tada-exo"
  s3_key                        = "lambda_function.zip"
  lambda_runtime                = "python3.9"
  lambda_timeout                = 180
  event_source_arn              = module.sqs.queue_arn
  s3_object_arn_for_dependency  = module.s3.lambda_zip_s3_object_arn
}
