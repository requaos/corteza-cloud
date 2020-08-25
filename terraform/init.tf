terraform {
  backend "remote" {
    organization = "requaos"

    workspaces {
      name = "prod-corteza-nyc3"
    }
  }
}

