variable "name" {
  type        = string
  description = "Task definition name"
}

variable "container_definitions" {
  description = "here you should include the full container definitons"
  default     = "[]"
}

variable "task_role" {
  type        = string
  description = "Optional IAM role that tasks can use to make API requests to authorized AWS services."
  default     = null
}

variable "execution_role_arn" {
  type        = string
  description = "This role is required by tasks to pull container images and publish container logs to Amazon CloudWatch on your behalf."
  default     = null
}

variable "network_mode" {
  type        = string
  description = "The Docker networking mode to use for the containers in the task. The valid values are none, bridge, awsvpc, and host."
  default     = null
  # validation {
  #   condition     = "none" || "bridge" || "awsvpc" || "host"
  #   error_message = "It is not a valid value"
  # }
}

variable "cpu" {
  type        = string
  description = "The number of CPU units used by the task. It can be expressed as an integer using CPU units, for example 1024, or as a string using vCPUs, for example '1 vCPU' or '1 vcpu'."
}
variable "memory" {
  type        = string
  description = "The amount of memory (in MiB) used by the task. It can be expressed as an integer using MiB, for example 1024, or as a string using GB, for example '1GB' or '1 gb'."
}

variable "requires_compatibilities" {
  description = "A set of launch types required by the task. The valid values are EC2 and FARGATE."
  default     = ["EC2", "FARGATE"]
  type        = set(string)

  # validation {
  #   condition     = ["EC2"] || ["FARGATE"] || ["EC2", "FARGATE"]
  #   error_message = "It is not a valid value"
  # }

}

variable "create_proxy_configuration" {
  type    = bool
  default = false
}

variable "proxy_configuration" {
  type = list(object({
    type           = string
    container_name = string
    properties = object({
      AppPorts         = string
      EgressIgnoredIPs = string
      IgnoredUID       = string
      ProxyEgressPort  = number
      ProxyIngressPort = number
    })
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}
