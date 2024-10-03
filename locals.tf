locals {
  resource_name = "${var.Project_name}-${var.environment}"
  az_names = slice(data.aws_availability_zones.available.names,0,2) # we are selecting the first two AZ's using slice.
}