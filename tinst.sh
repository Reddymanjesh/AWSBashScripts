aws ec2 describe-instances --filter "Name=instance-state-name, Values=terminated" | jq '.' | grep "InstanceId" | awk '{print $2}' | tr -d '"\|,'
