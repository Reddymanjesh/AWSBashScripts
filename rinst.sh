echo " "
echo "Analysing..."
echo "Running Instances List : $(aws ec2 describe-instances --filters Name=instance-state-name,Values='running' | jq '.Reservations[].Instances[].InstanceId' | wc -l ) "
aws ec2 describe-instances --filters Name=instance-state-name,Values='running' | jq '.Reservations[].Instances[].InstanceId'
echo " "
