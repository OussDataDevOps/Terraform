variable "lambda_name" {
  description = "Nom de la fonction Lambda"
  type        = string
}

variable "handler" {
  description = "Le gestionnaire (handler) de la fonction Lambda"
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime de la fonction Lambda"
  type        = string
}

variable "s3_bucket" {
  description = "Nom du bucket S3 pour le code source de Lambda"
  type        = string
}

variable "s3_key" {
  description = "Chemin d'accès au fichier ZIP du code Lambda dans S3"
  type        = string
}

variable lambda_description{
  type = string
  default = "Lambda function which calls code from S3 and invokes when S3 queue recieves a message"
}

variable lambda_memory_size{
  type = number
  description = "Taille de la mémoire allouée à la fonction Lambda"
}

variable lambda_timeout{
  type = number
  description = "Durée maximale d'exécution de la fonction Lambda."
}

variable "event_source_arn" {
  description = "ARN de la source d'événement (SQS) pour le déclenchement de la fonction Lambda"
}