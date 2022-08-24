resource "aws_vpc" "fish" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env}_${var.fish}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.fish.id
  cidr_block        = var.public_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "${var.env}_public_subnet"
  }

}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.fish.id
  cidr_block        = var.private_cidr
  availability_zone = "${var.region}a"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.fish.id

  tags = {
    Name = "${var.env}_igw"
  }
}

# resource "aws_route_table" "rt" {
#   vpc_id = aws_vpc.fish.id

#   route = [ {
#     carrier_gateway_id = ""
#     cidr_block = var.public_cidr
#     core_network_arn = ""
#     destination_prefix_list_id = ""
#     egress_only_gateway_id = ""
#     gateway_id = aws_internet_gateway.igw.id
#     instance_id = ""
#     ipv6_cidr_block = ""
#     local_gateway_id = ""
#     nat_gateway_id = ""
#     network_interface_id = ""
#     transit_gateway_id = ""
#     vpc_endpoint_id = ""
#     vpc_peering_connection_id = ""
#   } ]

#   tags = {
#     Name = "${var.region}_rt"
#   }
# }

# resource "aws_route_table_association" "a" {
#   subnet_id = aws_subnet.public_subnet.id
#   route_table_id = aws_route_table.rt.id
# }

