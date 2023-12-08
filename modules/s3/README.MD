# Module S3 Terraform

## Description
Ce module Terraform est conçu pour créer un bucket S3 et y télécharger un fichier ZIP contenant le code d'une fonction Lambda. Le module configure également le blocage d'accès public pour le bucket S3.

## Ressources Créées
- **S3 Bucket**: Crée un bucket S3 pour stocker les fichiers.
- **S3 Bucket Public Access Block**: Configure le blocage d'accès public pour le bucket S3.
- **S3 Object**: Télécharge le fichier ZIP dans le bucket S3.

## Variables
- `bucket_name`: Le nom du bucket S3.
- `s3_bucket_1_block_public_acl`: Si les ACLs publics doivent être bloqués.
- `s3_bucket_1_block_public_policy`: Si les politiques publiques doivent être bloquées.
- `s3_bucket_1_ignore_public_acls`: Si les ACLs publics doivent être ignorés.
- `s3_bucket_1_restrict_public_buckets`: Si l'accès public aux buckets doit être restreint.
- `type_archive_file`: Le type de fichier d'archive (habituellement "zip").
- `key_s3_bucket_object`: La clé (chemin) de l'objet S3 à télécharger.

## Utilisation
Pour utiliser ce module, spécifiez les variables requises dans votre fichier `main.tf` et référencez ce module. Assurez-vous que les valeurs des variables correspondent à vos besoins spécifiques.
