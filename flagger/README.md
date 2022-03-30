# Flagger Demonstration
This directory contains the example materials used in the Flagger demonstration that is part of the LinkedIn Learning course `GitOps Foundations`. The full course is available from [LinkedIn Learning][lil-course-url].

In this demonstration we use a canary deployment to progressively deliver a containerized application onto an AKS Kubernetes cluster using Flagger.

## Required Tools
1.  **Terraform** is used to provision the underlying Kubernetes cluster that runs the workloads of the example cloud native application.  You can download and install Terraform for your platform using the [official installation guide][terraform-install].
2.  **kubectl** is a command line tool used to run commands against the Kubernetes cluster.  You can download and install kubectl by following the installation instructions on the [official site][kube-site].
3.  **Azure CLI** is a command line interface that is used with Azure Cloud platform.  You can download and install the Azure CLI by following the instructions on the [official website][azurecli-start].
4.   **Flux** is a continuous deployment tool that uses a GitOps approach to manage operations of workloads on a Kubernetes clusters.  You can download and install Flux by following the instructions in the getting [started guide][flux-start].
5.  **Helm** is a package manager for Kubernetes.  You can download and install the Helm by following the instructions on the [official website][helm-start].
5.   **Flagger** is a progressive delivery tool that can be used for advanced deployment procedures on Kubernetes clusters.  You can download and install Flagger by following the instructions in the [getting started guide][flagger-start].

## Instructions
This folder contains the example files for the Flagger demonstration.  Prior to applying these manifests on the Kubernetes cluster with GitOps you must build and store the container images into DockerHub using these [instructions][setup-instructions].  After completing those instructions, follow along with the steps in the course to deploy the resources to the cluster.

Before starting the Flagger exercise, you must have provisioned a new kubernetes cluster on Azure with Terraform and have bootstrapped Flux in the cluster.  Flux must be configured to sync to the flagger directory in this repository.  `kubectl` should also be configured with the AKS cluster.

Both Flagger and NGINX are installed using helm charts, so before starting the exercise make sure Helm is installed.

## Commands
The following commands are used in the demonstrations.  They are provided within the readme file so that you can copy and paste them while working through the course.

1. Add the NGINX Controller Helm Repository
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
```

2. Create a Namespace for the NGINX Controller
```
kubectl create ns ingress-nginx
```

3. Install the Controller into the Namespace
```
helm upgrade -i ingress-nginx ingress-nginx/ingress-nginx \
--namespace ingress-nginx \
--set controller.metrics.enabled=true \
--set controller.podAnnotations."prometheus\.io/scrape"=true \
--set controller.podAnnotations."prometheus\.io/port"=10254

```

4.  Add the Flagger Helm Repository
```
helm repo add flagger https://flagger.app
```

5.  Install Flagger using the Helm Chart and Configure it with Prometheus 
```
helm upgrade -i flagger flagger/flagger \
--namespace ingress-nginx \
--set prometheus.install=true \
--set meshProvider=nginx
```

```
http://kwreid.westus2.cloudapp.azure.com
```
6.  Create the Source Definition
```
flux create source git gitops-foundations \
  --url=https://github.com/Kevin-Bowersox-Courses/gitops-foundations-env-2892009.git \
  --branch=main \
  --interval=30s \
  --export > ./clusters/cluster1/gitops-foundations-source.yaml
```

7.  Create the Kustomization
```
flux create kustomization gitops-foundations \
  --source=gitops-foundations \
  --path=./flagger \
  --prune=true \
  --validation=client \
  --interval=1m \
  --export > ./clusters/cluster1/gitops-foundations-kustomization.yaml
```

8.  Install the Loadbalancer
```
helm upgrade -i flagger-loadtester flagger/loadtester --namespace flagger-exercise
```

9.  Watch the Canaries
```
watch kubectl get canaries --all-namespaces
```

10.  Describe the Canary Deployment
```
kubectl describe canary/gitops-foundations -n flagger-exercise
```


[0]: # (Replace these placeholder URLs with actual course URLs)

[lil-course-url]: https://www.linkedin.com/learning/
[lil-thumbnail-url]: http://
[k3d-start]: https://k3d.io/#installation
[docker-install]: https://docs.docker.com/engine/install/
[kube-site]: https://kubernetes.io/docs/tasks/tools/
[azurecli-start]: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
[setup-instructions]: https://github.com/LinkedInLearning/gitops-foundations-env-2892009#installing
[flux-start]: https://fluxcd.io/docs/get-started/
[flagger-start]: https://docs.flagger.app/
[terraform-install]: https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/azure-get-started
[helm-start]: https://helm.sh/docs/intro/install/


