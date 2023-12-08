# Module Security Group EC2 Terraform

## Description
Ce module Terraform est destiné à créer un groupe de sécurité pour des instances EC2. Il définit les règles d'entrée (ingress) et de sortie (egress) pour contrôler le trafic réseau vers et depuis les instances EC2.

## Ressources Créées
- **Security Group**: Un groupe de sécurité qui définit un ensemble de règles de filtrage pour les instances EC2.

## Variables
- `name`: Le nom du groupe de sécurité à créer.
- `vpc_id`: L'identifiant du VPC dans lequel le groupe de sécurité sera créé.
- `alb_sg_id`: L'identifiant du groupe de sécurité de l'Application Load Balancer (ALB) pour autoriser le trafic entrant.

## Règles de Sécurité
- **Ingress Rules**: 
  - Port 80 (HTTP) et 443 (HTTPS) autorisés pour le trafic entrant depuis le groupe de sécurité de l'ALB.
- **Egress Rules**:
  - Tout le trafic sortant est autorisé vers toutes les destinations.

## Utilisation
Pour utiliser ce module, incluez-le dans votre fichier `main.tf` et spécifiez les valeurs des variables nécessaires.

Exemple de configuration dans `main.tf` :
```hcl
module "ec2_security_group" {
  source   = "../modules/ec2_security_group"
  name     = "Nom-du-SG-EC2"
  vpc_id   = module.vpc.vpc_id
  alb_sg_id = module.alb_security_group.security_group_id
}
```
