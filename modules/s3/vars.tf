variable "bucket_name" {
  description = "Nom du bucket S3"
  type        = string
}

variable "s3_bucket_1_block_public_acl" {
  description = "Si les ACLs publics doivent être bloqués"
  type = bool
  default = true
}

variable "s3_bucket_1_block_public_policy" {
  description = "Si les politiques publiques doivent être bloquées."
  type = bool
  default = true
}

variable "s3_bucket_1_ignore_public_acls" {
  description = "Si les ACLs publics doivent être ignorés."
  type = bool
  default = true
}

variable "s3_bucket_1_restrict_public_buckets" {
  description = "Si l'accès public aux buckets doit être restreint."
  type = bool
  default = true
}

variable "s3_bucket_1_acl" {
  type = string
  default = "private"
}

variable "type_archive_file" {
  description = "Le type de fichier d'archive"
  type = string
}

variable "key_s3_bucket_object" {
  description = "La clé (chemin) de l'objet S3 à télécharger."
  type = string
}
