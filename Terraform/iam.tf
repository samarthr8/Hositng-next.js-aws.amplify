# Create IAM role for Amplify service
resource "aws_iam_role" "amplify_service_role" {
  name = "AmplifyServiceRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "amplify.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Create IAM policy for Amplify service
resource "aws_iam_policy" "amplify_service_policy" {
  name        = "AmplifyServicePolicy"
  description = "Policy for Amplify service to access AWS resources"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "cloudfront:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach the IAM policy to the Amplify service role
resource "aws_iam_role_policy_attachment" "amplify_service_policy_attachment" {
  policy_arn = aws_iam_policy.amplify_service_policy.arn
  role       = aws_iam_role.amplify_service_role.name
}

