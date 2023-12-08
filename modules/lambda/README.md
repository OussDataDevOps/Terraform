# Module Lambda Terraform

## Description
Ce module Terraform est conçu pour créer et configurer une fonction Lambda avec des déclencheurs SQS et une intégration S3. Il crée un rôle IAM avec les politiques nécessaires pour l'exécution de Lambda, ainsi que la fonction Lambda elle-même.

## Ressources Créées
- **IAM Role**: Crée un rôle IAM pour la fonction Lambda avec les permissions nécessaires.
- **IAM Role Policy Attachments**: Attache les politiques pour l'exécution de base de Lambda, l'accès SQS, et la lecture S3.
- **Lambda Function**: Déploie la fonction Lambda.
- **Lambda Event Source Mapping**: Configure le déclencheur SQS pour la fonction Lambda.

## Variables
- `lambda_name`: Le nom de la fonction Lambda.
- `handler`: Le gestionnaire (handler) de la fonction Lambda.
- `lambda_runtime`: Le runtime de la fonction Lambda.
- `s3_bucket`: Le nom du bucket S3 contenant le code source de la fonction Lambda.
- `s3_key`: Le chemin d'accès au fichier ZIP contenant le code de la fonction Lambda dans le bucket S3.
- `lambda_description`: Description de la fonction Lambda.
- `lambda_memory_size`: Taille de la mémoire allouée à la fonction Lambda.
- `lambda_timeout`: Durée maximale d'exécution de la fonction Lambda.
- `event_source_arn`: ARN de la source d'événement (SQS) pour le déclenchement de la fonction Lambda.

## Utilisation
Pour utiliser ce module, spécifiez les variables requises dans le fichier `main.tf` et référencez ce module. Assurez-vous que les valeurs des variables correspondent à vos exigences et à votre configuration.
