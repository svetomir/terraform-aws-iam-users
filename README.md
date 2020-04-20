# Terraform AWS IAM Users

**terraform-aws-iam-users** is Terraform module for creating:
 * IAM User(s)

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| aws provider | >= 2.47 |

## Inputs

| Name | Description | Required |
|------|-------------|----------|
| users | Key-value mapping of IAM User(s). Key name is used for creating user's name, while value is an object with 2 variables: pgp_key and tags. **pgp_key** is used for encrypting user's password. **tags** is map(string) used for tagging user. | true
| force_destroy | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. Defaults to **false**. | false
| password_length | The length of the generated password on resource creation. Defaults to **20**. | false
| password_reset_required | Whether the user should be forced to reset the generated password on resource creation. Defaults to **true**. | false
| path | Path in which to create the user(s). Defaults to **/**. | false
| permissions_boundary | The ARN of the policy that is used to set the permissions boundary for the user(s). Defaults to **""**. | false
| tags | Key-value mapping of default tags for all IAM users. Defaults to **{}** | false

## Outputs

| Name | Description |
|------|-------------|
| arns | The list of all user's ARNs. |
| names | The list of all user's names. |
| unique_ids | The list of all user's unique_ids. |
| encrypted_passwords | The map of all user's encrypted passwords, base64 encoded. |
| key_fingerprints | The map of all user's fingerprints of the PGP keys used to encrypt the passwords. |
