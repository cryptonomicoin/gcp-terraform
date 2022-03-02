resource "google_storage_bucket" "open-bucket" {
  name          = "open-bucket"
  location      = var.region
  project       = var.project
}


resource "google_storage_bucket_iam_policy" "policy" {
  bucket = google_storage_bucket.open-bucket.name
  policy_data = data.google_iam_policy.public.policy_data
}

data "google_iam_policy" "public" {
  binding {
    role = "roles/storage.objectViewer"

    members = [
      "allUsers",
    ]
  }
