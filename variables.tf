variable "folder_id" {
  type        = string
  description = "The parent folder ID to hold the project"
}

variable "name" {
  type        = string
  description = "The name of the project"
}

variable "billing_account_id" {
  type        = string
  description = "The billing account to associate the project to"
}

variable "create_network" {
  description = "The default vpc/subnet is created, by default we delete it"
  default     = false
}

variable "services" {
  description = "List of custom API's to enable on the project"
}
