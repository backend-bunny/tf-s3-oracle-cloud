terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 6.0"
    }
  }
}

# Create a bucket in Oracle Object Storage
resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = var.compartment_id
  name           = var.bucket_name
  namespace      = var.bucket_namespace
  access_type    = var.bucket_access_type

  versioning = var.versioning ? "Enabled" : "Disabled"

  metadata = merge(
    {
      "created_by" = "terraform"
      "purpose"    = var.bucket_name
    },
    var.tags
  )
}

resource "oci_identity_user" "bucket_user" {
  compartment_id = var.compartment_id
  name           = "${var.bucket_name}-user"
  description    = "User to manage ${var.bucket_name} Object Storage"
  email = var.service_account_email
}

resource "oci_identity_customer_secret_key" "bucket_user_secret_key" {
  user_id = oci_identity_user.bucket_user.id
  display_name = "${var.bucket_name}-SecretKey"
}

resource "oci_identity_group" "bucket_group" {
  compartment_id = var.compartment_id
  name           = "${var.bucket_name}-group"
  description    = "Group for ${var.bucket_name}-user"
}

resource "oci_identity_user_group_membership" "bucket_user_group_membership" {
  group_id = oci_identity_group.bucket_group.id
  user_id  = oci_identity_user.bucket_user.id
}

resource "oci_identity_policy" "bucket_group_policy" {
  compartment_id = var.compartment_id
  name           = "${var.bucket_name}-group-policy"
  description    = "Policy to allow ${var.bucket_name} group to access Object Storage"
  statements = [
    "Allow group ${var.bucket_name}-group to read objectstorage-namespaces in tenancy",
    "Allow group ${var.bucket_name}-group to read buckets in compartment id ${var.compartment_id}",
    "Allow group ${var.bucket_name}-group to manage objects in compartment id ${var.compartment_id}"
  ]
}

resource "oci_vault_secret" "bucket_secret" {
  compartment_id = var.compartment_id
  secret_name    = "${var.bucket_name}-secret-key"
  vault_id       = var.vault_id
  key_id         = var.vault_master_key_id
  secret_content {
    content_type = "BASE64"
    content      = base64encode(oci_identity_customer_secret_key.bucket_user_secret_key.key)
  }
}
