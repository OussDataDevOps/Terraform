variable "image_id" {
  description = "L'identifiant de l'AMI (Amazon Machine Image) à utiliser pour les instances."
  type        = string
}

variable "instance_type" {
  description = "Le type d'instance EC2 à lancer."
  type        = string
}

variable "security_group_id" {
  description = "L'identifiant du groupe de sécurité à associer aux instances."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Le nom du profil d'instance IAM à associer aux instances."
  type        = string
}

variable "subnet_ids" {
  description = "La liste des identifiants de sous-réseaux dans lesquels les instances seront lancées."
  type        = list(string)
}

variable "min_size" {
  description = "La taille minimale du groupe d'AutoScaling."
  type        = number
}

variable "max_size" {
  description = "La taille maximale du groupe d'AutoScaling."
  type        = number
}

variable "lb_target_group_arn" {
  description = "L'ARN (Amazon Resource Name) du groupe cible associé au Load Balancer."
  type        = string
}

variable "tag_asg" {
  description = "The tag for the ASG EC2"
  type        = string
}
