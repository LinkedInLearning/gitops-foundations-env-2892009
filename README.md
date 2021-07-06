# GitOps Foundations
This is the repository for the LinkedIn Learning course GitOps Foundations. The full course is available from [LinkedIn Learning][lil-course-url].

![GitOps Foundations][lil-thumbnail-url] 

If there is one constant in the software industry, it is the need for both speed and accuracy. GitOps can help fill both needs. GitOps is an operational model that extends DevOps with additional concepts that allow teams to accelerate the delivery of cloud native applications in a manner that is more consistent, reliable, transparent, and secure. In this course, instructor Kevin Bowersox walks you through the basics of the GitOps pattern, its key principles, and its practical use. Using hands-on demonstrations with Kubernetes, Kevin explains building blocks such as declarative configuration, automated change delivery, reconciliation, and more. Throughout the course, you’ll be introduced to a variety of tools you can use that take a GitOps approach, including Terraform, Argo CD, Flux, and Flagger.

## Instructions
The course uses the Ubuntu operating system to power the hands-on demonstrations.  If you are using a Windows workstation you can download and install a virtualization tool to run Ubuntu on a VM or alternatively you can use the [Windows Subsystem for Linux][wsl].

This repository contains a folder for each of the tools used within the course.  Inside of each folder, you'll find the files for the example demonstrations pertaining to the tool and more information about the prerequisite technologies.

## Installing
1. To follow along with hands-on demonstrations, you must have the following accounts:
	- **GitHub** is used as the repository manager that hosts the git repositories used throughout the course.  You can sign up for an account on the [GitHub][github] website.
	- **DockerHub** is used to store container images that will be ran throughout the course in specific examples.  Create an account on the [DockerHub][docker-hub] website.
	- **Azure** is the cloud platform used to provision elastic infrastructure such as Kubernetes clusters.  You can create a trial account on the [Azure][azure-site] website.
	- **CircleCi** is the continuous integration platform used in a single lesson in the course.  If you choose to follow along with this lesson, you'll need an account on the platform.  A trial account can be obtained on the [CircleCi][circle] website.
2. To use these exercise files, you must have the following installed:
	- **Docker** is used as the underlying container platform for building and running containers.  You can download and install Docker for your platform using the [official installation guide][docker-install].
4. Clone this repository into your local machine using the terminal (Mac), CMD (Windows), or a GUI tool like SourceTree.
5. After cloning the repository, login to DockerHub with the following command `docker login`.
6. Once logged into DockerHub execute the `setup.sh` script with the following command `./setup.sh [DockerHub Username]`.


### Instructor

Kevin Bowersox 
                            
Web application developer

                            

Check out my other courses on [LinkedIn Learning](https://www.linkedin.com/learning/instructors/kevin-bowersox).

[lil-course-url]: https://www.linkedin.com/learning/gitops-foundations
[lil-thumbnail-url]: https://cdn.lynda.com/course/2892009/2892009-1625008421822-16x9.jpg




[0]: # (Replace these placeholder URLs with actual course URLs)

[docker-hub]: https://hub.docker.com/
[azure-site]: https://azure.microsoft.com/en-us/
[circle]: https://circleci.com/
[docker-install]: https://docs.docker.com/engine/install/
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[github]:https://github.com/

