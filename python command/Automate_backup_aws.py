# this program is for backup the data automatically ad upload to aws 
#pip install boto3
# awscliv2  and then follow commands acording to os 
# open aws > iam > create user > attach policies directly > give policy s3fullaccess >  create user > cick on user name 
# now click on security credencials > create accesskey for user  > commandline interface access> next > then you will get access key copy that 
# then open terminal in vs code and enter> aws configure > enter key > aws s3 ls
import boto3 

s3 =boto3.resource("s3")
def show_buckets(s3):
    for bucket in s3.bucket.all():
        print(bucket.name)
# code for print all bucket present in aws account 
def create_bucket(s3,bucket_name,region):
    s3.create_bucket(Bucket=bucket_name ,
                    CreateBucketConfiguration={
                    'LocationConstraint': region,
                     },)
    print("bucket create successfully ")
# code for create bucket resource - boto3 create bucket
def upload_backup(s3,file_name,bucket_name,key_name):
    data=open(file_name,'rb')  # rb means read binary aws accept binary files 
    s3.Bucket(bucket_name).put_object(key=key_name, Body=data)
    print("Backup success")
# code for upload the file to aws s3 using python 


bucket_name="uditbucket"
region="us-east-1"
file_name ="/user/udit/document.....file path "
create_bucket(s3)
show_buckets(s3)


upload_backup(s3,file_name,bucket_name,"mybackup.tar.gz")