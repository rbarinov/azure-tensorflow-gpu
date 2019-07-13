# azure-tensorflow-gpu

Script to deploy a working nvidia-docker enabled GPU machine in Azure cloud

## What do you need before creating a cluster

- installed AZ CLI https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
- logged in AZ CLI (az login)

## Patch a script for you

you can change vm instance size, vm os disk size, etc

## Run it

After you have AZ CLI installed and logged in, run a script and specify your deployment name

```$ ./create-gpu-machine trainer```

It take about 5 mins to deploy and configure. You will get all the output in STDOUT and in a file ```trainer.log``` where are all the IPs, keys, etc. Save it for later use.

## Example of logs

```
2019.07.13 22:34:06: HELLO
2019.07.13 22:34:09: CREATED Resource Group trainer in westeurope
2019.07.13 22:34:15: CREATED VNET trainer-vnet
2019.07.13 22:34:33: CREATED Network Security Group trainer-nsg with open ports: 22
2019.07.13 22:34:42: CREATED Static IP trainer-vm-ip XXX.XXX.XXX.XXX for trainer-vm
2019.07.13 22:35:15: CREATED NIC trainer-vm-nic for trainer-vm with NSG trainer-nsg
2019.07.13 22:35:17: CREATED VM trainer-vm with disk OS 80gb with user trainer. => ssh trainer@XXX.XXX.XXX.XXX
2019.07.13 22:35:17: SETTING UP VM
2019.07.13 22:35:17: Waiting trainer-vm IP:XXX.XXX.XXX.XXX to become alive
2019.07.13 22:36:45: Connected to trainer-vm IP:XXX.XXX.XXX.XXX as trainer
2019.07.13 22:41:43: Installed docker and cuda drivers to trainer-vm, rebooting now
2019.07.13 22:41:53: Waiting trainer-vm IP:XXX.XXX.XXX.XXX to become alive
2019.07.13 22:42:36: Installed nvidia-docker2 to trainer-vm
2019.07.13 22:42:36: ALL WORK DONE!
2019.07.13 22:42:36: HOST:
2019.07.13 22:42:36: XXX.XXX.XXX.XXX
2019.07.13 22:42:36: connect to vm via ssh:
2019.07.13 22:42:36: ssh trainer@XXX.XXX.XXX.XXX
2019.07.13 22:42:36: BYE BYE!
```

## Example

Ssh into vm and try running some docker containers

```
docker run \
    --runtime=nvidia \
    --rm \
    nvidia/cuda \
    nvidia-smi
```


## Run a real app

Ssh into vm and start tensorflow with gpu, py3, jupyter

```
docker run \
    --runtime=nvidia \
    --name tensorflow \
    --restart always \
    -d \
    -p 6006:6006 \
    -p 8888:8888 \
    tensorflow/tensorflow:latest-gpu-py3-jupyter
```

Execute bash in a running conatiner

```
# exec bash as root
docker exec \
    -ti \
    tensorflow \
    bash
```

```
# exec bash as non-priviledged user
docker exec \
    -ti \
    -u $(id -u):$(id -g) \
    tensorflow \
    bash
```
