terraform {
  backend "s3" {
    # bucket         = "mon-bucket-terraform-tada" # Remplacer cette valeur
    # key            = "tada/terraform.tfstate"
    # region         = "us-west-2"    # Remplacer cette valeur
    # dynamodb_table = "ma-table-lock-terraform-tada" # Optionnel, si le verrouillage d'état est nécessaire
    # encrypt        = true
  }
}
