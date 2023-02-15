resource "google_compute_instance" "private_vm" {
  name         = "private_vm"
  machine_type = "e2-micro"
  zone         = "us-central1-b"
  allow_stopping_for_update = true

  depends_on = [
    google_container_cluster.private-cluster
   , google_container_node_pool.nodepool
  ]
  metadata_startup_script = "${file("./setp.sh")}"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size = 60
    
    }
  }
 
  network_interface {
    network = module.network.vpc_name_output
    subnetwork = module.network.subnet_1_name_output
   
  }
  service_account {
        email = google_service_account.project-service-account.email
        scopes = [ "cloud-platform" ]
}

}