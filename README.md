# AWS Task Definition Terraform module

This Terraform module creates an ECS task definition on AWS.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.58 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| container\_definitions | here you should include the full container definitons | `string` | `"[]"` | no |
| cpu | The number of CPU units used by the task. It can be expressed as an integer using CPU units, for example 1024, or as a string using vCPUs, for example '1 vCPU' or '1 vcpu'. | `string` | n/a | yes |
| create\_proxy\_configuration | n/a | `bool` | `false` | no |
| memory | The amount of memory (in MiB) used by the task. It can be expressed as an integer using MiB, for example 1024, or as a string using GB, for example '1GB' or '1 gb'. | `string` | n/a | yes |
| myVariable | This role is required by tasks to pull container images and publish container logs to Amazon CloudWatch on your behalf. | `string` | `"ecsTaskExecutionRole"` | no |
| name | Task definition name | `string` | n/a | yes |
| network\_mode | The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host. | `string` | n/a | yes |
| proxy\_configuration | n/a | <pre>list(object({<br>    type           = string<br>    container_name = string<br>    properties = object({<br>      AppPorts         = string<br>      EgressIgnoredIPs = string<br>      IgnoredUID       = string<br>      ProxyEgressPort  = number<br>      ProxyIngressPort = number<br>    })<br>  }))</pre> | `[]` | no |
| requires\_compatibilities | A set of launch types required by the task. The valid values are EC2 and FARGATE. | `string` | `"EC2"` | no |
| tags | Additional tags (e.g. `map('BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |
| task\_role | Optional IAM role that tasks can use to make API requests to authorized AWS services. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The created task definition ARN |
| name | n/a |
| revision | The created task definition ARN |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Youse Seguradora](https://github.com/youse-seguradora).

## License

Apache 2 Licensed. See LICENSE for full details.