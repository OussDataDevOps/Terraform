# Tada - Guide d'Utilisation - Infrastructure AWS

![](images\tada.drawio.png)

## Description Générale
Ce projet Terraform est conçu pour créer et gérer une infrastructure AWS complète comprenant un VPC, des groupes de sécurité, un équilibreur de charge (Load Balancer), un groupe d'AutoScaling, des rôles IAM pour EC2 et S3, un bucket S3, une file d'attente SQS et une fonction Lambda. Le projet utilise une série de modules Terraform pour modulariser et faciliter la gestion de l'infrastructure.

## Structure des Dossiers
- `ressources`: Contient le fichier `main.tf` qui utilise différents modules pour construire l'infrastructure.
- `modules`: Sous-dossiers pour chaque module (VPC, ALB, EC2, S3, SQS, Lambda, etc.).
- `data.tf`: Fichier définissant les sources de données, telles que les AMIs AWS.
- `.gitlab-ci.yml`: Configuration CI/CD pour GitLab.
- `outputs.tf`: Fichier définissant les sorties du projet.
- `provider.tf`: Configuration du fournisseur AWS.
- `vars.tf`: Définition des variables utilisées dans le projet.
- `version.tf`: Spécification des versions Terraform et des providers requis.

## Modules et Leur Fonction
1. **VPC**: Crée un VPC avec des sous-réseaux publics et privés, un Internet Gateway, des tables de routage et des endpoints VPC.
2. **Security Groups**: Définit les groupes de sécurité pour EC2 et ALB.
3. **Load Balancer (ALB)**: Configure un équilibreur de charge application.
4. **AutoScaling Group**: Gère le scaling des instances EC2.
5. **IAM Roles**: Crée des rôles IAM pour l'accès SSM et S3 depuis EC2.
6. **S3**: Crée un bucket S3 et y télécharge le code Lambda.
7. **SQS**: Met en place une file d'attente SQS.
8. **Lambda**: Configure une fonction Lambda avec des déclencheurs SQS.

## Utilisation
1. **Initialisation**: Exécutez `terraform init` pour initialiser le projet et télécharger les modules et providers nécessaires.
2. **Planification**: Exécutez `terraform plan` pour prévisualiser les changements.
3. **Application**: Exécutez `terraform apply` pour déployer l'infrastructure.
4. **Destruction**: Utilisez `terraform destroy` pour supprimer l'infrastructure.

## CI/CD avec GitLab
Le fichier `.gitlab-ci.yml` contient des instructions pour créer le bucket S3 et la table DynamoDB pour le backend Terraform, ainsi que pour déployer l'infrastructure via CI/CD.

## Configuration
Les fichiers `vars.tf` et `version.tf` permettent de configurer les paramètres du projet, tels que la région AWS, les noms des ressources, les versions Terraform, etc.

## Outputs
Le fichier `outputs.tf` fournit des informations utiles sur l'infrastructure déployée, telles que les ID VPC, les DNS des load balancers, et plus.

## Voici une arborescence détaillée du projet
```txt
AWS/
└── Terraform/
    ├── modules/
    │   ├── alb_security_group/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── autoscaling_group/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── ec2_security_group/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── ec2_ssm_iam/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── lambda/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── load_balancer/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── s3/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   ├── sqs/
    │   │   ├── main.tf
    │   │   └── variables.tf
    │   └── vpc/
    │       ├── main.tf
    │       └── variables.tf
    ├── ressources/
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── provider.tf
    │   ├── vars.tf
    │   ├── version.tf
    │   └── .gitlab-ci.yml
    └── data.tf
```