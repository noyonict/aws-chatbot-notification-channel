resource "aws_sns_topic" "chatbot_sns_topic" {
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}

resource "aws_sns_topic" "chatbot_sns_topic_oregon" {
  provider = aws.oregon
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}

resource "aws_sns_topic" "chatbot_sns_topic_frankfurt" {
  provider = aws.frankfurt
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}

resource "aws_sns_topic" "chatbot_sns_topic_paris" {
  provider = aws.paris
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}

resource "aws_sns_topic" "chatbot_sns_topic_mumbai" {
  provider = aws.mumbai
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}

resource "aws_sns_topic" "chatbot_sns_topic_tokyo" {
  provider = aws.tokyo
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}

resource "aws_sns_topic" "chatbot_sns_topic_sao_paulo" {
  provider = aws.sao_paulo
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}
