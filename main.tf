# main.tf

provider "google" {
  credentials = file("/path/to/gcp_credentials.json")
  project     = "krishtest-390320"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name     = "my-test-bucket"
  location = "us-central1"
}
