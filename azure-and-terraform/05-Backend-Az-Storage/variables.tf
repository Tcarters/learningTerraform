variable "default_RGroup" {
    default = "rg-Backend-TF"
  
}

variable "subscription_id" {
  
}

variable "tenant_id" {
  
}

variable "default_Location" {
    type = string
    default = "France Central"
}

variable "StorageName" {
  type = string
  default = "stgeaccountbackendtf01"
}

variable "containerN" {
    type = string
    default = "container01-for-backend-tf"
  
}