# Create Vault file
echo $ANSIBLE_VAULT_PASS > vault_pass_file

# Run the ansible playbook
ansible-playbook -i "${ANSIBLE_INVENTORY}" "${ANSIBLE_PLAYBOOK}" --vault-password-file vault_pass_file --extra-vars "build_env=beta" 

# Remove Vault file
rm -f vault_pass_file
