resource "google_service_account" "composer_sa" {
  account_id   = var.composer_sa
  display_name = "Composer Service Account"
}
resource "google_project_iam_member" "composer_sa" {
  for_each  = toset([
    "roles/bigquery.dataEditor",
    "roles/bigquery.resourceEditor",
    "roles/bigquery.user",
    "roles/composer.admin",
    "roles/composer.sharedVpcAgent",
    "roles/composer.user",
    "roles/composer.worker",
    "roles/dataflow.developer",
    "roles/storage.objectViewer",
    "roles/container.developer",
    "roles/secretmanager.secretAccessor",
    "roles/iam.serviceAccountUser",
    "roles/storage.objectCreator",
    "roles/storage.objectViewer",
  ])
  role = each.value
  member = "serviceAccount:${google_service_account.composer_sa}"
  project = var.project_id
}

resource "google_service_account" "other_sa" {
  account_id   = var.other_sa
  display_name = "Other Service Account"
}
resource "google_project_iam_member" "other_sa" {
  for_each  = toset([
    "roles/bigquery.dataEditor",
    "roles/bigquery.filteredDataViewer",
    "roles/cloudkms.cryptoKeyEncrypterDecrypter",
    "roles/dataflow.developer",
    "roles/dataflow.viewer",
    "roles/dataflow.worker",
    "roles/secretmanager.secretAccessor",
    "roles/storage.objectCreator",
    "roles/storage.objectViewer",
  ])
  role = each.value
  member = "serviceAccount:${google_service_account.other_sa}"
  project = var.project_id
}