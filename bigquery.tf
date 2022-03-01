resource "google_bigquery_dataset" "public" {
  dataset_id                  = "public"
  friendly_name               = "test"
  description                 = "This dataset is public"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  access {
    role          = "OWNER"
    user_by_email = google_service_account.bqowner.email
  }

  access {
    role   = "READER"
    domain = "nimbussec.com"
  }
}


resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}
