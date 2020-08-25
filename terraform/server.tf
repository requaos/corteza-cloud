resource "digitalocean_droplet" "corteza-server" {
  image     = var.droplet_image
  name      = "${var.os}-${var.droplet_size}-${var.region}-${var.build_hash}-${var.app}"
  region    = var.region
  size      = var.droplet_size
  tags      = [var.app]
  user_data = data.template_file.userdata.rendered
}

data "template_file" "env" {
  template = file("${path.module}/templates/env.tpl")

  vars = {
    DOMAIN     = var.domain
    DB_DSN     = "${digitalocean_database_user.corteza-user.name}:${digitalocean_database_user.corteza-user.password}@tcp(${digitalocean_database_cluster.corteza-cluster.host}:${digitalocean_database_cluster.corteza-cluster.port})/${digitalocean_database_db.corteza-database.name}?collation=utf8mb4_general_ci"
    JWT_SECRET = var.jwt_secret
    VERSION    = var.corteza_version
    SMTP_HOST  = var.smtp_host
    SMTP_USER  = var.smtp_user
    SMTP_PASS  = var.smtp_password
  }
}

data "template_file" "userdata" {
  template = file("${path.module}/templates/main.tpl")

  vars = {
    userdata_sshkey           = var.sshkey
    corteza_env               = base64encode(data.template_file.env.rendered)
    corteza_compose           = base64encode(file("${path.module}/../corteza/docker-compose.yml"))
    corteza_service           = base64encode(file("${path.module}/../corteza/corteza.service"))
    corteza_nginx_custom_conf = base64encode(file("${path.module}/../corteza-nginx/custom.conf"))
    corteza_nginx_compose     = base64encode(file("${path.module}/../corteza-nginx/docker-compose.yml"))
    corteza_nginx_service     = base64encode(file("${path.module}/../corteza-nginx/letsencrypt-nginx.service"))
  }
}
