resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

module "template_files" {
  source = "hashicorp/dir/template"

  base_dir = "${path.module}/site"
}