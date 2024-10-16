### Install azure cli cmd

```bash

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

```

### Authenticate to Azure account through CLI:

```bash

az login
# Due to MFA added in May 2024, use below type to sign

az login --tenant <TENANT-ID>

az account set --subscription </SUBSCRIPTION-ID>
```