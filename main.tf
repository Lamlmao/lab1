terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "image" {
  name = var.image
}

resource "docker_container" "container" {
  image = docker_image.image.image_id
  name  = var.container_name
  ports {
    external = var.external_port
    internal = var.internal_port 
  }
}