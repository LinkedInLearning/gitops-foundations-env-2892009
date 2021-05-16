# Terraform Demonstration
This directory contains the example materials used in the Terraform demonstration that is part of the LinkedIn Learning course `GitOps Foundations`. The full course is available from [LinkedIn Learning][lil-course-url].


In this demonstration we bootstrap the AKS cluster on Azure that provides the underlying container orchestration platform for deployment of our cloud native application using a GitOps approach.  The underlying cluster is used throughout the final lessons of the course and is expected to be reprovisioned for each tool (Flux & Flagger)

## Required Tools
1.  **Terraform** is used as the underlying container platform for building and running containers.  You can download and install Docker for your platform using the [official installation guide][docker-install].
2.  **kubectl** is a command line tool used to run commands against the Kubernetes cluster.  You can download and install kubectl by following the installation instructions on the [official site][kube-site].
3.  **Azure CLI** is a command line interface that is used with Azure Cloud platform.  You can download and install the Azure CLI by following the instructions on the [official website][azurecli-start].

## Instructions
This folder contains the example files for the Terraform demonstration.  Prior to applying these manifests on the Kubernetes cluster with GitOps you must build and store the container images into DockerHub using these [instructions][setup-instructions].  After completing those instructions, follow along with the steps in the course to deploy the resources to the cluster.

## Commands
The following commands are used in the demonstrations.  They are provided within the readme file so that you can copy and paste them while working through the course.

1. Login to Azure via the CLI

```
az login
```

2. Create an Active Directory Service Account
```
az ad sp create-for-rbac --skip-assignment
```

3.  Initiate the Terraform Workspace
```
terraform init
```

4.  Apply the Terraform Plan
```
terraform apply
```

5.  Connect the New Cluster to Kubectl (Must be ran in Terraform Directory)
```
az aks get-credentials --resource-group $(terraform output -raw resource_group_name) --name $(terraform output -raw kubernetes_cluster_name)
```

[0]: # (Replace these placeholder URLs with actual course URLs)

[lil-course-url]: https://www.linkedin.com/learning/
[lil-thumbnail-url]: http://
[k3d-start]: https://k3d.io/#installation
[docker-install]: https://docs.docker.com/engine/install/
[kube-site]: https://kubernetes.io/docs/tasks/tools/
[azurecli-start]: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
[setup-instructions]: https://github.com/LinkedInLearning/gitops-foundations-env-2892009#installing
