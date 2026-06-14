# ==========================================
# 2. 퍼블릭 서브넷 A에 기본 EC2 인스턴스 생성
# ==========================================
resource "aws_instance" "my_public_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (서울 리전 표준 이미지)
  instance_type = "t3.micro"               # 프리티어 혹은 기본 실습용 저사양 스펙

  # 📌 [참조 1] subnet.tf에서 만든 퍼블릭 서브넷 A의 ID를 주입
  subnet_id     = aws_subnet.public_subnet_a.id 

  # 📌 [참조 2] 바로 위 sg.tf에서 만든 보안 그룹의 ID를 대괄호[] 안에 주입
  vpc_security_group_ids = [aws_security_group.ec2_public_sg.id] #  AWS가 실제로 생성한 보안 그룹의 고유 식별자 문자열인 ["sg-0123456789abcdef0"]과 같은 형태로 치환 ([]로 받은 이유는 sg가 복수 개 일수 있어서)

  # 📌 퍼블릭 서브넷에 들어가는 서버이므로 공인 IP를 자동으로 할당받도록 설정
  associate_public_ip_address = true

  tags = {
    Name = "my_public_ec2"
  }
}