```
docker-compose -f vault/docker-compose.yml up 
```

```
export VAULT_ADDR=https://vault.local.maki.lol:8200
export VAULT_CACERT=$PWD/vault/certs/ca.pem
vault operator init
```

```
vault operator unseal <Unseal Key 1>
vault operator unseal <Unseal Key 2>
vault operator unseal <Unseal Key 3>
```

```
vault login <Initial Root Token>
```

```
vault secrets enable -path=secret -version=2 kv
```

```
vault kv put secret/demo \
  info.vault.name=demo \
  info.vault.message='Hello World!'
```

```
vault policy write spring vault/config/spring.hcl
vault auth enable approle
vault write -f auth/approle/role/spring policies=spring period=1h
```

```
vault read auth/approle/role/spring/role-id
vault write -f auth/approle/role/spring/secret-id
```

Update `spring.cloud.vault.app-role.role-id` and `spring.cloud.vault.app-role.secret-id` with values retrieved above.

Run the app and go to http://localhost:8080/actuator/info