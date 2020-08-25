provider "digitalocean" {
  token = var.token
}

resource "digitalocean_project" "corteza-oasis-pools" {
  name        = "oasis-pools"
  description = "A Corteza CRM project."
  purpose     = "Web Application"
  environment = "Production"
  resources = [
    digitalocean_domain.corteza-domain.urn,
    digitalocean_droplet.corteza-server.urn,
    digitalocean_database_cluster.corteza-cluster.urn,
  ]
}

resource "digitalocean_domain" "corteza-domain" {
  name       = var.domain
  ip_address = digitalocean_droplet.corteza-server.ipv4_address
}

resource "digitalocean_record" "api" {
  domain = digitalocean_domain.corteza-domain.name
  type   = "A"
  name   = "api"
  value  = digitalocean_droplet.corteza-server.ipv4_address
}
