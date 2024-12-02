

### What are modules for?

1. Organize configuration - Modules make it easier to navigate, understand, and update your configuration by keeping related parts of your configuration together. By using modules, you can organize your configuration into logical components.

2. Encapsulate configuration - Another benefit of using modules is to encapsulate configuration into distinct logical components. 

3. Re-use configuration - Writing all of your configuration from scratch can be time consuming and error prone. Using modules can save time and reduce costly errors by re-using configuration written either by yourself, other members of your team, or other Terraform practitioners who have published modules for you to use. You can also share modules that you have written with your team or the general public, giving them the benefit of your hard work.

3. Provide consistency and ensure best practices - Modules also help to provide consistency in your configurations. 

4. Self service - Modules make your configuration easier for other teams to use. The HCP Terraform registry lets other teams find and re-use your published and approved Terraform modules. You can also build and publish no-code ready modules, which let teams without Terraform expertise provision their own infrastructure that complies with your organization's standards and policies.

### What is a Terraform module?

A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module


```bash
.
├── LICENSE
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf

```


- A module that is called by another configuration is sometimes referred to as a "child module" of that configuration.




### Structure for Terraform Module

## Step 1: Notion 1

## Step 2: Notion 2