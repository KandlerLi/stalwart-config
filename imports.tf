# Adopts the objects k3s-apps' modules/stalwart_config managed (removed there with destroy = false); delete after the first apply.

import {
  to = stalwart_http.this
  id = "singleton"
}

import {
  to = stalwart_mta_outbound_strategy.this
  id = "singleton"
}

import {
  to = stalwart_allowed_ip.k3s_pods
  id = "jfpya1vkaaqb"
}

import {
  to = stalwart_acme_provider.letsencrypt
  id = "jf7gwr0uaaqb"
}

import {
  to = stalwart_domain.jkandler_de
  id = "b"
}

import {
  to = stalwart_mta_route_relay.ses
  id = "jfsyiqdyaaaa"
}
