resource "aws_sns_topic" "chatbot_sns_topic" {
  name = "${var.configuration_name}-sns-topic"
  kms_master_key_id = "alias/aws/sns"

  tags = var.tags
}
