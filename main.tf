resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id              = var.aws_vpc
  cidr_block          = var.secondary_cidr
}

resource "aws_subnet" "private" {
  count = var.private_subnets

  vpc_id               = var.aws_vpc
  cidr_block           = var.private_subnets[count.index]
  availability_zone    = var.availability_zones[count.index]
  availability_zone_id = var.availability_zones[count.index]

  tags = {
      "Name" = format(
        "${var.project_name}-private-sn-%s",
        element(var.availability_zones, count.index),
      )
    }
}

resource "aws_route_table" "private" {
  vpc_id = var.aws_vpc
   route {
    cidr_block        = "0.0.0.0/0"
    gateway_id        = var.shared_transit_gateway_id
  }
  tags = {
    "Name" = "${var.project_name}-private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  subnet_id            = element(aws_subnet.private[*].id, count.index)
  route_table_id       = aws_route_table.private.id
}
