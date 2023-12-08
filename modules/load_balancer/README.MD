# Module Load Balancer Terraform

## Description
Ce module Terraform est conçu pour créer un équilibreur de charge (Load Balancer) de type application. Il est configuré pour fonctionner avec des instances EC2 dans des sous-réseaux spécifiques et avec un groupe de sécurité défini.

## Ressources Créées
- **Load Balancer (`aws_lb`)**: Crée un équilibreur de charge application qui distribue le trafic entrant entre les instances EC2.
- **Load Balancer Listener (`aws_lb_listener`)**: Écouteur pour le load balancer qui dirige le trafic entrant sur le port 80 vers un groupe de cibles.
- **Load Balancer Target Group (`aws_lb_target_group`)**: Groupe de cibles où le trafic est acheminé. Habituellement associé à des instances EC2.

## Variables
- `name`: Nom de l'équilibreur de charge.
- `subnet_ids`: IDs des sous-réseaux où le load balancer sera disponible.
- `security_group_id`: ID du groupe de sécurité associé au load balancer.
- `vpc_id`: ID du VPC dans lequel le load balancer est déployé.

## Outputs
- `lb_arn`: ARN de l'équilibreur de charge.
- `lb_dns_name`: Nom DNS de l'équilibreur de charge.
- `lb_listener_arn`: ARN de l'écouteur du load balancer.
- `lb_target_group_arn`: ARN du groupe de cibles du load balancer.

## Utilisation
Ce module peut être utilisé pour déployer facilement un équilibreur de charge dans votre infrastructure.

Exemple d'utilisation dans `main.tf`:
```hcl
module "load_balancer" {
  source              = "../modules/load_balancer"
  name                = "${local.resource_name_prefix}-alb"
  subnet_ids          = module.vpc.public_subnet_ids
  security_group_id   = module.alb_security_group.security_group_id
  vpc_id              = module.vpc.vpc_id
}
```