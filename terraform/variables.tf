variable "compartment_id" {
  description = "The OCID of the compartment where resources will be created"
  type        = string
}

variable "bucket_name" {
  description = "Name of the bucket to create"
  type        = string
}

variable "bucket_namespace" {
  description = "The namespace of the bucket (typically your tenancy name)"
  type        = string
}

variable "bucket_access_type" {
  description = "The access type for the bucket (NoPublicAccess or ObjectRead)"
  type        = string
  default     = "NoPublicAccess"
}

variable "versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "service_account_email" {
  description = "Email address of service account used for creating access key for bucket"
  type = string
}

variable "vault_id" {
  description = "ocid of the vault used for storing secret access key"
  type = string
}

variable "vault_managment_endpoint" {
  description = "endpoint used for accessing oracle vault"
  type = string
}

variable "vault_master_key_id" {
  description = "ocid of the master key used for encrypting secret access key"
  type = string
}
