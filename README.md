# Service Template

This is a template for a microservice
This template refers to an specific language and deployment estrategy.

Different templates can be created based in this one:
- node-ecs-template (node.js project publishing in an ECS cluster);
- spring-ecs-template (springboot java project publishing in an ECS cluster);
- spring-eks-template (sprintboot java project publishing in an EKS cluster);
- java-ecs-template (basic java project publishing in an ECS cluster);

Up this time only the first one is available.

## Structure
================================================

Every service created with this template includes a Terraform folder.
A provided basic script call the modules regarding an ECS service.

The script has several variables with default provided values that can be
overridden by development team.

Target Audiente: develop team.
Beyond basic modules, dev team can select additional modules to build their solutions.


## Create Repository Pipeline
================================================

When the repository is created a pipeline is triggered.
This pipeline perform two things:

- a workspace is created in Terraform Cloud for each environment for this particular service;
- a upload role is created in AWS and assigned to the service;

The workspace's name will have the repository name plus the environment as suffix.

The upload role can perform ECR upload operations only from the selected repository.


## Pull Request Pipeline
================================================

Upon pull request creation a pipeline is triggered.
This pipeline perform below actions:

1- Code compile

Service code is compiled and unity tests are executed.
There tests are a placeholder for whatever the development teams create as tests.

*There's no quality control service calls currently in stack*

2- Terraform plan

A `terraform plan` command is issued based in branch's code.

The plan result is showed in pull request comments.


## Push Main Pipeline
================================================

Any write in main branch (including pushes) will trigger the publish pipeline.

This pipeline perform these actions:
- a `terraform apply` is issued in the workspace;
- service code is compiled and unity tests are triggered;
- compiled code is packaged in a docker image and uploaded to ECR;
- service task definition is updated to point to new image;

Since all workspaces created by stack has autoApply flag turned on there's no
human intervention needed at this point.

Once this pipeline is complete the service endpoint will be available in a
public API Gateway distribution.
