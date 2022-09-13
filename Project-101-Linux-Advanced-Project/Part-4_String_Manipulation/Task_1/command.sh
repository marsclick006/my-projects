#!/bin/bash

result=$(grep -o '"PrivateIpAddress": "[^"]*' info.json | grep -o '[^"]*$' | head -n 1)
sed -i "s/ec2-private_ip/$result/" terraform.tf
echo $result

