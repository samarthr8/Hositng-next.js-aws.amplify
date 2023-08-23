Tasks:
Hosting a next.js web app consisting of only frontend on AWS Amplify.
Setting up the required infrastructure by using infrastructure as a code tool Terraform

Git url :  https://github.com/samarthr8/Hositng-next.js-aws.amplify.git
	App link: https://main.df1l5viuc0bbc.amplifyapp.com/

**Disclaimer : I am using AWS Amplify for the first time so there can be a few mistakes. 
	           I’d be thankful to get a brief feedback. 
 	
Steps: (to use the code)


Login to AWS console and create a s3 bucket(name: next-js-assignment) and Dynamodb table(name: next ; partition key : LockID)


git clone https://github.com/samarthr8/Hositng-next.js-aws.amplify.git


cd Hosting-next.js-aws.amplify/


cd Terraform/


terraform init 
terraform plan
terraform apply


Now go to console and search amplify and go to AWS amplify console


Select the app > Select Github > Select git repository > Select branch > Select service role created by terraform code > Click Next > Click Save and Deploy


Wait 2-3 minutes to let app to be deployed.


Click on the link to see the application.


 Now make any changes to the code


 The CICD will trigger automatically and the app will be deployed with the updated code









Steps: (What I had done) 

First I tried to do everything on the ec2 to verify if my app works correctly. And then on AWS Amplify Console to see if everything works:


Launch an ec2 with the following configuration:
Ubuntu
T2.small
Open 22 port for myip in security group
8 gb storage


SSH into the EC2 machine
  
Install node.js v16+, npm and Terraform 
node:
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm:
sudo npm install -g npm@latest
npm -v
Terraform:
1. sudo apt update && apt upgrade -y
2. sudo apt install -y gnupg software-properties-common curl
3. curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -    
4. sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
5. sudo apt update
6. sudo apt install terraform
AWS CLI:
1. sudo apt-get install awscli -y

Run these commands to build the app -
    npx create-next-app@latest
    cd my-app/
    npm run dev
       	 
Open 3000 port for everyone in security group and hit <ec2-public-ip:3000> on browser to see the next.js webpage

Open AWS console and search of AWS amplify.


Click on get started . And then Click on Get started under Amplify Hosting.


Select Github. Authenticate your github account with Aws amplify and select your repository.


Now give required configuration details click on Next; Save and Deploy.


 Wait for 2-3 minutes to and click on the link to see if your application is deployed.



Now I created the infrastructure for the AWS amplify app:


SSH to the same ec2 machine created above.


Create a directory : Terraform 
mkdir Terraform/
cd Terraform/


Write terraform code provider.tf , so that terraform will download the required plugins.


I saved the .tfstate file (backend file) to a remote location (S3) protected with DynamoDB locking mechanism. The .tfstate file stores the state of the infrastructure that Terraform manages. 


Now I wrote iam.tf and amplify.tf to create the necessary infrastructure require to Host a web application on AWS amplify. 


Run the following commands:
terraform init
terraform plan
terraform apply


And now go to the amplify console to setup and deploy the application from github.
