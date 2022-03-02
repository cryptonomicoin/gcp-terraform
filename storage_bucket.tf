resource "google_storage_bucket" "open-bucket" {
  name          = "open-bucket"
  location      = var.region
  project       = var.project
}

resource "google_storage_bucket_acl" "open-bucket-acl" {
  bucket = google_storage_bucket.open-bucket.name

  predefined_acl = publicReadWrite
}
