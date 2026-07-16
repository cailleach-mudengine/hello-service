variable "git_organization" {
  type = string
  description = "GitHub Organization where to fetch variables" 
}

variable "initiative" {
  type = string
}

variable "environment" {
  type = string
  description = "Short Lifecycle identifier"
}

variable "service_name" { 
  type = string
  description = "Service name"
}

variable "revision" { 
  type = string
  description = "Revision"
}
