resource "google_project_iam_policy" "project" {
  project     = var.project_id
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "user:abhishek@loyal-network-323915.iam.gserviceaccount.com",
    ]
  }
}

resource "google_project_iam_binding" "project" {
  project = var.project_id
  role    = "roles/container.admin"

  members = [
    "user:abhishek@loyal-network-323915.iam.gserviceaccount.com",
  ]
}

resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = "roles/editor"
  member  = "user:abhishek@loyal-network-323915.iam.gserviceaccount.com"
}

resource "google_project_iam_custom_role" "my-custom-role" {
  role_id     = "myCustomRole"
  title       = "My Custom Role"
  description = "A description"
  permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
}

