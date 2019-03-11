# AbsoluteAPI

The company you work for is starting a new Java project called AbsoluteAPI. You have been assigned to design the build and deployment framework using Ansible, docker, and Jenkins. You decide to write ansbile playbooks to build a simple environment using docker to demonstrate the framework to your team members. 

This scenario will address:
- **Provisioning servers with Vagrant and VirtualBox.**
- **Provisioning applications with Ansible Playbooks and Host Inventory file.**
- **Continuous Integration with GitLab, Jenkins, and Docker.**

## Prerequisites
-  [Vagrant](https://www.vagrantup.com/downloads.html):  
-  [VirtualBox](https://www.virtualbox.org/wiki/Downloads): 


## Building with Vagrantfile

It builds 4 images.
- Docker
- Jenkins
- GitLab
- Ansible

## Continuous Integration with GitLab, Jenkins and Docker
- Developers check the code locally on their computers
- When completed — they commit changes to the GitLab repository.
- GitLab repository sends a request (webhook) to CI system
- CI server runs a job (tests, coverage, syntax linting)
- CI server releases saved artifacts for testing
- If the build or tests fail, the CI server alerts the team
- The team fixes the issue with constant deploy and feedback mechanism in place.


## Installation

```sh 
git clone https://github.com/atulmakkar/AbsoluteAPI.git
cd AbsoluteAPI
vagrant up --provider=virtualbox
```

