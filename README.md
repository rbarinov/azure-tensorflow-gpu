# azure-tensorflow-gpu

Script to deploy a working nvidia-docker enabled GPU machine in Azure cloud

## What do you need before creating a cluster

- installed AZ CLI https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
- logged in AZ CLI (az login)

## Patch a script for you

you can change vm instance size, vm os disk size, etc

## Run it

After you have AZ CLI installed and logged in, run a script and specify your deployment name

```$ ./create-gpu-machine tensor-trainer```

It take about 5 mins to deploy and configure. You will get all the output in STDOUT and in a file ```tensor-trainer.log``` where are all the IPs, keys, etc. Save it for later use.

## Example of logs

```
todo
```
