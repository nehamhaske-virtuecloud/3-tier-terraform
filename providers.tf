provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "Project" : "neha-3tier"
      "Environment" : "Dev"
    }
  }
}
