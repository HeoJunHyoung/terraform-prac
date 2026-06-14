# ==========================================
# 1. Public Routing Table (인터넷 게이트웨이로 직통하는 도로)
# ==========================================
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

# Public 서브넷 A 연결
resource "aws_route_table_association" "public_assoc_a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}

# Public 서브넷 C 연결
resource "aws_route_table_association" "public_assoc_c" {
  subnet_id      = aws_subnet.public_subnet_c.id
  route_table_id = aws_route_table.public_rt.id
}


# ==========================================
# 2. Private Routing Table (NAT 게이트웨이를 거쳐 인터넷으로 나가는 도로)
# ==========================================
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main_vpc.id

  # 📌 [추가] 프라이빗 서브넷 내부 자원들이 외부 통신을 요청하면 NAT 게이트웨이로 전달!
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main_nat_gw.id
  }

  tags = {
    Name = "private_rt"
  }
}

# Private 서브넷 A (App) 연결
resource "aws_route_table_association" "private_assoc_a_app" {
  subnet_id      = aws_subnet.private_subnet_a_app.id
  route_table_id = aws_route_table.private_rt.id
}

# Private 서브넷 A (DB) 연결
resource "aws_route_table_association" "private_assoc_a_db" {
  subnet_id      = aws_subnet.private_subnet_a_db.id
  route_table_id = aws_route_table.private_rt.id
}

# Private 서브넷 C (App) 연결
resource "aws_route_table_association" "private_assoc_c_app" {
  subnet_id      = aws_subnet.private_subnet_c_app.id
  route_table_id = aws_route_table.private_rt.id
}

# Private 서브넷 C (DB) 연결
resource "aws_route_table_association" "private_assoc_c_db" {
  subnet_id      = aws_subnet.private_subnet_c_db.id
  route_table_id = aws_route_table.private_rt.id
}