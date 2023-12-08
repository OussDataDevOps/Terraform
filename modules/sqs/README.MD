# Module SQS Terraform

## Description
Ce module Terraform est utilisé pour créer une file d'attente SQS (Simple Queue Service) sur AWS. Il permet de configurer divers paramètres de la file d'attente, tels que les délais, la taille maximale des messages, et d'autres options.

## Ressources Créées
- **SQS Queue**: Crée une file d'attente SQS avec les paramètres configurés.

## Variables
- `sqs_name`: Nom de la file d'attente SQS à créer.
- `sqs_delayseconds`: Le délai (en secondes) avant qu'un message devienne visible dans la file d'attente.
- `max_message_size`: La taille maximale d'un message dans la file (en octets).
- `message_retention_seconds`: La durée pendant laquelle un message reste dans la file avant d'être supprimé (en secondes).
- `visibility_timeout_seconds`: La durée pendant laquelle un message reste invisible dans la file après sa réception (en secondes).
- `receive_wait_time_seconds`: Le temps d'attente pour le traitement d'un message (en secondes).

## Utilisation
Pour utiliser ce module, spécifiez les variables requises dans votre fichier `main.tf` et référencez ce module. Assurez-vous que les valeurs des variables correspondent à vos besoins spécifiques.