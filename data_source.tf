data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
    default = true # it will fetch the default VPC info in the same account.
}