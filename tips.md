# Tips command for building infra

Working process...

### Expose docker engine on actual machine host network

```sh
terraform -install-autocomplete

# Make docker engine listen to machine local IP
 netsh interface portproxy add v4tov4 listenport=2375 listenaddress=0.0.0.0 connectaddress=127.0.0.1 connectport=2375
```

### Process for creating infra in gcp using tf

- After creating the Infra with tf
- Auth to gcp using cli cmd ``gcloud auth application-default login``
- Initialize configuration: ``terraform init``
- Format configuration:
    `` terraform fmt `` ~> terraform fmt command automatically updates configurations in the current directory for readability and consistency.

- Validate config files:
    ``terraform validate`` ~> r configuration is syntactically valid and internally consistent

- Inspect state
    When you applied your configuration, Terraform wrote data into a file called ``terraform.tfstate``. Terraform stores the IDs and properties of the resources it manages in this file, so that it can update or destroy those resources going forward.
