# ==========================================
# 1. NAT Gateway용 고정 공인 IP (Elastic IP) 생성
# ==========================================
resource "aws_eip" "nat_eip" {
    vpc = true

    tags = {
        Name = "nat_eip"
    }
}

# ==========================================
# 2. NAT Gateway 생성 (Public Subnet A에 배치)
# ==========================================
resource "aws_nat_gateway" "main_nat_gw" {
    allocation_id = aws_eip.nat_eip.id
    subnet_id     = aws_subnet.public_subnet_a.id # 📌 퍼블릭 서브넷 A에 포지셔닝

    tags = {
        Name = "main_nat_gw"
    }

    # ⚠️ 안전장치: 인터넷 게이트웨이(IGW)가 완공된 후에 NAT 게이트웨이가 생성되도록 순서 강제
    depends_on = [aws_internet_gateway.main_igw]
}
