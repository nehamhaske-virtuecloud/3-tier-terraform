resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags       = { Name = "${var.project_name}-vpc" }
}

# Public subnets in 2 AZs
resource "aws_subnet" "public" {
  for_each = toset(var.public_subnet_cidr)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  availability_zone       = var.availability_zones[ index(var.public_subnet_cidr, each.value) ]
  map_public_ip_on_launch = true

  tags = { Name = "${var.project_name}-public-${each.key}" }
}

# Private app subnets
resource "aws_subnet" "app_private" {
  for_each = toset(var.private_subnet_cidr_app)

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[ index(var.private_subnet_cidr_app, each.value) ]

  tags = { Name = "${var.project_name}-private-app-${each.key}" }
}

# Private DB subnets
resource "aws_subnet" "db_private" {
  for_each = toset(var.private_subnet_cidr_db)

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = var.availability_zones[ index(var.private_subnet_cidr_db, each.value) ]

  tags = { Name = "${var.project_name}-private-db-${each.key}" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "${var.project_name}-igw" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "${var.project_name}-public-rt" }
}

resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = element(aws_subnet.public.*.id, 0)
  depends_on    = [aws_internet_gateway.igw]
  tags          = { Name = "${var.project_name}-nat-gateway" }
}

resource "aws_route_table" "private_app" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = { Name = "${var.project_name}-private-app-rt" }
}

resource "aws_route_table_association" "private_app_assoc" {
  for_each = aws_subnet.app_private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_app.id
}

resource "aws_route_table" "private_db" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = { Name = "${var.project_name}-private-db-rt" }
}

resource "aws_route_table_association" "private_db_assoc" {
  for_each = aws_subnet.db_private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_db.id
}
