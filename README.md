# stalwart-config

Stalwart's runtime settings as Terraform, through its management API:
HTTP CORS, the IP-ban allowlist for the k3s Pod network, the ACME provider,
the `jkandler.de` domain, the SES relay route and the outbound strategy.
Stalwart itself (Deployment, Services, volumes) is deployed by Argo CD from
[`k3s-apps`](https://github.com/KandlerLi/k3s-apps)' `argocd/stalwart`.

## Documentation

Setup, operations and design notes: [`docs/README.md`](docs/README.md)
