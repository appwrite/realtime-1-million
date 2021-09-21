# Appwrite Realtime Benchmark

## Local dependencies
- `ansible`
    > install with your favorite package manager
- `ansible.posix`
    > ansible-galaxy collection install ansible.posix

## Running

- Spin up manager and worker nodes with private IPv4 address
    - Make sure SSH keys are included so Ansible can issue commands
    - Public IPv4 addresses go in ansible `hosts` file
    - Private IPv4 addresses go in `etchosts` as they should appear in /etc/hosts on manager node
    - Private IPv4 address of master goes in `etchostsworker` 

    ```bash
    $ ssh-keygen -f ./id_rsa
    $ ansible-playbook -i ./hosts ./playbook.yml
    ```
