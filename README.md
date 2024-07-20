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
'''

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

'''



