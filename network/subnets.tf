resource "google_compute_subnetwork" "management_subnet" {
  name          = var.subnet_1_name
  ip_cidr_range = var.subnet_1_cidr
  region        = "us-east4"
  network       = google_compute_network.my_vpc.id  
  private_ip_google_access = true
    secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.0.3.0/24"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.0.4.0/24"
  }
}