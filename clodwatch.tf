resource "aws_cloudwatch_metric_alarm" "requests_alarm" {
  alarm_name          = "high-request-count"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "RequestCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Sum"
  threshold           = 60 // Requests por minuto (1 por segundo)
  alarm_description   = "Alarm if the request count per minute is >= 60"
  dimensions = {
    LoadBalancer = aws_lb.load_balancer.arn_suffix
  }

  alarm_actions = [aws_autoscaling_policy.scale_out_policy.arn]
  ok_actions    = [aws_autoscaling_policy.scale_in_policy.arn]
}

resource "aws_autoscaling_policy" "scale_out_policy" {
  name                   = "scale-out-policy"
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  scaling_adjustment     = 1 
  cooldown               = 300
}

resource "aws_autoscaling_policy" "scale_in_policy" {
  name                   = "scale-in-policy"
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  autoscaling_group_name = aws_autoscaling_group.asg.name
  scaling_adjustment     = -1 
  cooldown               = 300
}
