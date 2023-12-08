variable "sqs_name" {
  description = "Nom de la file d'attente SQS"
  type        = string
}

variable "sqs_delayseconds" {
  description = "Le délai (en secondes) avant qu'un message devienne visible dans la file d'attente."
  type = number
}

variable "max_message_size" {
  description = "La taille maximale d'un message dans la file (en octets)."
  type = number
}

variable "message_retention_seconds" {
  description = "La durée pendant laquelle un message reste dans la file avant d'être supprimé (en secondes)."
  type = number
}

variable "visibility_timeout_seconds" {
  description = "La durée pendant laquelle un message reste invisible dans la file après sa réception (en secondes)."
  type = number
}

variable "receive_wait_time_seconds" {
  description = "Le temps d'attente pour le traitement d'un message (en secondes)."
  type = number
}