# Module AutoScaling Group Terraform

## Description
Ce module Terraform est conçu pour créer un groupe d'AutoScaling. Il permet de lancer et de gérer un ensemble d'instances EC2 qui s'adaptent automatiquement en fonction de la charge.

## Ressources Créées
- **Launch Configuration**: Configuration de lancement pour les instances EC2 dans le groupe d'AutoScaling.
- **AutoScaling Group**: Groupe d'AutoScaling qui gère le lancement et la suppression des instances EC2.

## Variables
- `image_id`: L'identifiant de l'AMI (Amazon Machine Image) à utiliser pour les instances.
- `instance_type`: Le type d'instance EC2 à lancer.
- `security_group_id`: L'identifiant du groupe de sécurité à associer aux instances.
- `iam_instance_profile_name`: Le nom du profil d'instance IAM à associer aux instances.
- `subnet_ids`: La liste des identifiants de sous-réseaux dans lesquels les instances seront lancées.
- `min_size`: La taille minimale du groupe d'AutoScaling.
- `max_size`: La taille maximale du groupe d'AutoScaling.
- `lb_target_group_arn`: L'ARN (Amazon Resource Name) du groupe cible associé au Load Balancer.

## Utilisation
Pour utiliser ce module, incluez-le dans votre fichier `main.tf` et spécifiez les valeurs des variables nécessaires.

Exemple de configuration dans `main.tf` :

```hcl
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
```
