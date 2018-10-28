ls /home/ubuntu/test > hello.txt
sed -i 's/^/#/' hello.txt
sed -i '1s/^/#startprog\n/' hello.txt
echo "#endprog" >> hello.txt
echo " " >> hello.txt
