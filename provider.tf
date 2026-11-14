# Ambient auth: CI's OIDC role, or a local login session.
provider "aws" {
  region = "eu-central-1"
}

# Talks to the management API over the private Service, never the public hostname Authelia guards.
provider "stalwart" {
  endpoint = coalesce(var.stalwart_endpoint, var.in_cluster ? "http://stalwart-internal.apps.svc.cluster.local:8080" : "http://127.0.0.1:18083")
  token    = local.stalwart["stalwart_api_token"]
}
