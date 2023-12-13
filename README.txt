
###ACS730 Final Project (Two-tier Web Application Automation Using Terraform, Ansible and GitHub Actions)

###Deployment pre-requisites:
Create an S3 bucket with unique names for the three environments (dev, prod and staging). The bucket will store Terraform state.

The three s3 buckets would also store the images to display on the webservers that were deployed on the two of the 
public VMs.

##Deployment Process
1. Clone the github repo of the code to AWS Cloud9 environment 
```
2. Update the desired input varibles in dev/network and deploy dev/network with the commands below
```
   cd ~/webappproject/terraform/dev/network
   tf init
   tf plan
   tf apply --auto-approve 
```
3. Update the desired input varibles in prod/network and deploy prod/network with the commands below
```
   cd ~/webappproject/terraform/prod/network
   tf init
   tf plan
   tf apply --auto-approve 
```
4. Create a custom SSH key pair in ~/.ssh/dev-key for remote access to the dev VMs
``` 
   
   ssh-keygen -t rsa -f ~/.ssh/dev-key
   
5. Deploy webserver VMs in dev/webservers
```
   tf init
   tf plan
   tf apply --auto-approve

6. Create a custom SSH key pair in ~/.ssh/ for remote access to the prod VMs (
   
   ssh-keygen -t rsa -f ~/.ssh/prod-key
   
7. Deploy webserver VMs in prod/webservers
```
   tf init
   tf plan
   tf apply --auto-approve
   
   
6. Create a custom SSH key pair in ~/.ssh/ for remote access to the staging VMs (
   
   ssh-keygen -t rsa -f ~/.ssh/staging-key
   
7. Deploy webserver VMs in staging/webservers
```
   tf init
   tf plan
   tf apply --auto-approve

###Clean Up process 

The cleanup process is a reverse of the deployment process,

1. Delete  instances in dev VPC
``` 
 cd ../../dev/webservers/
 tf destroy  -var my_private_ip=${PRIVATE_IP} -var my_public_ip=${PUBLIC_IP} --auto-approve
 ```
2. Delete  instances in prod VPC
``` 
 cd ../../prod/webservers/
 tf destroy  -var my_private_ip=${PRIVATE_IP} -var my_public_ip=${PUBLIC_IP} --auto-approve
 ```
 3. Delete  instances in staging VPC
``` 
 cd ../../staging/webservers/
 tf destroy  -var my_private_ip=${PRIVATE_IP} -var my_public_ip=${PUBLIC_IP} --auto-approve
 ```