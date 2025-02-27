# TF-S3-ORACLE-CLOUD

## module usage

```hcl
provider "oci" {
  tenancy_ocid     = var.compartment_id
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "<BUCKET_NAME>_bucket" {
  source = "git::https://github.com/backend-bunny/tf-s3-oracle-cloud.git//terraform?ref=<VERSION>"

  compartment_id   = var.compartment_id
  bucket_namespace = var.object_storage_namespace
  bucket_name      = "<BUCKET_NAME>"
}

output "bucket_details" {
  value = module.<BUCKET_NAME>_bucket
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_objectstorage_bucket.terraform_state](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_access_type"></a> [bucket\_access\_type](#input\_bucket\_access\_type) | The access type for the bucket (NoPublicAccess or ObjectRead) | `string` | `"NoPublicAccess"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the bucket to create | `string` | `"terraform-state-bucket"` | no |
| <a name="input_bucket_namespace"></a> [bucket\_namespace](#input\_bucket\_namespace) | The namespace of the bucket (typically your tenancy name) | `string` | n/a | yes |
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The OCID of the compartment where resources will be created | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable versioning for the bucket | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The ID of the bucket |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the bucket |
| <a name="output_bucket_namespace"></a> [bucket\_namespace](#output\_bucket\_namespace) | The namespace of the bucket |
