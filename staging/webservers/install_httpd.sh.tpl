#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Group-2 Project</title>
</head>
<body>
    <center>
        <br>
        <hr>
        <h1>
            WELCOME TO <span style=color:#FF0000;>GROUP 2</span> WEB SERVER DEPLOYMENT IN AWS!
        </h1>
        <hr>
        <h1>
            This web server deployment has been carried out by the ACS730 Group 2 members<br>
            <br>
            <strong style=color:#FF0000;>
                Hafees Falana<br>
                Olawale Saliu<br>
               
            </strong>
            <br>
            of CAA Fall 2023 Class!
        </h1>
        <h3>
            My private IP address is <font color="red">$myip</font>!</p>
        </h3>
        <img src="https://acs730-final-project-group2.s3.amazonaws.com/Audi.jpg" alt="Sample Image">
        <br>The image above is being served from our S3 bucket
    </center>
</body>
</html>"  >  /var/www/html/index.html
sudo systemctl start httpd
sudo systemctl enable httpd
