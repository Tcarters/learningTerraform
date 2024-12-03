

### What are modules for?

1. Organize configuration - Modules make it easier to navigate, understand, and update your configuration by keeping related parts of your configuration together. By using modules, you can organize your configuration into logical components.

2. Encapsulate configuration - Another benefit of using modules is to encapsulate configuration into distinct logical components. 

3. Re-use configuration - Writing all of your configuration from scratch can be time consuming and error prone. Using modules can save time and reduce costly errors by re-using configuration written either by yourself, other members of your team, or other Terraform practitioners who have published modules for you to use. You can also share modules that you have written with your team or the general public, giving them the benefit of your hard work.

3. Provide consistency and ensure best practices - Modules also help to provide consistency in your configurations. 

4. Self service - Modules make your configuration easier for other teams to use. The HCP Terraform registry lets other teams find and re-use your published and approved Terraform modules. You can also build and publish no-code ready modules, which let teams without Terraform expertise provision their own infrastructure that complies with your organization's standards and policies.

### What is a Terraform module?

A Terraform module is a set of Terraform configuration files in a single directory. Even a simple configuration consisting of a single directory with one or more .tf files is a module


### Structure for Terraform Module

```bash
.
├── LICENSE
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf

```

### Calling modules

> Terraform commands will only directly use the configuration files in one directory, which is usually the current working directory. However, your configuration can use module blocks to call modules in other directories. When Terraform encounters a module block, it loads and processes that module's configuration files.


A module that is called by another configuration is sometimes referred to as a "child module" of that configuration.


### Local and remote modules

Modules can either be loaded from the local filesystem, or a remote source. Terraform supports a variety of remote sources, including the Terraform Registry, most version control systems, HTTP URLs, and HCP Terraform or Terraform Enterprise private module registries.



### Module best practices

1. Name your provider terraform-<PROVIDER>-<NAME>. You must follow this convention in order to publish to the HCP Terraform or Terraform Enterprise module registries.

2. Start writing your configuration with modules in mind.

3. Use local modules to organize and encapsulate your code. Even if you aren't using or publishing remote modules, organizing your configuration in terms of modules from the beginning will significantly reduce the burden of maintaining and updating your configuration as your infrastructure grows in complexity.

4. Use the public Terraform Registry to find useful modules. This way you can more quickly and confidently implement your configuration by relying on the work of others to implement common infrastructure scenarios.

5. Publish and share modules with your team. Most infrastructure is managed by a team of people, and modules are important way that teams can work together to create and maintain infrastructure. As mentioned earlier, you can publish modules either publicly or privately. Module users can reference published child modules in a root module, or deploy no-code ready modules through the HCP Terraform UI.


## Step 1: Notion 1

## Step 2: Notion 2