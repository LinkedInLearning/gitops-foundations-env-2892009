# Argo CD Demonstration
This directory contains the example materials used in the Argo CD demonstration that is part of the LinkedIn Learning course `GitOps Foundations`. The full course is available from [LinkedIn Learning][lil-course-url].

In this demonstration we deploy a containerized application onto Argo CD using a GitOps approach.

## Required Tools
1.  **Docker** is used as the underlying container platform for building and running containers.  You can download and install Docker for your platform using the [official installation guide][docker-install].
2.  **k3d** is used to manage and establish the underlying k3s kubernetes cluster that runs Argo CD.  You can download and install k3d using their [getting started guide][k3d-start].
3.  **kubectl** is a command line tool used to run commands against the Kubernetes cluster.  You can download and install kubectl by following the installation instructions on the [official site][kube-site].
4.  **Argo CD** is the GitOps operator that runs in the cluster and applies the example manifests.  You can download and install Argo CD by following the tools [getting started guide][argo-start].

## Instructions
This folder contains the example files for the Argo CD demonstration.  Prior to applying these manifests on the Kubernetes cluster with GitOps you will must build and store the container images into DockerHub using these [instructions][setup-instructions].  After completing those instructions, follow along with the steps in the course to deploy the resources to the cluster.

## Commands
The following commands are used in the demonstrations.  They are provided within the readme file so that you can copy and paste them while working through the course.

1. Get Cluster Node IP with kubectl

```
kubectl get nodes -o wide
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
[argo-start]: https://argoproj.github.io/argo-cd/getting_started/
[setup-instructions]: https://github.com/LinkedInLearning/gitops-foundations-env-2892009#installing
