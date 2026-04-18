resource "aws_ssm_patch_baseline" "linux" {
  name             = "merit-linux-patch-baseline"
  operating_system = "AMAZON_LINUX_2"

  approval_rule {
    approve_after_days = 3   # faster patching for labs

    patch_filter {
      key    = "CLASSIFICATION"
      values = ["Security", "Bugfix"]
    }
  }
}