resource "aws_iam_user" "bucket" {
  name = "user"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "bucket" {
  user = aws_iam_user.bucket.name
}

data "aws_iam_policy_document" "lb_ro" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "lb_ro" {
  name   = "test"
  user   = aws_iam_user.bucket.name
  policy = data.aws_iam_policy_document.lb_ro.json
}