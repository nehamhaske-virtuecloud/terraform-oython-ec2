provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"  # Ubuntu 22.04 in us-east-1
  instance_type = "t2.micro"              # Free-tier eligible

  # User data: automatically runs when EC2 starts
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y python3
              echo '${file("app.py")}' > app.py
              nohup python3 app.py &
              EOF

  tags = {
    Name = "PythonAppInstance"
  }
}
