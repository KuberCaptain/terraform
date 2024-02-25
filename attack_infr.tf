provider "AWS" {
  region = "us-east-1"
}
#vpc
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  tags = {
    Name = "MainVPC"
  }
}


#subnet
resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "MainSubnet"
  }
}


#group security
resource "aws_security_group" "main_sg" {
  name        = "main_security_group"
  description = "Allow SSH, HTTP, and internal traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MainSG"
  }
}



#instance ec2
resource "aws_instance" "attacker_instance" {
  ami           = "ami-0c02fb55956c7d316" # ami redhat linux
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet.id
  security_groups = [aws_security_group.main_sg.name]
  key_name      = "amerika_targil.pem" 
  tags = {
    Name = "Attacker"
  }
}

resource "aws_instance" "linux_victim_instance" {
  ami           = "ami-0c02fb55956c7d316" # ami linux
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet.id
  security_groups = [aws_security_group.main_sg.name]
  key_name      = "amerika_targil.pem" 

  tags = {
    Name = "LinuxVictim"
  }
}

resource "aws_instance" "windows_victim_instance" {
  ami           = "ami-0b8d0d6ac70e5750c" # ami windows
  subnet_id     = aws_subnet.main_subnet.id
  security_groups = [aws_security_group.main_sg.name]
  key_name      = "amerika_targil.pem" 

  tags = {
    Name = "WindowsVictim"
  }
}

