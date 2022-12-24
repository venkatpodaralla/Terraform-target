resource "aws_vpc_ipv4_cidr_block_association" "secondary_cidr" {
  vpc_id     = var.aws_vpc
  cidr_block = var.secondary_cidr

   tags = {
    Name = join("-", [var.project_name, "vpc"])
  }

}

resource "aws_subnet" "private" {
  count = length(var.private_subnets) > 0 ? length(var.private_subnets) : 0

  vpc_id                          = aws_vpc.main.id
  cidr_block                      = var.private_subnets[count.index]
  availability_zone               = length(regexall("^[a-z]{2}-", element(var.availability_zones, count.index))) > 0 ? element(var.availability_zones, count.index) : null
  availability_zone_id            = length(regexall("^[a-z]{2}-", element(var.availability_zones, count.index))) == 0 ? element(var.availability_zones, count.index) : null

  tags = {
      "Name" = format(
        "${var.project_name}-private-sn-%s",
        element(var.availability_zones, count.index),
      )
    }
}

