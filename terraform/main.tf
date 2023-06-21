provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name     = "my-test-bucket"
  location = "us-central1"
}
