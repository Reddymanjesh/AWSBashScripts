echo "Aws Autoscaling group names "
echo "Total ASGS: $(aws autoscaling describe-auto-scaling-groups | jq '.AutoScalingGroups[].AutoScalingGroupName' | wc -l)"

aws autoscaling describe-auto-scaling-groups | jq '.AutoScalingGroups[].AutoScalingGroupName'
