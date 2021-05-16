# Flux Demonstration
This directory contains the example materials used in the Flux demonstration that is part of the LinkedIn Learning course `GitOps Foundations`. The full course is available from [LinkedIn Learning][lil-course-url].

In this demonstration we deploy a containerized application onto an AKS Kubernetes cluster using the Flux operator.

## Required Tools
1.  **Terraform** is used to provision the underlying Kubernetes cluster that runs the workloads of the example cloud native application.  You can download and install Terraform for your platform using the [official installation guide][terraform-install].
2.  **kubectl** is a command line tool used to run commands against the Kubernetes cluster.  You can download and install kubectl by following the installation instructions on the [official site][kube-site].
3.  **Azure CLI** is a command line interface that is used with Azure Cloud platform.  You can download and install the Azure CLI by following the instructions on the [official website][azurecli-start].
4.   **Flux** is a continuous deployment tool that uses a GitOps approach to manage operations of workloads on a Kubernetes clusters.  You can download and install Flux by following the instructions in the getting [started guide][flux-start].


## Instructions
This folder contains the example files for the Flux demonstration.  Prior to applying these manifests on the Kubernetes cluster with GitOps you must build and store the container images into DockerHub using these [instructions][setup-instructions].  After completing those instructions, follow along with the steps in the course to deploy the resources to the cluster.

The application will be made available on Azure via a Loadbalancer that uses some built in integration with Azure to establish a DNS label.  The configuration of the service uses your DockerHub username to establish the DNS label and it will vary based on the region you have deployed the workload.  It should look something like this:
```
[DockerHubId].[AzureRegion].cloudapp.azure.com
```

## Commands
The following commands are used in the demonstrations.  They are provided within the readme file so that you can copy and paste them while working through the course.

1. Flux Installation Script

```
curl -s https://fluxcd.io/install.sh | sudo bash
```

2. Bootstrap the Flux Config Repository

For Personal Accounts:
```
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=flux-clusters-config \
  --branch=main \
  --path=./clusters/cluster1 \
  --personal
```

For Organizational Accounts:
```
flux bootstrap github \
  --owner=Kevin-Bowersox-Courses \
  --repository=flux-clusters-config \
  --branch=main \
  --path=./clusters/cluster1
```

3. Create a Source to Point Flux to the Desired State
```
flux create source git gitops-foundations \
  --url=https://github.com/Kevin-Bowersox-Courses/gitops-foundations-env-2892009.git \
  --branch=main \
  --interval=30s \
  --export > ./clusters/cluster1/gitops-foundations-source.yaml
```

4.  Create a Kustomization to Deploy the Desired State Found in the Source
```
flux create kustomization gitops-foundations \
  --source=gitops-foundations \
  --path=./flux \
  --prune=true \
  --validation=client \
  --interval=1m \
  --export > ./clusters/cluster1/gitops-foundations-kustomization.yaml
```

5.  Watch the Kustomization
```
watch flux get kustomizations
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


