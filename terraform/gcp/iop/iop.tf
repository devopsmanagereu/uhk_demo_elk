provider "google" {
  project = "change_me_project_id"
  region  = "change_me_region"
  zone    = "change_me_zone"
}

resource "google_compute_network" "vpc_network" {
  name                    = "terraform-network"
  auto_create_subnetworks = "true"
}

resource "google_compute_instance" "iop-db" {
  name         = "iop-db"
  machine_type = "g1-small"

  boot_disk {
    initialize_params {
      image = "centos-7-v20210316"
    }
  }

  metadata = {
    sshKeys = "change_me_username:change_me_id_rsa_pub"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "iop-broker" {
  name         = "iop-broker"
  machine_type = "g1-small"

  boot_disk {
    initialize_params {
      image = "centos-7-v20210316"
    }
  }

  metadata = {
    sshKeys = "change_me_username:change_me_id_rsa_pub"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "iop-control" {
  name         = "iop-control"
  machine_type = "g1-small"

  boot_disk {
    initialize_params {
      image = "centos-7-v20210316"
    }
  }

  metadata = {
    sshKeys = "change_me_username:change_me_id_rsa_pub"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

resource "google_compute_instance" "iop-computation-module" {
  name         = "iop-computation-module"
  machine_type = "g1-small"

  boot_disk {
    initialize_params {
      image = "centos-7-v20210316"
    }
  }

  metadata = {
    sshKeys = "change_me_username:change_me_id_rsa_pub"
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

# TODO add firewall ports 8080, 8081, 8161, 61616