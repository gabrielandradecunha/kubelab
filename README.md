# Kubelab

This is my Kubernetes cluster for testing and studying. I use Ansible for remote configuration, Jenkins as a CI/CD server, PostgreSQL for relational databases, and my personal PHP app for music, mymp3.

## Installation and Usage

I make an effort to add an install.sh script to all my projects. The idea is that you can simply download the script, run it on your Linux environment (regardless of the distribution), and have the project running on your machine.

   ```bash
   sudo chmod +x install.sh
   sudo ./install.sh
   ```
### Manual instalation
   ```bash
   git clone https://github.com/gabrielandradecunha/homelab.git
   cd homelab
   chmod +x start.sh
   sudo start.sh
   ```

### Remote instalation with Ansible
   ```bash
   ansible-playbook -i Ansible/inventory.ini Ansible/playbook.yml
   ```

<h1>Technology Stack</h1>

<p>Below are the technologies that make up my homelab stack, each serving a specific role to ensure efficiency, automation, and organization:</p>

<ul>
    <li><strong>Kubernetes</strong>: Used as the orchestration platform for managing containerized applications, ensuring scalability, high availability, and efficient resource utilization.</li>
    <li><strong>Docker</strong>: Used as the <em>Container Engine</em> to manage and isolate applications in a flexible and scalable manner.</li>
    <li><strong>Ansible</strong>: An automation tool for remote configuration via <em>SSH</em>, simplifying the administration and provisioning of machines in the homelab.</li>
    <li><strong>Jenkins</strong>: An automation server dedicated to continuous integration and task automation, such as testing and deployments, to speed up the development lifecycle.</li>
    <li><strong>PostgreSQL</strong>: A robust and reliable database for managing application data, supporting complex transactions and high scalability.</li>
    <li><strong>MyMp3</strong>: A personal application developed to store and organize my music library, providing easy access and control over my tracks.</li>
</ul>
