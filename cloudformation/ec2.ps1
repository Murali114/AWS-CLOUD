# Specify the Terraform provider
provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

# Create a key pair
resource "aws_key_pair" "example_key" {
  key_name   = "example-key"
  public_key = file("~/.ssh/id_rsa.pub") # Path to your public SSH key
}

# Create a security group
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Allow SSH and HTTP access"

  # Inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (adjust for security)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-sg"
  }
}

# Create an EC2 instance
resource "aws_instance" "example_instance" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (update for your region)
  instance_type = "t2.micro"              # Free-tier eligible instance type

  key_name      = aws_key_pair.example_key.key_name
  security_groups = [aws_security_group.example_sg.name]

  tags = {
    Name = "example-ec2-instance"
  }

  # Output the public IP
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ec2_public_ip.txt"
  }
}

# Output the instance's public IP
output "instance_public_ip" {
  value = aws_instance.example_instance.public_ip
}
