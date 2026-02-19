{ ... }: {
  services.jupyter = {
    enable = true;
    command = "jupyter lab";
    password = "argon2:$argon2id$v=19$m=10240,t=10,p=8$xHCdewiogD9n5+QAKyJaOQ$hhuScN7/YkLz217Shzg5cSptugJ8n6Zeo5frVr9QL4Y";
    ip = "127.0.0.1";
    notebookConfig = ''
      c.ServerApp.allow_remote_access = True
      c.ServerApp.trust_xheaders = True
    '';
  };
}
