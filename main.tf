# main.tf

provider "google" {
  credentials = file("krishtest-390320-55a2c26ed699.json")
  project     = "krishtest-390320"
  region      = "us-central1"
}

resource "google_storage_bucket" "my_bucket" {
  name     = "my-test-bucket"
  location = "us-central1"
}
