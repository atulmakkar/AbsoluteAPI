#!/bin/sh

USER=vagrant
PASSWORD=vagrant

# add addresses to /etc/hosts 
echo "10.211.10.1 ansible.absolute.com" | sudo tee -a /etc/hosts 
echo "10.211.10.2 gitlab.absolute.com" | sudo tee -a /etc/hosts 
echo "10.211.10.3 jenkins.absolute.com" | sudo tee -a /etc/hosts 
echo "10.211.10.4 docker.absolute.com" | sudo tee -a /etc/hosts 

echo " " | sudo tee -a /etc/ansible/hosts
echo "[all]" | sudo tee -a /etc/ansible/hosts
echo "gitlab.sample.com" | sudo tee -a /etc/ansible/hosts 
echo "jenkins.sample.com" | sudo tee -a /etc/ansible/hosts 
echo "docker.sample.com" | sudo tee -a /etc/ansible/hosts 

echo " " | sudo tee -a /etc/ansible/hosts
echo "[jenkins]" | sudo tee -a /etc/ansible/hosts
echo "jenkins.sample.com" | sudo tee -a /etc/ansible/hosts

echo " " | sudo tee -a /etc/ansible/hosts
echo "[docker]" | sudo tee -a /etc/ansible/hosts
echo "docker.sample.com" | sudo tee -a /etc/ansible/hosts

echo " " | sudo tee -a /etc/ansible/hosts
echo "[gitlab]" | sudo tee -a /etc/ansible/hosts
echo "gitlab.sample.com" | sudo tee -a /etc/ansible/hosts

# permissioning
dos2unix ~/artifacts/scripts/ssh_pass.sh
chmod +x ~/artifacts/scripts/ssh_pass.sh

# password less authentication using expect module
~/artifacts/scripts/ssh_pass.sh $USER $PASSWORD "ansible.absolute.com" 
~/artifacts/scripts/ssh_pass.sh $USER $PASSWORD "docker.absolute.com" 
~/artifacts/scripts/ssh_pass.sh $USER $PASSWORD "jenkins.absolute.com"
~/artifacts/scripts/ssh_pass.sh $USER $PASSWORD "gitlab.absolute.com"

ansible-playbook ~/artifacts/playbooks/install_java.yaml
ansible-playbook ~/artifacts/playbooks/install_jenkins.yaml
ansible-playbook ~/artifacts/playbooks/install_docker.yaml
ansible-playbook ~/artifacts/playbooks/install_gitlab.yaml
