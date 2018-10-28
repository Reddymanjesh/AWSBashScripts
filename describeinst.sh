instanceid=$1

if [ "$instanceid" == "" ];
then
echo "Please specify instanceid"
exit
else
echo ""
echo "Fetching all results.."
echo " "
echo "Details on Instance ID :  $instanceid"

echo -n "State             =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].State.Name'
echo -n "LaunchTime        =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].LaunchTime'
echo -n "Availability_Zone =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].Placement.AvailabilityZone'
echo -n "PrivateIpAddress  =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PrivateIpAddress'
echo -n "PublicIpAddress   =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PublicIpAddress'
echo -n "KeyName           =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].KeyName'
echo -n "InstanceType      =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].InstanceType'
echo -n "PublicDnsName     =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PublicDnsName'
echo -n "PrivateDnsName    =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].PrivateDnsName'
#echo -n "LoadBalancer     =  "
#aws elb describe-load-balancers | jq -r '.LoadBalancerDescriptions[] | select(.Instances[].InstanceId == "$1" ) | .LoadBalancerName '
echo -n "InstanceType      =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].InstanceType'
echo -n "ImageId           =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].ImageId'
echo -n "SecurityGroup     =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].SecurityGroups[]'
echo -n "Tags              =  "
aws ec2 describe-instances --instance-id $instanceid | jq '.Reservations[].Instances[].Tags[]'
fi
