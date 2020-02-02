resource "aws_iam_user" "main" {
    for_each = var.users

    name                 = each.key
    force_destroy        = var.force_destroy
    path                 = var.path
    permissions_boundary = var.permissions_boundary
    tags                 = merge(each.value.tags, var.tags)
}

resource "aws_iam_user_login_profile" "main" {
    for_each = aws_iam_user.main

    user                    = each.value.name
    password_length         = var.password_length
    password_reset_required = var.password_reset_required
    pgp_key                 = var.users[each.value.name].pgp_key
    
    depends_on = [aws_iam_user.main]
}
