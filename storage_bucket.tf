resource "google_storage_bucket" "open-bucket" {
  name          = "open-bucket"
  location      = var.region
  project       = var.project
}


resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.open-bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}
