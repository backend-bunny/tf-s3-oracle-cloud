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

  compartment_id            = var.compartment_id
  bucket_namespace          = var.object_storage_namespace
  bucket_name               = "<BUCKET_NAME>"
  service_account_email     = "<SA_NAME>@<YOUR_DOMAIN>"
  vault_id                  = "<VAULT_OCID>"
  vault_managment_endpoint  = "<VAULT_ENDPOINT>"
  vault_master_key_id       = "<VAULT_MASTER_KEY_ID>"
}

output "bucket_details" {
  value = module.<BUCKET_NAME>_bucket
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_identity_customer_secret_key.bucket_user_secret_key](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_customer_secret_key) | resource |
| [oci_identity_group.bucket_group](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_group) | resource |
| [oci_identity_policy.bucket_group_policy](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_policy) | resource |
| [oci_identity_user.bucket_user](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user) | resource |
| [oci_identity_user_group_membership.bucket_user_group_membership](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/identity_user_group_membership) | resource |
| [oci_kms_key.bucket_key](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/kms_key) | resource |
| [oci_kms_vault.bucket_vault](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/kms_vault) | resource |
| [oci_objectstorage_bucket.bucket](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/objectstorage_bucket) | resource |
| [oci_vault_secret.bucket_secret](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/vault_secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_access_type"></a> [bucket\_access\_type](#input\_bucket\_access\_type) | The access type for the bucket (NoPublicAccess or ObjectRead) | `string` | `"NoPublicAccess"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the bucket to create | `string` | n/a | yes |
| <a name="input_bucket_namespace"></a> [bucket\_namespace](#input\_bucket\_namespace) | The namespace of the bucket (typically your tenancy name) | `string` | n/a | yes |
| <a name="input_compartment_id"></a> [compartment\_id](#input\_compartment\_id) | The OCID of the compartment where resources will be created | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | Email address of service account used for creating access key for bucket | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vault_id"></a> [vault\_id](#input\_vault\_id) | ocid of the vault used for storing secret access key | `string` | n/a | yes |
| <a name="input_vault_managment_endpoint"></a> [vault\_managment\_endpoint](#input\_vault\_managment\_endpoint) | endpoint used for accessing oracle vault | `string` | n/a | yes |
| <a name="input_vault_master_key_id"></a> [vault\_master\_key\_id](#input\_vault\_master\_key\_id) | ocid of the master key used for encrypting secret access key | `string` | n/a | yes |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable versioning for the bucket | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key"></a> [access\_key](#output\_access\_key) | Access Key for the Terraform User |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | The ID of the bucket |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The name of the bucket |
| <a name="output_bucket_namespace"></a> [bucket\_namespace](#output\_bucket\_namespace) | The namespace of the bucket |
| <a name="output_secret_ocid"></a> [secret\_ocid](#output\_secret\_ocid) | OCID of the stored secret in OCI Vault |
