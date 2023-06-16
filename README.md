# Loki
Loki is a horizontally-scalable, highly-available, multi-tenant log aggregation system inspired by Prometheus. It is designed to be very cost effective and easy to operate. It does not index the contents of the logs, but rather a set of labels for each log stream.

The Loki project was started at Grafana Labs in 2018, and annouced at KubeCon Seattle. Loki is released under the Apache 2.0 License.

Grafana Labs is proud to lead the development of the Loki project, building first-class support for Loki into Grafana, and ensuring Grafana Labs customers receive Loki support and features they need.

[Loki Documentation](https://github.com/grafana/loki/blob/master/docs/README.md)

[Loki Releases](https://github.com/grafana/loki/releases)

[Loki Source](https://github.com/grafana/loki)


## Loki is part of Swiss Army Kube project
Check out main repo of Swiss Army Kube for more information about the project in general.

**[Swiss Army Kube](https://github.com/provectus/swiss-army-kube)**
|
**[Contributing Guide](https://github.com/provectus/swiss-army-kube/blob/master/CONTRIBUTING.md)**

## Example how to use this module

```
module "loki" {
  module_depends_on = [module.argocd]
  source            = "github.com/provectus/sak-loki.git"
  cluster_name      = module.eks.cluster_id
  argocd            = module.argocd.state
  domains           = local.domain
}
```

## Requirements

```
terraform >= 1.1
```

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)                      | n/a     |
| <a name="provider_helm"></a> [helm](#provider_helm)                   | n/a     |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | n/a     |
| <a name="provider_local"></a> [local](#provider_local)                | n/a     |
| <a name="provider_random"></a> [random](#provider_random)             | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                   | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_kms_ciphertext.grafana_loki_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_ciphertext) | resource    |
| [aws_ssm_parameter.grafana_loki_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter)   | resource    |
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)                              | resource    |
| [kubernetes_namespace.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace)              | resource    |
| [local_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)                                  | resource    |
| [random_password.grafana_loki_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password)       | resource    |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster)                     | data source |

## Inputs

| Name                                                                                             | Description                                            | Type           | Default                       | Required |
| ------------------------------------------------------------------------------------------------ | ------------------------------------------------------ | -------------- | ----------------------------- | :------: |
| <a name="input_argocd"></a> [argocd](#input_argocd)                                              | A set of values for enabling deployment through ArgoCD | `map(string)`  | n/a                           |   yes    |
| <a name="input_chart_version"></a> [chart_version](#input_chart_version)                         | A Helm Chart version                                   | `string`       | `"2.3.1"`                     |    no    |
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name)                            | A name of the Amazon EKS cluster                       | `string`       | `null`                        |    no    |
| <a name="input_conf"></a> [conf](#input_conf)                                                    | A custom configuration for deployment                  | `map(string)`  | `{}`                          |    no    |
| <a name="input_domains"></a> [domains](#input_domains)                                           | A list of domains to use for ingresses                 | `list(string)` | <pre>[<br> "local"<br>]</pre> |    no    |
| <a name="input_grafana_loki_password"></a> [grafana_loki_password](#input_grafana_loki_password) | Password for grafana admin                             | `string`       | `""`                          |    no    |
| <a name="input_module_depends_on"></a> [module_depends_on](#input_module_depends_on)             | A list of explicit dependencies                        | `list(any)`    | `[]`                          |    no    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                                     | A name of the existing namespace                       | `string`       | `""`                          |    no    |
| <a name="input_namespace_name"></a> [namespace_name](#input_namespace_name)                      | A name of namespace for creating                       | `string`       | `"logging"`                   |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                    | A tags for attaching to new created AWS resources      | `map(string)`  | `{}`                          |    no    |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_path_to_grafana_loki_password"></a> [path\_to\_grafana\_loki\_password](#output\_path\_to\_grafana\_loki\_password) | A SystemManager ParemeterStore key with Grafana admin password |