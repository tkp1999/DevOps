resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.vpc_name
  }
}

/*
resource "aws_subnet" "web1" {
  tags = {
    Name = "web1"
  }
  vpc_id     = aws_vpc.ntier.id
  cidr_block = var.web1subnetcidr
  depends_on = [aws_vpc.ntier]
}
*/
resource "aws_subnet" "ntier_subnet" {
  count = length(var.aws_subnet_cidr_ranges)
  tags = {
    Name = var.aws_subnet_names[count.index]
  }
  vpc_id     = aws_vpc.ntier.id
  cidr_block = var.aws_subnet_cidr_ranges[count.index]
  depends_on = [aws_vpc.ntier]
}