storage "raft" {
  path = "/vault/data"
  node_id = "node1"
}
listener "tcp" {
  address = "0.0.0.0:8200"
  tls_cert_file = "/vault/certs/cert.pem"
  tls_key_file = "/vault/certs/key.pem"
}
disable_mlock = true
api_addr = "https://vault.local.maki.lol:8200"
cluster_addr = "https://vault.local.maki.lol:8201"
ui = true
log_level = "Trace"