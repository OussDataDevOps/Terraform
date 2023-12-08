# Module VPC Terraform

## Description
Ce module Terraform est conçu pour créer un Virtual Private Cloud (VPC) . Il inclut la création de sous-réseaux publics et privés, d'un Internet Gateway, de tables de routage, et de différents endpoints VPC pour les services AWS comme SSM, EC2 Messages, et S3.

## Ressources Créées
- **VPC (`aws_vpc`)**: Crée le VPC avec les paramètres réseau spécifiés.
- **Subnets Publics et Privés (`aws_subnet`)**: Crée des sous-réseaux publics et privés dans les zones de disponibilité disponibles.
- **Internet Gateway (`aws_internet_gateway`)**: Fournit un accès à Internet pour les sous-réseaux publics.
- **Route Tables (`aws_route_table`)**: Tables de routage pour gérer le trafic réseau dans le VPC.
- **VPC Endpoints (`aws_vpc_endpoint`)**: Endpoints pour les services AWS SSM, EC2 Messages, et S3 pour une connectivité privée au sein du VPC.

## Variables
- `aws_region`: La région AWS pour le VPC.
- `cidr_block`: Le bloc CIDR pour le VPC.
- `cidr_block_route_table`: Le bloc CIDR pour la table de routage.
- `vpc_endpoint_type`: Le type d'endpoint VPC (Interface ou Gateway).
- `tag_vpc`, `tag_vpc_public_subnet`, etc.: Tags pour les différentes ressources.

## Outputs
- `vpc_id`: ID du VPC créé.
- `public_subnet_ids`: IDs des sous-réseaux publics.
- `private_subnet_ids`: IDs des sous-réseaux privés.
- `ssm_endpoint_id`, etc.: IDs des différents endpoints VPC.

## Utilisation
Ce module peut être utilisé pour déployer un VPC complet avec une configuration de sous-réseaux et d'endpoints.

Exemple d'utilisation dans `main.tf`:
```hcl
module "vpc" {
  source                        = "../modules/vpc"
  aws_region                    = "us-west-2"
  cidr_block                    = "10.0.0.0/16"
  tag_vpc                       = "mon-vpc"
  // Autres variables...
}
```