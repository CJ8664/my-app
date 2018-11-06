# Install ansible in Travis
pip install ansible

# Run the ansible playbook
ansible-playbook -i "${ANSIBLE_HOSTS}" "${ANSIBLE_PLAYBOOK}" -u "${ANSIBLE_SSH_USER}"
