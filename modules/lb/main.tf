resource "google_compute_global_address" "default" {
  name = "load-balancer-ip"
  labels = var.labels
}

resource "google_compute_backend_service" "default" {
  name        = "backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10

  backend {
    group = var.target_instance_groups[0]
  }
  labels = var.labels
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.self_link
  labels = var.labels
}

resource "google_compute_target_http_proxy" "default" {
  name   = "http-proxy"
  url_map = google_compute_url_map.default.self_link
  labels = var.labels
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "http-forwarding-rule"
  ip_address = google_compute_global_address.default.address
  port_range = "80"
  target     = google_compute_target_http_proxy.default.self_link
  labels = var.labels
}