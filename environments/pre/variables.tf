variable "project" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
}

variable "env" {
  description = "The environment name (dev, pre, pro, shared)"
  type        = string
}
