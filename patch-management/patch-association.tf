resource "aws_ssm_patch_group" "group" {
  baseline_id = aws_ssm_patch_baseline.linux.id
  patch_group = "merit-labs"
}

resource "aws_ssm_association" "patching" {
  name = "AWS-RunPatchBaseline"

  targets {
    key    = "tag:PatchGroup"
    values = ["merit-labs"]
  }

  # Sunday early morning (before labs start)
  schedule_expression = "cron(0 2 ? * SUN *)"
}