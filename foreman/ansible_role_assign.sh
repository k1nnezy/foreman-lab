#!/bin/bash
# Назначение Ansible-роли на Host Group через hammer
# Использование: ./ansible_role_assign.sh <hostgroup_id> <role_id>

set -e
HG_ID=$1
ROLE_ID=$2

if [ -z "$HG_ID" ] || [ -z "$ROLE_ID" ]; then
  echo "Usage: $0 <hostgroup_id> <role_id>"
  echo "Найти ID: hammer hostgroup list ; hammer ansible roles list"
  exit 1
fi

hammer hostgroup ansible-roles assign --id "$HG_ID" --ansible-role-ids "$ROLE_ID"
echo "Роль назначена. Проверка:"
hammer hostgroup ansible-roles list --id "$HG_ID"
