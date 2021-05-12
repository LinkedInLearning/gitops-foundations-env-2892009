# ArgoCD Demonstration
This directory contains the example materials used in the ArgoCd demonstration that is part of the LinkedIn Learning course `GitOps Foundations`. The full course is available from [LinkedIn Learning][lil-course-url].

In this demonstration we deploy a containerized application onto ArgoCd using a GitOps approach.

![course-name-alt-text][lil-thumbnail-url] 

## Required Tools
1.  **Docker** is used as the underlying container platform for building and running containers.  You can download and install Docker for your platform using the [official installation guide][docker-install].
2.  **k3d** is used to manage and establish the underlying k3s kubernetes cluster that runs ArgoCD.  You can download and install k3d using their [getting started guide] [k3d-start].
3.  **kubectl** is a command line tool used to run commands against the Kubernetes cluster.  You can download and install kubectl by following the installation instructions on the [official site][kube-site].
4.  **ArgoCd** is the GitOps operator that runs in the cluster and applies the example manifests.  You can download and install ArgoCd by following the tools [getting started guide][argo-start].

## Instructions
This folder contains the example files for the ArgoCD demonstrations, prior to  pertaining to the tool and more information about the prerequisite technologies.

## Branches
The branches are structured to correspond to the videos in the course. The naming convention is `CHAPTER#_MOVIE#`. As an example, the branch named `02_03` corresponds to the second chapter and the third video in that chapter. 
Some branches will have a beginning and an end state. These are marked with the letters `b` for "beginning" and `e` for "end". The `b` branch contains the code as it is at the beginning of the movie. The `e` branch contains the code as it is at the end of the movie. The `main` branch holds the final state of the code when in the course.

## Installing
1. To use these exercise files, you must have the following installed:
	- [list of requirements for course]
2. Clone this repository into your local machine using the terminal (Mac), CMD (Windows), or a GUI tool like SourceTree.
3. [Course-specific instructions]


[0]: # (Replace these placeholder URLs with actual course URLs)

[lil-course-url]: https://www.linkedin.com/learning/
[lil-thumbnail-url]: http://
[k3d-start]: https://k3d.io/#installation
[docker-install]: https://docs.docker.com/engine/install/
[kube-site]: https://kubernetes.io/docs/tasks/tools/
[argo-start]: https://argoproj.github.io/argo-cd/getting_started/
