echo " "
echo "Analysing..."
echo "Stopped Instances List : $(aws ec2 describe-instances --filters Name=instance-state-name,Values='stopped' | jq '.Reservations[].Instances[].InstanceId' | wc -l)"
aws ec2 describe-instances --filters Name=instance-state-name,Values='stopped' | jq '.Reservations[].Instances[].InstanceId'
echo " "
