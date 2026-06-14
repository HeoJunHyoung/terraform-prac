# ==========================================
# 1. EC2 인스턴스용 보안 그룹(방화벽) 생성
# ==========================================
resource "aws_security_group" "ec2_public_sg" {
  name        = "ec2_public_sg"
  description = "Security Group for Public EC2 Instance"
  vpc_id      = aws_vpc.main_vpc.id # 📌 vpc.tf에서 만든 main_vpc와 연동

  # 📥 인바운드 규칙: 외부에서 EC2로 들어오는 트래픽 설정
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ⚠️ 실습용으로 전체 오픈 (실무에선 내 회사 IP만 지정)
  }

  # 📤 아웃바운드 규칙: EC2에서 외부 인터넷으로 나가는 트래픽 설정
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1은 모든 프로토콜(TCP, UDP, ICMP 등) 허용을 의미
    cidr_blocks = ["0.0.0.0/0"] # EC2 내부에서 패키지 다운로드 등을 위해 인터넷 전면 개방
  }

  tags = {
    Name = "ec2_public_sg"
  }
}
