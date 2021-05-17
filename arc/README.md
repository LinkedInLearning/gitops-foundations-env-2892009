# Azure Arc Demonstration
This directory contains the example materials used in the Azure Arc demonstration that is part of the LinkedIn Learning course `GitOps Foundations`. The full course is available from [LinkedIn Learning][lil-course-url].


In this demonstration we deploy a containerized application onto a local k3s Kubernetes cluster using the Flux operator within Azure Arc's GitOps support.

## Required Tools
1.  **Docker** is used as the underlying container platform for building and running containers.  You can download and install Docker for your platform using the [official installation guide][docker-install].
2.  **k3d** is used to manage and establish the underlying k3s kubernetes cluster that runs ArgoCD.  You can download and install k3d using their [getting started guide][k3d-start].
3.  **kubectl** is a command line tool used to run commands against the Kubernetes cluster.  You can download and install kubectl by following the installation instructions on the [official site][kube-site].
4.  **Azure CLI** is a command line interface that is used with Azure Cloud platform.  You can download and install the Azure CLI by following the instructions on the [official website][azurecli-start].
5.  **CircleCI** is the continuous integration platform used in a single lesson in the course.  If you choose to follow along with this lesson, you'll need an account on the platform.  A trial account can be obtained on the [CircleCi][circle] website.  The configuration for the build can be found in the `.circleci` directory in the app repository.  Configuration in the platform requires that a `DockerHub` context be established with `DOCKERHUB_USER` and `DOCKERHUB_PASSWORD` variables set respectively.

## Instructions
This folder contains the example files for the Azure Arc demonstration.  Prior to applying these manifests on the Kubernetes cluster with GitOps you must build and store the container images into DockerHub using these [instructions][setup-instructions].  After completing those instructions, follow along with the steps in the course to deploy the resources to the cluster.

## Commands
The following commands are used in the demonstrations.  They are provided within the readme file so that you can copy and paste them while working through the course.

1. Create a new cluster with k3d

```
k3d cluster create arccluster
```

2. Patch a Kubernetes Deployment
```
kubectl patch deployment gitops-foundations --namespace argocd-exercise -p '{"spec":{"template":{"spec":{"containers":[{"name":"gitops-foundations","image":"[Your DockerHub ID goes here]/gitops-foundations:1.0"}]}}}}'
```

[0]: # (Replace these placeholder URLs with actual course URLs)

[lil-course-url]: https://www.linkedin.com/learning/
[lil-thumbnail-url]: http://
[k3d-start]: https://k3d.io/#installation
[docker-install]: https://docs.docker.com/engine/install/
[kube-site]: https://kubernetes.io/docs/tasks/tools/
[azurecli-start]: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
[setup-instructions]: https://github.com/LinkedInLearning/gitops-foundations-env-2892009#installing
[circle]: https://circleci.com/
