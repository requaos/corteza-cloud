resource "digitalocean_database_cluster" "corteza-cluster" {
  name       = "db-${var.db_cluster_engine}-${var.region}-88395"
  engine     = var.db_cluster_engine
  version    = var.db_cluster_engine_version
  size       = var.db_cluster_size
  region     = var.region
  node_count = 1
  tags       = [var.app]
}

resource "digitalocean_database_db" "corteza-database" {
  cluster_id = digitalocean_database_cluster.corteza-cluster.id
  name       = var.app
}

resource "digitalocean_database_user" "corteza-user" {
  cluster_id        = digitalocean_database_cluster.corteza-cluster.id
  name              = var.app
  mysql_auth_plugin = "mysql_native_password"
}

