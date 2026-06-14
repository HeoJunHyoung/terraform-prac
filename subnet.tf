###########################
# Public Subnet 생성
###########################

# [1] public subnet A 생성
resource "aws_subnet" "public_subnet_a" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "public_subnet_a"
    }
}

# [2] public subnet C 생성
resource "aws_subnet" "public_subnet_c" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "public_subnet_c"
    }
}

###########################
# Private Subnet 생성
###########################

# [1] private subnet A (app) 생성
resource "aws_subnet" "private_subnet_a_app" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.11.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "private_subnet_a_app"
    }
}

# [2] private subnet A (db) 생성
resource "aws_subnet" "private_subnet_a_db" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.12.0/24"
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "private_subnet_a_db"
    }
}

# [3] private subnet C (app) 생성
resource "aws_subnet" "private_subnet_c_app" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.21.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "private_subnet_c_app"
    }
}

# [4] private subnet C (db) 생성
resource "aws_subnet" "private_subnet_c_db" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.22.0/24"
    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "private_subnet_c_db"
    }
}