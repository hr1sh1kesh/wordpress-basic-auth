
The Dockerfile in this repository would build a Wordpress container with the `Basic-Auth` plugin already installed on it. 

Apply the wordpress application stack using kubectl 
``` kubectl apply -f wp.yaml```

This would create 
- 2 Storageclasses (This depends on Portworx being installed already) 
- 2 PVCs using the storage classes. 
- 3 Wordpress pods. 
- 1 mysql pod.  

Vegeta exercies the wordpress application by creating wordpress posts. It requires the Basic-Auth plugin for exercising the REST API endpoints of wordpress.The Basic-Auth plugin needs to be enabled through the Wordpress GUI before you run the vegeta load generator application.

    There is a WIP kubernetes job which would install Wordpress after the pods have spun up as well as enable the plugin but it isnt ready yet. wp-cli.yaml

To load test the application via vegeta apply the kubernetes job in `wp-attack.yaml`
Below are the parameters that need to be passed as arguments to the Pod. The pod runs a golang cli app 

Note: 
- `-a` the context root url of the wordpress API. (eg: `http://<nodeIP>:<nodeport>`)
- `-n` the number of requests to be generated per second.
- `-d` the duration of the test in seconds.
- `-u` the user which was created while installing wordpress via the gui. 
- `-p` the password of the user.

Usage: 
    `vegeta-wp-load loadgen -a http://70.0.149.108:30303/ -n 5 -d 50 -u loadgenuser -p loadgenpass`