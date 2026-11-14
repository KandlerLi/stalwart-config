variable "in_cluster" {
  description = <<-EOT
    true in CI, on the in-cluster runner: the provider talks to Stalwart's
    Service DNS name. false for a human's local run, through a
    `kubectl port-forward svc/stalwart-internal 18083:8080` on localhost.
  EOT
  type        = bool
  default     = false
}

variable "stalwart_endpoint" {
  description = <<-EOT
    Overrides the Stalwart API base URL var.in_cluster picks. Never the
    public stalwart.jkandler.de name: that sits behind Authelia
    forward-auth, which would redirect the provider's calls to a login page.
  EOT
  type        = string
  default     = null
}
