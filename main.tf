locals {
  cf_name = replace(var.configuration_name, "_", "-")
}

resource "aws_cloudformation_stack" "chatbot_slack_configuration" {
  name = "${local.cf_name}-slack"

  template_body = data.local_file.cloudformation_template.content

  parameters = {
    ConfigurationNameParameter = var.configuration_name
    IamRoleArnParameter        = aws_iam_role.chatbot.arn
    LoggingLevelParameter      = var.logging_level
    SlackChannelIdParameter    = var.slack_channel_id
    SlackWorkspaceIdParameter  = var.slack_workspace_id
    SnsTopicArnsParameter      = aws_sns_topic.chatbot_sns_topic.arn
  }

  tags = var.tags
}

data "local_file" "cloudformation_template" {
  filename = "${path.module}/cloudformation.yml"
}

resource "aws_iam_role" "chatbot" {
  name = "${var.configuration_name}_chatbot"
  assume_role_policy = data.aws_iam_policy_document.assume.json
  tags               = var.tags
}

data "aws_iam_policy_document" "assume" {
  version = "2012-10-17"
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      identifiers = ["chatbot.amazonaws.com"]
      type        = "Service"
    }
    effect = "Allow"
  }
}

resource "aws_iam_role_policy_attachment" "cloudwatch-readonly-policy-attachment" {
  role       = aws_iam_role.chatbot.id
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}

resource "aws_sns_topic" "chatbot_sns_topic" {
  name = "${var.configuration_name}-sns-topic"
  kms_master_key_id = var.kms_key != "" ? var.kms_key : "alias/aws/sns"
  tags = var.tags
}


