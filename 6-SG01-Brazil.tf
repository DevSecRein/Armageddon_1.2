resource "aws_security_group" "app1-sg1-servers-Brazil" {
    provider = aws.sa-east-1
  name        = "app1-sg1-servers-Brazil"
  description = "app1-sg1-servers-Brazil"
  vpc_id      = aws_vpc.app1-Brazil.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.app1-sg-LB01-Brazil.id]
  }
  ingress {
    description = "Allow syslog traffic"
    from_port   = 514
    to_port     = 514
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow syslog traffic (TCP)"
    from_port   = 514
    to_port     = 514
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #any protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "app1-sg1-servers-Brazil"
    Service = "J-Tele-Doctor"
  }

}


resource "aws_security_group" "app1-sg-LB01-Brazil" {
    provider = aws.sa-east-1
  name        = "app1-sg-LB01-Brazil"
  description = "app1-sg-LB01-Brazil"
  vpc_id      = aws_vpc.app1-Brazil.id

  ingress {
    description = "MyHomePage"
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
    Name    = "app1-sg2-LB1-Brazil"
    Service = "J-Tele-Doctor"
  }

}