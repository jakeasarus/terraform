#############################################################################
# Terraform module which creates Session Manager resources on AWS.
#############################################################################
# https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager.html

######################################
# SSM Document
######################################
# https://docs.aws.amazon.com/systems-manager/latest/userguide/getting-started-configure-preferences-cli.html

# https://www.terraform.io/docs/providers/aws/r/ssm_document.html
resource "aws_ssm_document" "default" {
  name            = var.ssm_document_name
  document_type   = "Session"
  document_format = "JSON"
  tags            = merge({ "Name" = var.ssm_document_name }, var.tags)

  content = jsonencode({
    schemaVersion = "1.0"
    description   = "Document to hold regional settings for Session Manager"
    sessionType   = "Standard_Stream"
    inputs = {
      s3BucketName                = var.s3_bucket_name
      s3KeyPrefix                 = var.s3_key_prefix
      s3EncryptionEnabled         = var.s3_encryption_enabled
      cloudWatchLogGroupName      = var.cloudwatch_log_group_name
      cloudWatchEncryptionEnabled = var.cloudwatch_encryption_enabled
    }
  })
}

######################################
# Session Manager IAM Instance Profile
######################################
# https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-getting-started-instance-profile.html

# https://www.terraform.io/docs/providers/aws/r/iam_instance_profile.html
resource "aws_iam_instance_profile" "default" {
  name = "ssm-service-role"
  role = aws_iam_role.default.name
  path = var.iam_path
}

# https://www.terraform.io/docs/providers/aws/r/iam_role.html
resource "aws_iam_role" "default" {
  name               = local.iam_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  path               = var.iam_path
  description        = var.description
  tags               = merge({ "Name" = local.iam_name }, var.tags)
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# https://www.terraform.io/docs/providers/aws/r/iam_policy.html
resource "aws_iam_policy" "default" {
  name        = local.iam_name
  policy      = local.iam_policy
  path        = var.iam_path
  description = var.description
}

# https://www.terraform.io/docs/providers/aws/r/iam_role_policy_attachment.html
resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

locals {
  iam_name   = "${var.name}-session-manager"
  iam_policy = var.iam_policy == "" ? data.aws_iam_policy.default.policy : var.iam_policy
}

data "aws_iam_policy" "default" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
