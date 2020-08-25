variable "token" {
  description = "DO Token"
}

variable "app" {
  description = "Application Name"
  default     = "corteza"
}

variable "region" {
  description = "DO Region"
  default     = "nyc3"
}

variable "os" {
  description = "Operating system"
  default     = "ubuntu"
}

variable "build_hash" {
  description = "current short commit hash of git repo"
  default     = "dev"
}

variable "droplet_image" {
  description = "DO Droplet base OS image"
  default     = "ubuntu-20-04-x64"
}

variable "droplet_size" {
  description = "DO Droplet size (slug)"
  default     = "s-1vcpu-2gb"
}

variable "db_cluster_size" {
  description = "DO DB Cluster size (slug)"
  default     = "db-s-1vcpu-1gb"
}

variable "db_cluster_engine" {
  description = "DO DB Cluster engine"
  default     = "mysql"
}

variable "db_cluster_engine_version" {
  description = "DO DB Cluster engine version"
  default     = "8"
}

variable "sshkey" {
  description = "Public ssh key (for Corteza user)"
}

variable "jwt_secret" {
  description = "Private signing key for jwt-based authenticatiopn"
}

variable "domain" {
  description = "Hosted domain"
}

variable "corteza_version" {
  description = "Version tag of the docker images to pull"
  default     = "latest"
}

variable "smtp_host" {
  description = "Host of the outbound email server"
}

variable "smtp_user" {
  description = "Username for authenticating with the outbound email server"
}

variable "smtp_password" {
  description = "Password for authenticating with the outbound email server"
}