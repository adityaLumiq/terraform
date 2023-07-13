resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.big_query_dataset
  location = "asia-south1"
}
resource "google_logging_project_sink" "big_query" {
  name = var.logs_sink
  destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.stackdriver_logging.dataset_id}"
  unique_writer_identity = true
}