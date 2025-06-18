# ------------------- PROVIDER -------------------
provider "aws" {
  region = var.region
}

tags = {
  Owner       = "Neha Mhaske"
  Environment = "dev"
  Project     = "3-tier-terraform"
}
