resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = "roles/container.admin"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/editor"
  member  = "user:jane@example.com"
}

