resource "google_compute_network" "my_vpc" {
  project                 = "abdallah-iti-377721"
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1460
}