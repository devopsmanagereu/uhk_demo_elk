provider "digitalocean" {
  token = "change_me_token"
}

resource "digitalocean_droplet" "dev" {
  name     = "dev"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-2vcpu-2gb"
  ssh_keys = ["change_me_ssh_key"]
}

output "dev_ip" {
  value = digitalocean_droplet.dev.ipv4_address
}