resource "random_integer" "salt" {
  min = 100000
  max = 999999
}

resource "google_project" "project" {
  folder_id           = var.folder_id
  name                = var.name
  project_id          = "${var.name}-${random_integer.salt.result}"
  billing_account     = var.billing_account_id
  auto_create_network = var.create_network
}

resource "google_project_service" "project_apis" {
  project = google_project.project.project_id
  count   = length(var.services)
  service = element(var.services, count.index)

  disable_dependent_services = true
  disable_on_destroy         = true
}
