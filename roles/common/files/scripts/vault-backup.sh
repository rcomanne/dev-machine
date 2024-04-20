#!/bin/bash

export VAULT_FORMAT="json"

vault login -method=oidc

while read -r mount; do
  mount="${mount///}"
  echo "Processing engine ${mount}"
  mkdir "${mount}"
  while read -r secret; do
    echo "Processing secret ${secret}"
    vault kv get -mount "${mount}" "${secret}" | jq '.data.data' > "${mount}/${secret}.json"
    done < <(vault kv list -mount "${mount}" | jq -cr '.[]')
done < <(vault secrets list | jq -cr '. | keys[]')
