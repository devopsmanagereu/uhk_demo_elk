provider "digitalocean" {
  token = "change_me_token"
}

resource "digitalocean_droplet" "iop-db" {
  name     = "iop-db"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "iop-broker" {
  name     = "iop-broker"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "iop-control" {
  name     = "iop-control"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

resource "digitalocean_droplet" "iop-computation-module" {
  name     = "iop-computation-module"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-1vcpu-1gb"
  ssh_keys = ["change_me_ssh_key"]
}

output "iop_db_ip" {
  value = digitalocean_droplet.iop-db.ipv4_address
}

output "iop_broker_ip" {
  value = digitalocean_droplet.iop-broker.ipv4_address
}

output "iop_control_ip" {
  value = digitalocean_droplet.iop-control.ipv4_address
}

output "iop_computation_module_ip" {
  value = digitalocean_droplet.iop-computation-module.ipv4_address
}