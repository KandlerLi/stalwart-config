# Stalwart's admin API key and the SES SMTP username, read from Secrets Manager at plan time.
data "aws_secretsmanager_secret_version" "stalwart" {
  secret_id = "k3s-apps/stalwart"
}

locals {
  stalwart = jsondecode(data.aws_secretsmanager_secret_version.stalwart.secret_string)
}
