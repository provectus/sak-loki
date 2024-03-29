variable "argocd" {
  type        = map(string)
  description = "A set of values for enabling deployment through ArgoCD"
}

variable "conf" {
  type        = map(string)
  description = "A custom configuration for deployment"
  default     = {}
}

# For depends_on queqe
variable "module_depends_on" {
  default     = []
  type        = list(any)
  description = "A list of explicit dependencies"
}

variable "cluster_name" {
  type        = string
  default     = "swiss-army-kube"
  description = "A name of the Amazon EKS cluster"
}

variable "grafana_loki_password" {
  type        = string
  description = "Password for grafana admin"
  default     = ""
}

variable "domains" {
  type        = list(string)
  default     = ["local"]
  description = "A list of domains to use for ingresses"
}

variable "namespace" {
  type        = string
  default     = ""
  description = "A name of the existing namespace"
}

#pumped chart version
variable "chart_version" {
  type        = string
  description = "A Helm Chart version"
  default     = "2.3.1"
}

