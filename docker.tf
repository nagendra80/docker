resource "aws_instance" "this" {
    ami = "ami-09c813fb71547fc4f" # This is our devops-practice AMI ID
    vpc_security_group_ids = [aws_security_group.allow_all_docker.id]
    instance_type = "t3.micro"
    tags = {
        Name = "docker"
    }
}

resource "aws_security_group" "allow_all_docker" {
    name = "allow_all_docker"
    description = "Allow TLS inbound and all outbound traffic"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    tags = {
        Name = "allow_tls"
    }
}