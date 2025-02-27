terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 6.0"
    }
  }
}

# Create a bucket in Oracle Object Storage
resource "oci_objectstorage_bucket" "terraform_state" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.bucket_namespace
  access_type    = var.bucket_access_type

  versioning = var.versioning ? "Enabled" : "Disabled"

  metadata = merge(
    {
      "created_by" = "terraform"
      "purpose"    = "terraform-state"
    },
    var.tags
  )
}
