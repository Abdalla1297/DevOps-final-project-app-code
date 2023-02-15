#create new service account for gke 
resource "google_service_account" "project-service-account" {
  account_id = "project-service-account"
  project = "abdallah-iti-377721"
}
#grant permissions for service account
resource "google_project_iam_binding" "project-service-account-iam"{
  project = "abdallah-iti-377721"
  role    = "roles/container.admin"
  members = [
    "serviceAccount:${google_service_account.project-service-account.email}"
  ]
}
