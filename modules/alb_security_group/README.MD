# Module Security Group ALB Terraform

## Description
Ce module Terraform est conçu pour créer un groupe de sécurité pour un Application Load Balancer (ALB). Ce groupe de sécurité définit les règles d'entrée et de sortie pour le trafic réseau vers et depuis l'ALB.

## Ressources Créées
- **Security Group**: Un groupe de sécurité configuré pour l'ALB avec des règles d'ingress et d'egress spécifiées.

## Variables
- `name`: Le nom à attribuer au groupe de sécurité de l'ALB. Utilisé également comme tag `Name`.
- `vpc_id`: L'identifiant du VPC dans lequel le groupe de sécurité sera créé.

## Règles de Sécurité
- **Ingress**: 
  - Port 80 (HTTP) ouvert à tous (`0.0.0.0/0`).
  - Port 443 (HTTPS) ouvert à tous (`0.0.0.0/0`).
- **Egress**:
  - Trafic sortant autorisé vers toutes les destinations sur tous les ports.

## Utilisation
Pour utiliser ce module, incluez-le dans votre fichier `main.tf` en spécifiant les variables `name` et `vpc_id`.

Exemple de configuration dans `main.tf` :
```hcl
module "alb_security_group" {
  source   = "../modules/alb_security_group"
  name     = "nom-groupe-securite-alb"
  vpc_id   = "vpc-1234567890abcdef0"
}
```