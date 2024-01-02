# terraform module

Testing out some stuff


# Usage with Terraform Cloud / Enterprise

Add this section

```
terraform {
  cloud {
    organization = "bjarte-org"

    workspaces {
	  project = "dev-banking"
      name = "api-dev-bjartetest"
    }
  }
}
```
