resource "aws_security_group" "control_plane_sg" {
  name        = "control_plane_sg"
  description = "Security group for control plane"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow communication from node groups"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // -1 means all protocols
    security_groups = [aws_security_group.node_group_sg.id]
  }

  egress {
    description = "Allow all outbound traffic from control plane"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "node_group_sg" {
  name        = "node_group_sg"
  description = "Security group for node groups"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow communication from control plane"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_groups = [aws_security_group.control_plane_sg.id]
  }

  egress {
    description = "Allow all outbound traffic from node groups"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.control_plane_sg.id
}