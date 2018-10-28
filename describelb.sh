#!/bin/bash
RED='\033[0;31m' 
GREEN='\033[0;32m' 
NC='\033[0m' 


LoadBalancerVPC()
{
temp=$(aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -i "VPCId" | awk '{print $2}' | tr -d '"|,')
echo -e "LoadBalancer VPC : ${GREEN}$temp${NC}"
}

LoadBalancerInstances()
{
echo -e "Instances Present on loadbalancer : ${GREEN}$LoadbalancerName${NC}"
echo -e "${GREEN}"
#aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -i "InstanceId" | awk '{print $2}' | tr -d '"' > InstaceID.txt
aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -i "InstanceId" | awk '{print $2}' | tr -d '"'
echo -e "${NC}"
}

LoadBalancerInstanceIp()
{
echo -e "Instances Present on loadbalancer : ${GREEN}$LoadbalancerName${NC}"
echo -e "${GREEN}"
aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -i "InstanceId" | awk '{print $2}' | tr -d '"'
echo -e "${NC}"
}


LoadBalancerHealth()
{
echo -e "Loadbalancer Health:"
temp=$(aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -E "Timeout" | awk '{print $2}' | tr -d '"|,')
echo -e "\tTimeout            : ${GREEN}$temp${NC}"

temp=$(aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -E "UnhealthyThreshold" | awk '{print $2}' | tr -d '"|,')
echo -e "\tUnhealthyThreshold : ${GREEN}$temp${NC}"

temp=$(aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -E "HealthyThreshold" | awk '{print $2}' | tr -d '"|,')
echo -e "\tHealthyThreshold   : ${GREEN}$temp${NC}"

temp=$(aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -E "Interval" | awk '{print $2}' | tr -d '"|,')
echo -e "\tInterval           : ${GREEN}$temp${NC}"
}

LoadBalancerDNSNAME()
{
temp=$(aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default | grep -E "DNSName" | awk '{print $2}' | tr -d '"|,')
echo -e "LoadBalancer DNS NAME : ${GREEN}$temp${NC}"
}

main()
{
echo ""
echo -e "Default configure profile used  : ${GREEN}default${NC}"
echo -e "Selected Loadbalancer ${RED}\"$LoadbalancerName\"${NC}"
echo ""
echo "Fetching details..."
echo ""
LoadBalancerVPC
LoadBalancerDNSNAME
LoadBalancerHealth
LoadBalancerInstances
}

emptyidfound()
{
	echo "empty id"
}

noidmatch()
{
        echo "OOPS !!!"
        echo -e "Given LoadBalancer \"${RED} $1 ${NC}\" doesnt exists "
        echo ""
}

foundinput()
{
	RESULT=$(aws elb describe-load-balancers --load-balancer-name="$LoadbalancerName" --profile default)
        if [ -n "$RESULT" ] ; then
        main $1
        else
        noidmatch $1
        fi
}

LoadbalancerName=$1

if [ "$LoadbalancerName" == "" ] ; then
        emptyidfound
else
         foundinput $1
fi
