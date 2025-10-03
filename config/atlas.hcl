variable "db_user" {
  type    = string
  default = getenv("DB_USER")
}

variable "db_pass" {
  type    = string
  default = getenv("DB_PASSWORD")
}

variable "db_host" {
  type    = string
  default = getenv("DB_HOST")
}

variable "db_port" {
  type    = string
  default = getenv("DB_PORT")
}

variable "db_name" {
  type    = string
  default = getenv("DB_NAME")
}

locals {
  db_url = "mysql://${var.db_user}:${var.db_pass}@${var.db_host}:${var.db_port}/${var.db_name}"
  # db_url = "mysql://user:password@:13306/sample"
}

env "migrate" {
  src = "file://db/schema.hcl"
  url = local.db_url
}

env "local" {
  # src = "file://db/schema.hcl"
  url = local.db_url
  dev = "docker://mysql/8/dev"
  migration {
    dir = "file://db/migrations"
  }
  # format {
  #   migrate {
  #     diff = "{{ sql . \"  \" }}"
  #   }
  # }
}
