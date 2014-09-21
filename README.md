
##Apache Tez cluster on Docker

The container’s code is available on our [GitHub](https://github.com/sequenceiq/docker-ambari/tree/1.7.0-ea-tez) repository.

###Pull the image from the Docker Repository

We suggest to always pull the container from the official Docker repository - as this is always maintained and supported by us. 

```
docker pull sequenceiq/ambari:1.7.0-ea-tez
```

<!-- more -->

### Building the image

Alternatively you can always build your own container based on our Dockerfile. 

```
docker build --rm -t sequenceiq/ambari:1.7.0-ea-tez ambari-server/
```

## Running the cluster

We have put together a few shell functions to simplify your work, so before you start make sure you get the following `ambari-functions` [file](https://github.com/sequenceiq/docker-ambari/blob/1.7.0-ea-tez/ambari-functions). 

```
curl -Lo .amb j.mp/docker-ambari-tez && . .amb
```

###Create your Apache Tez cluster

You are almost there. The only thing you will need to do is to specify the number of nodes you need in your cluster. We will launch the containers, they will dynamically join the cluster and apply the Tez specific configurations. 

```
amb-deploy-cluster 4
```

Once the cluster is started you can [enter](http://blog.sequenceiq.com/blog/2014/07/05/docker-debug-with-nsenter-on-boot2docker/) in the container and submit your custom Tez application or use one of the stock Tez examples.
