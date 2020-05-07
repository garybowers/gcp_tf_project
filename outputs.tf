output "project_id" {
  value = google_project.project.project_id
}

output "salt" {
  value = random_integer.salt.result
}
