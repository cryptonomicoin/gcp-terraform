resource "google_storage_bucket" "open-bucket" {
  name          = "open-bucket"
  location      = var.region
  project       = var.project
}

resource "google_storage_bucket" "public-bucket" {
  name          = "public-bucket"
  location      = var.region
  project       = var.project
  uniform_bucket_level_access = true
}


resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.open-bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}

resource "google_storage_bucket_acl" "open-bucket-acl" {
  bucket = google_storage_bucket.open-bucket.name

  role_entity = [
    "READER:allUsers",
  ]
}

resource "google_storage_default_object_access_control" "public_rule" {
  bucket = google_storage_bucket.public-bucket.name
  role   = "READER"
  entity = "allUsers"
}
