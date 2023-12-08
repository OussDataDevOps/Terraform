# Instructions pour Configurer le Backend Terraform

## Introduction
Pour gérer l'état de Terraform dans notre projets, il est recommandé d'utiliser un backend S3. Cette documentation nous guide à travers la création d'un bucket S3 et d'une table DynamoDB pour le verrouillage d'état, ainsi que la configuration des variables nécessaires dans GitLab CI/CD.

#### Étape 1: Créer un Bucket S3

1. **Ouvrir le Terminal AWS CLI :**
   Ouvrez votre terminal et assurez-vous que AWS CLI est installé et configuré avec vos identifiants AWS.

2. **Créer le Bucket S3 :**
   Exécutez la commande suivante pour créer un nouveau bucket S3. Remplacez `mon-bucket-terraform-galere` par le nom souhaité pour votre bucket.
   ```
   aws s3api create-bucket --bucket mon-bucket-terraform-galere --region us-east-1
   ```

3. **Activer le Versioning (option) :**
   Pour activer le versioning sur votre bucket, utilisez la commande suivante :
   ```
   aws s3api put-bucket-versioning --bucket mon-bucket-terraform-galere --versioning-configuration Status=Enabled
   ```

#### Étape 2: Créer une Table DynamoDB pour le Verrouillage d'État

1. **Créer la Table DynamoDB :**
   Exécutez la commande suivante pour créer une table DynamoDB. Remplacez `ma-table-lock-terraform-galere` par le nom souhaité pour votre table.
   ```
   aws dynamodb create-table --table-name ma-table-lock-terraform-galere --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 --region region
   ```

#### Étape 3: Configurer le Backend dans Terraform

1. **Modifier le fichier `backend.tf` :**
   Ouvrez le fichier `backend.tf` et ajustez les valeurs de configuration du backend S3 pour correspondre à votre configuration AWS :
   ```hcl
   terraform {
     backend "s3" {}
   }
   ```

#### Étape 4: Configurer les Variables dans GitLab

1. **Accéder à votre projet GitLab :**
   Connectez-vous à GitLab et accédez à votre projet.

2. **Configurer les Variables d'Environnement :**
   Dans GitLab, naviguez vers `Settings` > `CI/CD` et déroulez la section `Variables`. Ajoutez les variables suivantes :
   - `AWS_ACCESS_KEY_ID` : Votre clé d'accès AWS.
   - `AWS_SECRET_ACCESS_KEY` : Votre clé secrète AWS.
   - `AWS_DEFAULT_REGION`: La région AWS du projet
   - `TF_BACKEND_BUCKET` : Le nom de votre bucket S3.
   - `TF_BACKEND_KEY` : Le chemin de la clé dans le bucket S3.
   - `TF_BACKEND_REGION` : La région AWS du bucket.
   - `TF_BACKEND_DYNAMODB_TABLE` : Le nom de votre table DynamoDB.

Ces instructions vous permettront de configurer votre backend Terraform avec un bucket S3 et une table DynamoDB pour une gestion sécurisée et efficace de l'état de Terraform dans vos projets CI/CD GitLab.