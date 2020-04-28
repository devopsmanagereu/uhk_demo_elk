provider "digitalocean" {
  token = "change_me_token"
}

resource "digitalocean_droplet" "elk" {
  name     = "elk"
  image    = "centos-7-x64"
  region   = "FRA1"
  size     = "s-4vcpu-8gb"
  ssh_keys = ["change_me_ssh_key"]
}

output "elk_ip" {
  value = digitalocean_droplet.elk.ipv4_address
}
