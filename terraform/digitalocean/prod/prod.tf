provider "digitalocean" {
  token = "change_me_token"
}

resource "digitalocean_droplet" "prod-db" {
  name     = "prod-db"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_loadbalancer" "prod-broker-lb" {
  name   = "prod-load-balancer-activemq"
  region = "fra1"

  forwarding_rule {
    entry_port     = 8161
    entry_protocol = "http"

    target_port     = 8161
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port     = 61616
    entry_protocol = "tcp"

    target_port     = 61616
    target_protocol = "tcp"
  }

  healthcheck {
    port     = 8161
    protocol = "http"
    path = "/"
  }

  droplet_ids = [digitalocean_droplet.prod-broker-1.id, digitalocean_droplet.prod-broker-2.id]
}

resource "digitalocean_droplet" "prod-broker-1" {
  name     = "prod-broker-1"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "prod-broker-2" {
  name     = "prod-broker-2"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "prod-control" {
  name     = "prod-control"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "prod-computation-module-1" {
  name     = "prod-computation-module-1"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "c-2"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "prod-computation-module-2" {
  name     = "prod-computation-module-2"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "c-2"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "prod-computation-module-3" {
  name     = "prod-computation-module-3"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "c-2"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "prod-computation-module-4" {
  name     = "prod-computation-module-4"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "c-2"
  ssh_keys = ["change_me_ssh_key"]
}

output "prod_db_ip" {
  value = digitalocean_droplet.prod-db.ipv4_address
}

output "prod_broker_lb_ip" {
  value = digitalocean_loadbalancer.prod-broker-lb.ip
}

output "prod_broker_1_ip" {
  value = digitalocean_droplet.prod-broker-1.ipv4_address
}

output "prod_broker_2_ip" {
  value = digitalocean_droplet.prod-broker-2.ipv4_address
}

output "prod_control_ip" {
  value = digitalocean_droplet.prod-control.ipv4_address
}

output "prod_computation_module_1_ip" {
  value = digitalocean_droplet.prod-computation-module-1.ipv4_address
}

output "prod_computation_module_2_ip" {
  value = digitalocean_droplet.prod-computation-module-2.ipv4_address
}

output "prod_computation_module_3_ip" {
  value = digitalocean_droplet.prod-computation-module-3.ipv4_address
}

output "prod_computation_module_4_ip" {
  value = digitalocean_droplet.prod-computation-module-4.ipv4_address
}
