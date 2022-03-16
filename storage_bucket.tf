resource "google_storage_bucket" "really-open-bucket" {
  name          = "really-open-bucket"
  location      = var.region
  project       = var.project
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "public-bucket-cycse" {
  name          = "public-bucket-cycse"
  location      = var.region
  project       = var.project
  uniform_bucket_level_access = true
}