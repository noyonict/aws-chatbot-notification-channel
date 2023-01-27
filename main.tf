locals {
  cf_name = replace(var.configuration_name, "_", "-")
}

data "local_file" "cloudformation_template" {
  filename = "${path.module}/cloudformation.yml"
}

locals {
  sns_topic_arns = [
    aws_sns_topic.chatbot_sns_topic.arn,
    aws_sns_topic.chatbot_sns_topic_oregon.arn,
    aws_sns_topic.chatbot_sns_topic_frankfurt.arn,
    aws_sns_topic.chatbot_sns_topic_paris.arn,
    aws_sns_topic.chatbot_sns_topic_tokyo.arn,
    aws_sns_topic.chatbot_sns_topic_mumbai.arn,
    aws_sns_topic.chatbot_sns_topic_sao_paulo.arn
  ]
}

resource "aws_cloudformation_stack" "chatbot_slack_configuration" {
  name = "${local.cf_name}-slack"

  template_body = data.local_file.cloudformation_template.content

  parameters = {
    ConfigurationNameParameter = var.configuration_name
    IamRoleArnParameter        = var.chatbot_role_arn
    LoggingLevelParameter      = var.logging_level
    SlackChannelIdParameter    = var.slack_channel_id
    SlackWorkspaceIdParameter  = var.slack_workspace_id
    SnsTopicArnsParameter      = join(",", local.sns_topic_arns)
  }

  tags = var.tags
}
