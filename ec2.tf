resource "aws_launch_template" "ec2_template" {
  name_prefix   = "ec2_template"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  user_data = var.user_data_script
  
  network_interfaces {
    associate_public_ip_address = false
    subnet_id                   = aws_subnet.priv_subnet_1a.id
    security_groups             = [aws_security_group.security_group_ec2.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "teste-lu" 
    }
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity = 3
  max_size         = 5
  min_size         = 3

  target_group_arns = [aws_lb_target_group.lb_target.arn]

  vpc_zone_identifier = [
    aws_subnet.priv_subnet_1a.id
  ]

  launch_template {
    id      = aws_launch_template.ec2_template.id
    version = "$Latest"
  }
}