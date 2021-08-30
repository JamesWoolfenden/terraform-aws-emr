# tf-scaffold

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

This repository exists to help with new terraform projects, and with automation and training.
The repository is designed to create the structure- scaffold that is alway needed for a new Terraform project.
Included are the basic Github Actions.
To clone scaffold repository but with no .git folder.

## Powershell

```powershell
git clone --depth=1 git@github.com:JamesWoolfenden/tf-scaffold.git scaffold
rm scaffold\.git -recurse -force
```

Edit your profile and add:

```powershell
function scaffold {
   param(
         [parameter(mandatory=$true)]
         [string]$name,
         [string]$branch="master")
   git clone --depth=1 --branch=$branch git@github.com:JamesWoolfenden/tf-scaffold.git "$name"
   rm "$name\.git" -recurse -force
}
```

or

```powershell
function scaffold {
   param(
         [parameter(mandatory=$true)]
         [string]$name,
         [string]$branch="master",
         [switch]$repo=$false)

   if (!(test-path .\$name))
   {
       git clone --depth=1 --branch=$branch git@github.com:JamesWoolfenden/tf-scaffold.git "$name"
   }
   else{
      write-warning "Path $name already exists"
      return
   }

   rm "$name\.git" -recurse -force
   cd $name
   echo "# %name" >README.md
   if ($repo)
   {
      git init|git add -A
      pre-commit install
      git commit -m "Initial Draft"
   }
}
```

Then you can use:

```powershell
scaffold -name hello-world
```

or to start a new git repo as well:

```powershell
scaffold -name hello-world -repo
```

To make a new project anytime you like.

## \*Nix

```cli
git clone --depth=1 git@github.com:JamesWoolfenden/tf-scaffold.git scaffold| rm !$/.git -rf
```

Or you add this to your ~/.bashrc

```bash
function scaffold() {
if [ -z "$1" ]
then
   name="scaffold"
else
   name=$1
fi

if [ -z "$2" ]
then
   branch="master"
else
   branch=$2
fi


echo "git clone --depth=1 --branch $branch git@github.com:JamesWoolfenden/tf-scaffold.git $name"
git clone --depth=1 --branch $branch git@github.com:JamesWoolfenden/tf-scaffold.git $name
rm $name/.git -rf
}
```

## Usage

Once it's in your profile, pretty straigh forward:

```cli
 $ scaffold terraform-aws-generic
git clone --depth=1 git@github.com:JamesWoolfenden/tf-scaffold.git terraform-aws-generic
Cloning into 'terraform-aws-generic'...
remote: Enumerating objects: 14, done.
remote: Counting objects: 100% (14/14), done.
remote: Compressing objects: 100% (9/9), done.
remote: Total 14 (delta 0), reused 10 (delta 0), pack-reused 0
Receiving objects: 100% (14/14), done.
```

## So what's in it

### .gitignore

Has good defaults for working with Terraform

### .pre-commit-config.yaml

Has a standard set of pre-commit hooks for working with Terraform and AWS. You'll need to install the pre-commit framework <https://pre-commit.com/#install>.
And after you've added all these file to your new repo, in the root of your new repository:

```cli
pre-commit install
```

### main.tf

This is an expected file for Terraform modules. I don't use it.

### Makefile

This is just to make like easier for you. Problematic if you are cross platform as make isn't very good/awful at that.

### outputs.tf

A standard place to return values, either to the screen or to pass back from a module.

### provider.aws.tf

You are always going to be using these, I have added the most basic provider for AWS.

### README.md

Where all the information goes.

### main.auto.tfvars

This is the standard file for setting your variables in. The auto keyword ensures its picked up and used by Terraform.

### variables.tf

Contains a map variable **common_tags** which should be extended and used on
every taggable object.

### .dependsabot/config.yml

Sets the repository to be automatically dependency scanned in github.

## terraform-docs

If you leave the section below in your **README.md** then the pre-commit will auto update your docs.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_emr_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_cluster) | resource |
| [aws_emr_security_configuration.examplea](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/emr_security_configuration) | resource |
| [aws_iam_instance_profile.examplea](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.emr_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.emr_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.emr_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.iam_emr_profile_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_security_group.emr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"examplea"` | no |
| <a name="input_release_label"></a> [release\_label](#input\_release\_label) | n/a | `string` | `"emr-5.27.0"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
| <a name="output_config"></a> [config](#output\_config) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
