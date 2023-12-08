# Module Terraform SSM IAM pour S3

## Description
Ce module crée un rôle IAM avec des politiques permettant l'accès aux services S3 depuis les instances EC2 via le service AWS Systems Manager (SSM). Il est conçu pour fournir un accès sécurisé et contrôlé aux ressources S3 nécessaires.

## Ressources Créées
- **IAM Role (`aws_iam_role`)**: Crée un rôle IAM pour les instances EC2 avec une politique d'assomption de rôle permettant des actions SSM.
- **IAM Policy (`aws_iam_policy`)**: Définit une politique IAM qui accorde des permissions spécifiques pour accéder aux objets dans un bucket S3.
- **IAM Role Policy Attachment (`aws_iam_role_policy_attachment`)**: Attache la politique IAM au rôle IAM.

## Variables
- `s3_bucket_arn`: L'ARN du bucket S3 pour lequel le rôle aura des permissions d'accès.

## Outputs
- `role_name`: Le nom du rôle IAM créé.
- `role_arn`: L'ARN du rôle IAM créé.

## Utilisation
Ce module peut être utilisé pour créer un rôle IAM permettant aux instances EC2 d'accéder à des ressources S3 via SSM, tout en maintenant une gestion centralisée des permissions.

Exemple d'utilisation dans `main.tf`:
```hcl
module "ssm_iam_s3" {
  source         = "../modules/ssm_iam_s3"
  s3_bucket_arn  = "arn:aws:s3:::mon-bucket-s3"
}
```