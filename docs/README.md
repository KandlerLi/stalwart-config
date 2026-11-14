# stalwart-config

Split out of [`k3s-apps`](https://github.com/KandlerLi/k3s-apps)' `modules/stalwart_config`
so that k3s-apps holds no Terraform beyond what Argo CD can't deploy. The
objects were adopted from the admin UI with every live value mirrored (see
home-infra-docs' `stalwart-mail-server` runbook) and imported here on
2026-11-14 without recreating anything (stalwart-config#1).

## CI

`checks.yml` plans every PR and posts the plan; `apply.yml` applies on
merge to `main`. Both run on this repo's self-hosted runner in the k3s
cluster (k3s-bootstrap's `modules/github_runner`), the only place Stalwart's
management API (`stalwart-internal:8080` in `apps`) is reachable. Its
NetworkPolicy allows exactly that port and nothing else in the cluster; the
runner has no Kubernetes API token. AWS access goes through the repo's OIDC
roles (repo-infra): the S3 state under `stalwart-config/` and
`k3s-apps/stalwart` in Secrets Manager.

## Secrets

`k3s-apps/stalwart` holds `stalwart_api_token` (Stalwart's admin API key)
and `ses_smtp_username` (the SES relay route's username, also in
`home-infra/monitoring`; rotate both together). The SES password never
reaches this repo: the relay route reads it from Stalwart's
`SES_SMTP_PASSWORD` environment variable, which k3s-apps sets from its
own Secret.

## Running it from your laptop

Through a port-forward to the private Service, never the public hostname,
which sits behind Authelia forward-auth:

```zsh
k3s-tunnel && kubectl -n apps port-forward svc/stalwart-internal 18083:8080
```

Then, in a second terminal with your `aws login` session, `terraform init`
and `terraform plan` (`var.in_cluster` defaults to false, so the provider
uses `http://127.0.0.1:18083`).
