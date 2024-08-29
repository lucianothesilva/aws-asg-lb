resource "aws_lb" "load_balancer" {
  name               = "teste-lu-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_elb.id]
  subnets            = [aws_subnet.pub_subnet_1a.id, aws_subnet.pub_subnet_1b.id]
  depends_on         = [aws_internet_gateway.internet_gtw]
}

resource "aws_lb_target_group" "lb_target" {
  name     = "lb-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  
  health_check {
    path= "/"
    protocol= "HTTP"
    matcher= "200"
    interval= 15
    timeout= 3
    healthy_threshold= 2
    unhealthy_threshold = 2
  }
  
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target.arn
  }
}