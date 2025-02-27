output "bucket_name" {
  description = "The name of the bucket"
  value       = oci_objectstorage_bucket.terraform_state.name
}

output "bucket_namespace" {
  description = "The namespace of the bucket"
  value       = oci_objectstorage_bucket.terraform_state.namespace
}

output "bucket_id" {
  description = "The ID of the bucket"
  value       = oci_objectstorage_bucket.terraform_state.id
}