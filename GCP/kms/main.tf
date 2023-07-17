resource "google_kms_key_ring" "keyring" {
  name = var.keyring_name
  location = var.region
  project = var.project
}

resource "google_kms_crypto_key" "key_composer" {
  name = var.key_name
  key_ring = google_kms_key_ring.keyring.id
  rotation_period = var.rotation_period
  version_template {
    algorithm = var.algorithm
  }
  lifecycle {
    prevent_destroy = true
  }
}

