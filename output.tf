output "arns" {
    value = [
        for user in aws_iam_user.main: aws_iam_user.main[user.name].arn
    ]
    description = "The list of all user's ARNs"
}

output "names" {
    value = [
        for user in aws_iam_user.main: aws_iam_user.main[user.name].name
    ]
    description = "The list of all user's names"
}

output "unique_ids" {
    value = [
        for user in aws_iam_user.main: aws_iam_user.main[user.name].unique_id
    ]
    description = "The list of all user's unique_ids"
}

output "encrypted_passwords" {
    value = {
        for user in aws_iam_user.main:
        user.name => aws_iam_user_login_profile.main[user.name].encrypted_password
    }
    description = "The map of all user's encrypted passwords, base64 encoded."
}

output "key_fingerprints" {
    value = {
        for user in aws_iam_user.main:
        user.name => aws_iam_user_login_profile.main[user.name].key_fingerprint
    }
    description = "The map of all user's fingerprints of the PGP keys used to encrypt the passwords."
}
