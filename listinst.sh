echo ""
echo "Analysing..."
echo "Total instances : $(aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' | wc -l)"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'
