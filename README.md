# GitOps Foundations
This is the repository for the LinkedIn Learning course `GitOps Foundations`. The full course is available from [LinkedIn Learning][lil-course-url].

![course-name-alt-text][lil-thumbnail-url] 

## Instructions
This repository contains a folder for each of the tools used within the course.  Inside of each folder, you'll find the files for the example demonstrations pertaining to the tool and more information about the prerequisite technologies.

## Installing
1. To use these exercise files, you must have the following accounts:
	- **DockerHub** is used to store container images that will be ran throughout the course in specific examples.  Create an account on the [DockerHub][docker-hub] website.
	- **Azure** is the cloud platform used to provision elastic infrastructure such as Kubernetes clusters.  You can create a trial account on the [Azure][azure-site] website.
2. To use these exercise files, you must have the following installed:
	- **Docker** is used as the underlying container platform for building and running containers.  You can download and install Docker for your platform using the [official installation guide][docker-install].
4. Clone this repository into your local machine using the terminal (Mac), CMD (Windows), or a GUI tool like SourceTree.
5. After cloning the repository, login to Docker with the following command `docker login`.
6. Once logged into DockerHub execute the `setup.sh` script with the following command `./setup.sh [DockerHub Username]`.


[0]: # (Replace these placeholder URLs with actual course URLs)

[lil-course-url]: https://www.linkedin.com/learning/
[lil-thumbnail-url]: http://
[docker-hub]: https://hub.docker.com/
[azure-site]: https://azure.microsoft.com/en-us/

