# Infrastructure AWS - Interactions des Composants

## VPC
Le VPC est le réseau virtuel isolé dans AWS. Il contient les éléments suivants :
- **Public Subnet**: Sous-réseau où les instances peuvent être accessibles d'Internet.
- **Private Subnet**: Sous-réseau protégé qui n'est pas accessible directement depuis Internet.
- **Internet Gateway**: Fournit une route pour le trafic entre le VPC et Internet.
- **Route Table**: Détermine où le trafic réseau est dirigé.
- **SSM Endpoints**: Endpoints de service pour le Systems Manager permettant la gestion des instances sans nécessiter un accès Internet direct.

## Security Groups
- **EC2 Security Group**: Applique des règles de filtrage du trafic pour les instances EC2.
- **ALB Security Group**: Applique des règles de filtrage du trafic pour l'Application Load Balancer (ALB).

## IAM Roles
- **EC2 SSM IAM**: Rôle IAM permettant aux instances EC2 de communiquer avec Systems Manager.
- **SSM IAM S3**: Rôle IAM permettant aux instances EC2 d'accéder aux ressources S3.

## Load Balancer (ALB)
- **Target Group**: Groupe de cibles pour l'équilibrage de charge.
- **Listener**: Écoute et route le trafic entrant vers les cibles dans le Target Group.

## AutoScaling Group
- **Launch Configuration**: Définit la configuration des instances EC2 qui seront lancées.

## Lambda
- **SQS Queue**: File d'attente pour le service de messagerie de Simple Queue Service.
- **S3 Bucket**: Seau de stockage pour les objets dans Simple Storage Service.

Les instances EC2 créées par l'AutoScaling Group sont associées aux Security Groups et peuvent communiquer avec SSM grâce au rôle IAM EC2 SSM IAM. L'ALB dirige le trafic vers ces instances via le Target Group et est protégé par l'ALB Security Group. Les fonctions Lambda sont déclenchées par des messages dans la SQS Queue et peuvent accéder aux objets dans le S3 Bucket grâce au rôle IAM SSM IAM S3.