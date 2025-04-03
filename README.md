# Hosting a Dynamic Web App on AWS with Terraform, Docker, ECR, and ECS

## Project Overview

This project demonstrates how to **deploy a Dockerized web application** on **AWS** using **Terraform, Amazon ECR, and ECS.** The web app is built using **Node.js & Express.js,** containerized with **Docker**, and managed through **Terraform** for infrastructure provisioning.
---

## Project Structure

```
terraform-ecs-webapp/
│── app/
│   ├── index.js  # Node.js Web App
│   ├── package.json  # Node.js Dependencies
│   ├── Dockerfile  # Docker Configuration
│
│── modules/
│   ├── ecr/
│   │   ├── main.tf  # ECR Module
│   ├── ecs/
│   │   ├── main.tf  # ECS Module
│   │   ├── variables.tf  # ECS Variables
│
│── main.tf  # Terraform Main Configuration
│── README.md  # Documentation
```

---

## Prerequisites

+ Ensure the following tools are installed:

+ Docker → Install Here

+ Terraform → Install Here

+ AWS CLI → Install Here

+ Node.js → Install Here
---


## Step 1: Create Your Project Structure

Open your terminal and run:
```
mkdir terraform-ecs-webapp
cd terraform-ecs-webapp
mkdir -p modules/ecr modules/ecs
```
This creates a clean directory structure.
![](./img/1a.mkdir.cd.png)
![](./img/1b.mkdir.modules.png)
---

## Step 2: Create the Web App

Since this is a Dockerized Web App, I will use **Node.js**.

+ **Initialize a Node.js project:**
```
mkdir app && cd app
npm init -y
npm install express
```
![](./img/2a.cd.app.npm.nit.png)
![](./img/2b.install.express.png)


+ **Create an index.js file inside app/:**
```
nano index.js
```
```
const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('Hello, World! Welcome to my AWS-hosted Web App 🚀');
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
```

 + **Create a Dockerfile inside app/:**
 ```
 *-nano Dockerfile
 ```
```
FROM node:16

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]
```

## Create .gitignore to Exclude Sensitive Files
```
touch .gitignore
```

## Open .gitignore and add the following:
```
# Ignore Terraform state files
*.tfstate
*.tfstate.backup
.terraform/
.terraform.lock.hcl

# Ignore AWS credentials
*.pem
*.key
```

## Create a New GitHub Repository without initializing it:
```
terraform-modules-vpc-s3
```

## Initialize Git:
```
git init
```

## Add Your .gitignore File
```
git add .gitignore
```

## Stage Other Files
```
git add .
```

## Make the Initial Commit
```
git commit -m "Initial commit with .gitignore"
```

## Rename the Branch to main
```
git branch -m master main
```

## Connect to a Remote Repository
```
git remote add origin https://github.com/yourusername/your-repository.git
```

## Push Your Code to the Remote Repository
```
git push -u origin main
```

 ## Set up Docker
 Create an Ec2 Instance and install docker

## Update the package manager and install Docker:
```
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y docker.io
```

## Start, enable and check status of the Docker service:
```
sudo service docker start
sudo systemctl enable docker
sudo systemctl status docker
```

## Add the current user to the Docker group
```
sudo usermod -aG docker $USER
```

## Verify the installation
```
docker --version
```

+ **Test it locally:**
```
cd app
docker build -t my-webapp .
docker run -p 3000:3000 my-webapp
```

Open http://localhost:3000 in your browser.


