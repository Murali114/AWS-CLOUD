# This is the GitHub repo to showcase my work on Aws
## chapter1: Aws cli/cloudformation
In this chapter i will create the labs to show the AWS resourse creation through aws cli and cloud formation. 

1.The below is the command to Create VPC through AWS CLI:

Command:
''' 

            aws ec2 create-vpc \
                --cidr-block 10.0.0.0/16\
                --tag-specifications ResourceType-vpc, Tags- 
                [{Key-Name, Value-MyVpc}]


'''

Sample Output:

```


{
    "Vpc": {
        "CidrBlock": "10.0.0.0/16",
        "DhcpOptionsId": "dopt-5EXAMPLE",
        "State": "pending",
        "VpcId": "vpc-0a60eb65b4EXAMPLE",
        "OwnerId": "123456789012",
        "InstanceTenancy": "default",
        "Ipv6CidrBlockAssociationSet": [],
        "CidrBlockAssociationSet": [
            {
                "AssociationId": "vpc-cidr-assoc-07501b79ecEXAMPLE",
                "CidrBlock": "10.0.0.0/16",
                "CidrBlockState": {
                    "State": "associated"
                }
            }
        ],
        "IsDefault": false,
        "Tags": [
            {
                "Key": "Name",
                "Value": MyVpc"
            }
        ]
    }
}



```

2.The below is the command to delete vpc

```
aws ec2 delete-vpc --vpc-id <your-vpc-id>
```

3.The below command is used to create subnets to your vpc

```
aws ec2 create-subnet --vpc-id vpc-05a27c308645122dc --cidr-block 10.1.1.0/24 --availability-zone ap-south-1a
{
    "Subnet": {
        "AvailabilityZone": "ap-south-1a",
        "AvailabilityZoneId": "aps1-az1",
        "AvailableIpAddressCount": 251,
        "CidrBlock": "10.1.1.0/24",
        "DefaultForAz": false,
        "MapPublicIpOnLaunch": false,
        "State": "available",
        "SubnetId": "subnet-0ba98693e27d8849e",
        "VpcId": "vpc-12266637c",
        "OwnerId": "3814767763",
        "AssignIpv6AddressOnCreation": false,
        "Ipv6CidrBlockAssociationSet": [],
        "SubnetArn": "arn:aws:ec2:ap-south-1:381492281943:subnet/subnet-0ba98693e27d8849e",
        "EnableDns64": false,
        "Ipv6Native": false,
        "PrivateDnsNameOptionsOnLaunch": {
            "HostnameType": "ip-name",
            "EnableResourceNameDnsARecord": false,
            "EnableResourceNameDnsAAAARecord": false
        }
    }
}



```

4.The below commands are creating and attach internet gateway to your vpc

```
aws ec2 create-internet-gateway

aws ec2 create-internet-gateway
{
    "InternetGateway": {
        "Attachments": [],
        "InternetGatewayId": "igw-0cb178f7d6d6e13ce",
        "OwnerId": "38145757943",
        "Tags": []
    }
}


aws ec2 attach-internet-gateway --vpc-id vpc-xxxxxxxx --internet-gateway-id igw-xxxxxxxx

aws ec2 attach-internet-gateway --vpc-id vpc-05a27c308hjj78dc --internet-gateway-id igw-0cb178f7d6d6e13ce

```

5.The below command is used to create route table

```
aws ec2 create-route-table --vpc-id vpc-xxxxxxxx

aws ec2 create-route-table --vpc-id vpc-05a27c308645122dc
{
    "RouteTable": {
        "Associations": [],
        "PropagatingVgws": [],
        "RouteTableId": "rtb-0750f2d6ef8e9f287",
        "Routes": [
            {
                "DestinationCidrBlock": "10.1.0.0/16",
                "GatewayId": "local",
                "Origin": "CreateRouteTable",
                "State": "active"
            }
        ],
        "Tags": [],
        "VpcId": "vpc-05a27chds5122dc",
        "OwnerId": "38667681943"
    },
    "ClientToken": "ee49669d-b5a5-4c6f-979b-2cdd38539163"
}


```

6.The below is the command to create the route to the internet-gateway

```
aws ec2 create-route --route-table-id rtb-xxxxxxxx --destination-cidr-block 0.0.0.0/0 --gateway-id igw-xxxxxxxx
```

7.The below command is used to Associate the Public Subnet with the Route Table

```
aws ec2 associate-route-table --subnet-id subnet-xxxxxxxx --route-table-id rtb-xxxxxxxx
```



```

![My Local Image]("C:\Users\Murali\OneDrive\Pictures\3.JPG")
