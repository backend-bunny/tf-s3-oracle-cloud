output "bucket_name" {
  description = "The name of the bucket"
  value       = oci_objectstorage_bucket.bucket.name
}

output "bucket_namespace" {
  description = "The namespace of the bucket"
  value       = oci_objectstorage_bucket.bucket.namespace
}

output "bucket_id" {
  description = "The ID of the bucket"
  value       = oci_objectstorage_bucket.bucket.id
}

output "access_key" {
  value = oci_identity_customer_secret_key.bucket_user_secret_key.id
  description = "Access Key for the Terraform User"
}

output "secret_ocid" {
  value       = oci_vault_secret.bucket_secret.id
  description = "OCID of the stored secret in OCI Vault"
}
