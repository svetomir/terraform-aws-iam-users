variable "users" {
    type = map(object({
        pgp_key = string
        tags    = map(string)
    }))
    default     = {}
    description = "Key-value mapping of IAM User(s)"
}

variable "force_destroy" {
    type = bool
    default = false
    description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
}

variable "password_length" {
    type    = number
    default = 20
    description = "The length of the generated password on resource creation."
}

variable "password_reset_required" {
    type    = bool
    default = true
    description = "Whether the user should be forced to reset the generated password on resource creation."
}

variable "path" {
    type        = string
    default     = "/"
    description = "Path in which to create the user(s)."
}

variable "permissions_boundary" {
    type        = string
    default     = ""
    description = "The ARN of the policy that is used to set the permissions boundary for the user(s)."
}

variable "tags" {
    type        = map(string)
    default     = {}
    description = "Key-value mapping of default tags for all IAM users."
}
