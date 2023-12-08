### Instructions pour Configurer le Backend Terraform

#### À destination des utilisateurs :

Lorsque vous utilisez ce projet Terraform, il est crucial de configurer un backend S3 pour gérer l'état de Terraform. Voici les étapes à suivre pour configurer le backend S3 avec vos propres paramètres AWS.

#### Créer un Bucket S3
Si vous n'avez pas déjà un bucket S3 pour stocker l'état de Terraform, créez-en un dans la console AWS ou via AWS CLI. Assurez-vous d'activer le versioning pour ce bucket pour plus de sécurité.

#### Étape 4: Modifier le fichier `backend.tf`
Ouvrez le fichier `backend.tf` dans le dossier du projet et remplacez les valeurs suivantes avec vos informations :

- `bucket` : Le nom de votre bucket S3.
- `region` : La région AWS où se trouve votre bucket.
- `key` : Le chemin dans le bucket où l'état de Terraform sera stocké (par exemple, `path/to/terraform.tfstate`).

```hcl
terraform {
  backend "s3" {}
}
```