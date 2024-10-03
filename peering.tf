resource "aws_vpc_peering_connection" "peering" {
  count = var.is_pairing_required ? 1 : 0
  vpc_id        = aws_vpc.main.id   # requester VPC ID
  #peer_owner_id = data.aws_vpc.default.id # accepter OWNER ID
  peer_vpc_id   = data.aws_vpc.default.id
  
  auto_accept   = true  # auto accept true

  tags = merge(
    var.common_tags,
    var.peering_tags,
    {
        Name = "${local.resource_name}-default"
    }
  )
}

# we are creating the routes between two VPC's
resource "aws_route" "public_peering" {
  count = var.is_pairing_required ? 1 : 0 # route table will create when the pairing connection is true  
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "private_peering" {
  count = var.is_pairing_required ? 1 : 0 # route table will create when the pairing connection is true  
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
resource "aws_route" "database_peering" {
  count = var.is_pairing_required ? 1 : 0 # route table will create when the pairing connection is true  
  route_table_id            = aws_route_table.database.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}

