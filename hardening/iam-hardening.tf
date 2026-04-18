resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length = 12
  require_symbols         = true
  require_numbers         = true
}