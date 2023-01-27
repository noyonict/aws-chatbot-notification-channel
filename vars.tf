variable "configuration_name" {
  type        = string
  description = "The name of the configuration/slack channel. Member must satisfy regular expression pattern: [a-zA-Z][-a-zA-Z0-9]*"
  default     = "alerts-imga-utr"
}

variable "slack_channel_id" {
  type        = string
  description = "The ID of the Slack channel. To get the ID, open Slack, right click on the channel name in the left pane, then choose Copy Link. The channel ID is the 9-character string at the end of the URL. For example, ABCBBLZZZ."
  default     = "C04K5N7FKBK"

}

variable "slack_workspace_id" {
  type        = string
  description = "The ID of the Slack workspace authorized with AWS Chatbot. To get the workspace ID, you must perform the initial authorization flow with Slack in the AWS Chatbot console. Then you can copy and paste the workspace ID from the console. For more details, see steps 1-4 in [Setting Up AWS Chatbot with Slack](https://docs.aws.amazon.com/chatbot/latest/adminguide/setting-up.html#Setup_intro) in the AWS Chatbot User Guide."
  default     = "T0AQX1D2N"
}

variable "chatbot_role_arn" {
  type        = string
  description = "Role will used for pull message from SNS"
  default     = "arn:aws:iam::174846275587:role/aws-service-role/management.chatbot.amazonaws.com/AWSServiceRoleForAWSChatbot"
}

variable "logging_level" {
  type        = string
  description = "Specifies the logging level for this configuration. This property affects the log entries pushed to Amazon CloudWatch Logs. Logging levels include ERROR, INFO, or NONE."
  default     = "ERROR"
}

variable "tags" {
  type        = map(any)
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
  default     = {
    "Terraform" : true
  }
}

variable "regions" {
  default = [""]
}

terraform {
  required_version = ">= 0.12"
}
