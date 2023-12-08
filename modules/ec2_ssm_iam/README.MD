# Module IAM EC2 SSM Terraform

## Description
Ce module Terraform est conçu pour créer un rôle IAM et un profil d'instance IAM pour les instances EC2. Ce rôle permet aux instances EC2 d'interagir avec AWS Systems Manager (SSM), un service qui facilite la gestion et la configuration des instances EC2 et d'autres ressources AWS.

## Ressources Créées
- **IAM Role (`aws_iam_role`)**: Un rôle IAM avec une politique d'assomption de rôle permettant aux instances EC2 d'accéder aux fonctionnalités d'AWS Systems Manager.
- **IAM Role Policy Attachment (`aws_iam_role_policy_attachment`)**: Attache la politique IAM standard `AmazonEC2RoleforSSM` au rôle créé, donnant ainsi les permissions nécessaires pour l'utilisation de SSM.
- **IAM Instance Profile (`aws_iam_instance_profile`)**: Profil d'instance IAM qui peut être associé aux instances EC2 pour leur permettre d'assumer le rôle IAM.

## Utilisation
Ce module peut être inclus dans votre configuration Terraform pour créer automatiquement le rôle et le profil d'instance IAM nécessaires pour les instances EC2 utilisant AWS Systems Manager.

Exemple d'utilisation dans `main.tf`:
```hcl
module "ec2_ssm_iam" {
  source = "../modules/ec2_ssm_iam"
}
```