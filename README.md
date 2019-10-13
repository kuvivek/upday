Task 2: 

1. Create a Dockerfile with the java run time available docker image.

2. Build the image and run the Docker container with the following commands

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ docker build . -t kuvivek/upday/helloworld:1
Sending build context to Docker daemon  20.05MB
Step 1/6 : FROM openjdk:8-jre-slim
8-jre-slim: Pulling from library/openjdk
b8f262c62ec6: Pull complete
377e264464dd: Pull complete
3198ebe94151: Pull complete
722dfeae3f41: Pull complete
Digest: sha256:7846e284589aecedc522025d9400fcadf462aa52eecf6fe7075107679972bf3e
Status: Downloaded newer image for openjdk:8-jre-slim
 ---> 2f3e3d80f12c
Step 2/6 : MAINTAINER Vivek Kumar vivekkumar.bitsindri@gmail.com
 ---> Running in 6b80d5ce4655
Removing intermediate container 6b80d5ce4655
 ---> 34650c01c2d9
Step 3/6 : WORKDIR /app
 ---> Running in b6c7663e2632
Removing intermediate container b6c7663e2632
 ---> bc413f70e978
Step 4/6 : RUN apt-get update && apt-get install -y -q --no-install-recommends wget && apt-get clean  && rm -r /var/lib/apt/lists/*
 ---> Running in cb884f218126
Get:2 http://cdn-fastly.deb.debian.org/debian buster InRelease [122 kB]
Get:1 http://security-cdn.debian.org/debian-security buster/updates InRelease [39.1 kB]
Get:3 http://cdn-fastly.deb.debian.org/debian buster-updates InRelease [49.3 kB]
Get:4 http://security-cdn.debian.org/debian-security buster/updates/main amd64 Packages [98.2 kB]
Get:5 http://cdn-fastly.deb.debian.org/debian buster/main amd64 Packages [7899 kB]
Get:6 http://cdn-fastly.deb.debian.org/debian buster-updates/main amd64 Packages [5792 B]
Fetched 8212 kB in 4s (2172 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following package was automatically installed and is no longer required:
  lsb-base
Use 'apt autoremove' to remove it.
The following additional packages will be installed:
  libpcre2-8-0 libpsl5
Recommended packages:
  publicsuffix
The following NEW packages will be installed:
  libpcre2-8-0 libpsl5 wget
0 upgraded, 3 newly installed, 0 to remove and 7 not upgraded.
Need to get 1168 kB of archives.
After this operation, 4017 kB of additional disk space will be used.
Get:1 http://cdn-fastly.deb.debian.org/debian buster/main amd64 libpcre2-8-0 amd64 10.32-5 [213 kB]
Get:2 http://cdn-fastly.deb.debian.org/debian buster/main amd64 libpsl5 amd64 0.20.2-2 [53.7 kB]
Get:3 http://cdn-fastly.deb.debian.org/debian buster/main amd64 wget amd64 1.20.1-1.1 [902 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 1168 kB in 1s (1578 kB/s)
Selecting previously unselected package libpcre2-8-0:amd64.
(Reading database ... 6888 files and directories currently installed.)
Preparing to unpack .../libpcre2-8-0_10.32-5_amd64.deb ...
Unpacking libpcre2-8-0:amd64 (10.32-5) ...
Selecting previously unselected package libpsl5:amd64.
Preparing to unpack .../libpsl5_0.20.2-2_amd64.deb ...
Unpacking libpsl5:amd64 (0.20.2-2) ...
Selecting previously unselected package wget.
Preparing to unpack .../wget_1.20.1-1.1_amd64.deb ...
Unpacking wget (1.20.1-1.1) ...
Setting up libpsl5:amd64 (0.20.2-2) ...
Setting up libpcre2-8-0:amd64 (10.32-5) ...
Setting up wget (1.20.1-1.1) ...
Processing triggers for libc-bin (2.28-10) ...
Removing intermediate container cb884f218126
 ---> f89a8fa0a0d7
Step 5/6 : RUN wget -q https://upday-interview-test.s3-eu-west-1.amazonaws.com/helloworld.jar
 ---> Running in 6fc94ac77e22
Removing intermediate container 6fc94ac77e22
 ---> ecd794ee73c9
Step 6/6 : CMD java -jar helloworld.jar
 ---> Running in e073acc8aa28
Removing intermediate container e073acc8aa28
 ---> fb0afd587ff1
Successfully built fb0afd587ff1
Successfully tagged kuvivek/upday/helloworld:1
[kuvivek@vivekcentos upday]$

```


3. Run a Docker image to test the things are working fine or not.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ docker run --rm -p 80:8080 --name node1 -t kuvivek/upday/helloworld:1

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.1.5.RELEASE)

2019-10-10 15:05:33.860  INFO 6 --- [           main] com.upday.demo.DemoApplication           : Starting DemoApplication v0.0.1-SNAPSHOT on 02aa6f1ac775 with PID 6 (/app/helloworld.jar started by root in /app)
2019-10-10 15:05:33.962  INFO 6 --- [           main] com.upday.demo.DemoApplication           : No active profile set, falling back to default profiles: default
2019-10-10 15:05:46.402  INFO 6 --- [           main] o.s.b.a.e.web.EndpointLinksResolver      : Exposing 2 endpoint(s) beneath base path '/actuator'
2019-10-10 15:05:55.232  INFO 6 --- [           main] o.s.b.web.embedded.netty.NettyWebServer  : Netty started on port(s): 8080
2019-10-10 15:05:55.369  INFO 6 --- [           main] com.upday.demo.DemoApplication           : Started DemoApplication in 25.325 seconds (JVM running for 30.723)

```


4. Kill the above docker container and run it in the detached mode.
If we look carefully the contextPath exposed by this REST API service is /actuator.
We need to explore this by executing the curl commands.


```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ docker run --rm -d -p 80:8080 --name node1 -t kuvivek/upday/helloworld:1
c557c3fdf42a6102ab005afee5db02eff1028686afe1a139aa52a9b8b54172a8
[kuvivek@vivekcentos upday]$

```

5. In another terminal Execute the below command to check whether the port 80 is mapped to the container 8080 port.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ sudo docker ps -a
CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS              PORTS                  NAMES
c557c3fdf42a        kuvivek/upday/helloworld:1   "/bin/sh -c 'java -j…"   7 seconds ago       Up 6 seconds        0.0.0.0:80->8080/tcp   node1
[kuvivek@vivekcentos upday]$

```

6. Since it is mapped, The REST API calls can also be tested.
   Below are the sets of curl command.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ curl http://localhost
Hello World from upday![kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ curl http://localhost:80/actuator
{"_links":{"self":{"href":"http://localhost/actuator","templated":false},"health":{"href":"http://localhost/actuator/health","templated":false},"health-component":{"href":"http://localhost/actuator/health/{component}","templated":true},"health-component-instance":{"href":"http://localhost/actuator/health/{component}/{instance}","templated":true},"info":{"href":"http://localhost/actuator/info","templated":false}}}[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$

```

7. Since all the curl commands are working fine, It is ideal time to orchestrate it in the minikube Kubernetes Cluster.

```

[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ minikube delete
🙄  &quot;minikube&quot; cluster does not exist
💔  The &quot;minikube&quot; cluster has been deleted.
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ minikube start --vm-driver=kvm2
😄  minikube v1.3.1 on Centos 7.7.1908
🔥  Creating kvm2 VM (CPUs=2, Memory=2000MB, Disk=20000MB) ...
🐳  Preparing Kubernetes v1.15.2 on Docker 18.09.8 ...
🚜  Pulling images ...
🚀  Launching Kubernetes ...
⌛  Waiting for: apiserver proxy etcd scheduler controller dns
🏄  Done! kubectl is now configured to use &quot;minikube&quot;
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$

```

8.  Kubernetes deployment file creation.

8.1)   First of all check whether the minikube is running properly or not.
```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ minikube status
host: Running
kubelet: Running
apiserver: Running
kubectl: Correctly Configured: pointing to minikube-vm at 192.168.39.146
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
```
8.2) It is always a best practice, to create a namespace for any new project. By default the namespace available are:
```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get namespace
NAME              STATUS   AGE
default           Active   14m
kube-node-lease   Active   14m
kube-public       Active   14m
kube-system       Active   14m
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
```
Creating a namespace upday.Using the following command.
```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl create namespace upday
namespace/upday created
[kuvivek@vivekcentos upday]$
```
Verify whether the namespace got created or not.
```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get namespace
NAME              STATUS   AGE
default           Active   17m
kube-node-lease   Active   17m
kube-public       Active   17m
kube-system       Active   17m
upday             Active   9s
[kuvivek@vivekcentos upday]$
```

8.3) Create Pod within this namespace.

The best way to create a Pod is using the following command.
```
[kuvivek@vivekcentos upday]$ kubectl run --generator=run-pod/v1 helloworldapp --image=kuvivek/upday/helloworld:1 -n upday
pod/helloworldapp created
[kuvivek@vivekcentos upday]$
```

8.4) Once the pod with name `helloworldapp` in the `upday` namespace is created.  Create a Pod yaml configuration file using the `kubectl edit` command  and save it in the current directory and modify the Pod resource yaml file to keep only the bare mimimum configuration file.

Copy the content of the file and store it in the helloworldPod.yaml file.
```
[kuvivek@vivekcentos upday]$ kubectl edit pod helloworldapp -n upday
Edit cancelled, no changes made.
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ vi helloworldPod.yaml
[kuvivek@vivekcentos upday]$
```

8.5) As per  the best practice these configuration files are the backup resources to be subjected to the version controlling system.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get pods
No resources found.
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get pods -n upday
NAME            READY   STATUS             RESTARTS   AGE
helloworldapp   0/1     ImagePullBackOff   0          8m24s
[kuvivek@vivekcentos upday]$
```

Since the pod was creating using the kubectl pod, It is advised to delete the existing pod created by the command shown below.

```
[kuvivek@vivekcentos upday]$ kubectl delete pod helloworldapp -n upday
pod "helloworldapp" deleted
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ ls
Dockerfile  helloworldPod.yaml  helloworld.jar  README.md
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
```

Another problem to be noted here is the docker image which was created earlier need to the available for the Kubernetes to use.
In order to make it available. The image need to be pushed the docker hub. It is noted that the image name is different here. So
It is necessary to make the Pod creation image name different now.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ docker tag kuvivek/upday/helloworld:1 kuvivek/upday_helloworld:1.0
[kuvivek@vivekcentos upday]$ docker push kuvivek/upday_helloworld:1.0
The push refers to repository [docker.io/kuvivek/upday_helloworld]
5aa58d30050a: Pushed
60ce0917860d: Pushed
2c2c2656f85d: Pushed
f82b3222df85: Pushed
4bb8e1819413: Pushed
00bcabc31815: Pushed
2db44bce66cd: Pushed
1.0: digest: sha256:c810fbd878ca8acc853378ee3b0eb01284df1dc081b6f82a668b7f088287b761 size: 1788
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
```

8.6) Upon making necessary image name change. The command to launch the Pod is:

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl apply -f helloworldPod.yaml
pod/helloworldapp created
[kuvivek@vivekcentos upday]$
```

8.7) Now this Pod can't be accessed outside. In order to make it accessible, It requires a Service. There are couple of services, default service type is `ClusterIP`. For the development demo, We can use
the `NodePort` service. However, there are two more services available apart from ClusterIP and NodePort, they are LoadBalancer and Ingress Service.

For creating a service, the easiest way to create service is using the following command, and tuning to make it generic.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl create service nodeport javaapp1 --tcp=80:8080 --generator=service-nodeport/v1 -n upday
service/javaapp1 created
[kuvivek@vivekcentos upday]$
```

Copy the content by opening the service in the edit mode and then saving the same in the yaml file.
```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl edit service javaapp1 -n upday
Edit cancelled, no changes made.
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ vi javaAppService.yaml
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ ls
Dockerfile  helloworld.jar  helloworldPod.yaml  javaAppService.yaml  README.md
[kuvivek@vivekcentos upday]$
```
8.8) Verifying the Pods and Services are running properly.
```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ minikube status
host: Running
kubelet: Running
apiserver: Running
kubectl: Correctly Configured: pointing to minikube-vm at 192.168.39.154
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get all -n upday
NAME                READY   STATUS    RESTARTS   AGE
pod/helloworldapp   1/1     Running   0          78m


NAME              TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/javaapp   NodePort   10.99.158.50   <none>        80:30080/TCP   78m







[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ curl http://192.168.39.154:30080
Hello World from upday![kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ curl http://192.168.39.154:30080/actuator
{"_links":{"self":{"href":"http://192.168.39.154:30080/actuator","templated":false},"health-component":{"href":"http://192.168.39.154:30080/actuator/health/{component}","templated":true},"health-component-instance":{"href":"http://192.168.39.154:30080/actuator/health/{component}/{instance}","templated":true},"health":{"href":"http://192.168.39.154:30080/actuator/health","templated":false},"info":{"href":"http://192.168.39.154:30080/actuator/info","templated":false}}}[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$

```


8.9) Since creating Pod with the YAML file means the lifecycle of Pod needs to be maintained by us and not by Kubernetes.
Incase the Pod dies due to heavy load, the Kubernetes kill these Pods and in order to make the application up and running
It is advised to use either ReplicaSet or Deployment, so that in case one Pod goes down due to various reasons,another
similar Pod will be created. However, ReplicaSet has one disadvantage - It does not support the feature of rolling updates
meaning any change of application version, a slight downtime issue while upgrade has to be faced. So ruling out the Replicaset
option lets create Deployment configuration.

Creating Kubernetes Deployment manifest file through the command line option.

```
[kuvivek@vivekcentos upday]$ kubectl create deployment updayapp --image=kuvivek/upday_helloworld:1.0 -n upday
The Deployment "updayapp" is invalid: spec.template.spec.containers[0].name: Invalid value: "upday_helloworld": a DNS-1123 label must consist of lower case alphanumeric characters or '-', and must start and end with an alphanumeric character (e.g. 'my-name',  or '123-abc', regex used for validation is '[a-z0-9]([-a-z0-9]*[a-z0-9])?')
[kuvivek@vivekcentos upday]$
```
Since the deployment manifest file creation through command does not support underscore `'_'` in image file.
```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl create deployment updayapp --image=kuvivek/upday-helloworld:1.0 -n upday
deployment.apps/updayapp created
[kuvivek@vivekcentos upday]$
```
It is advised to create the same using hyphen `'-'` and then copy the deployment manifest file through opening it in th edit mode.
```
[kuvivek@vivekcentos upday]$ kubectl edit deployment updayapp -n upday


Press ENTER or type command to continue
Edit cancelled, no changes made.
[kuvivek@vivekcentos upday]$ ls
deployment.yaml  Dockerfile  helloworld.jar  helloworldPod.yaml  javaAppService.yaml  README.md
[kuvivek@vivekcentos upday]$ vi deployment.yaml
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get all -n upday
NAME                            READY   STATUS             RESTARTS   AGE
pod/helloworldapp               1/1     Running            0          146m
pod/updayapp-5c586c498b-j6zfp   0/1     ImagePullBackOff   0          39m


NAME              TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/javaapp   NodePort   10.99.158.50   <none>        80:30080/TCP   146m


NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/updayapp   0/1     1            0           39m

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/updayapp-5c586c498b   1         1         0       39m




[kuvivek@vivekcentos upday]$
```

Now the Kubernetes Deployment created via the command line, clearly states the Pod generated by the deployment command is not able to pull the image. Since the image mentioned doesn't exist. So this deployment can be deleted as shown below.
```
[kuvivek@vivekcentos upday]$ kubectl delete deployment updayapp -n upday
deployment.extensions "updayapp" deleted
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get all -n upday
NAME                READY   STATUS    RESTARTS   AGE
pod/helloworldapp   1/1     Running   0          147m


NAME              TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/javaapp   NodePort   10.99.158.50   <none>        80:30080/TCP   147m







[kuvivek@vivekcentos upday]$

```

8.10) For Launching the modified Kubernetes Deployment plan. The following command need to be triggered.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl apply -f deployment.yaml
The Deployment "updayapp" is invalid: spec.template.metadata.labels: Invalid value: map[string]string{"app":"updayapp"}: `selector` does not match template `labels`
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
```

Since the deployment.yaml should have the same entry in spec.template.metadata.labels as that of the Pod metadata label, that `run: helloworldapp` rather than the
invalid mapping `app: updayapp`.

```
[kuvivek@vivekcentos upday]$ vi deployment.yaml -o helloworldPod.yaml
2 files to edit
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl apply -f deployment.yaml
deployment.extensions/updayapp created
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get all -n upday
NAME                            READY   STATUS              RESTARTS   AGE
pod/helloworldapp               1/1     Running             0          165m
pod/updayapp-6455f4d7ff-jghgl   0/1     ContainerCreating   0          7s
pod/updayapp-6455f4d7ff-lm76v   0/1     ContainerCreating   0          7s


NAME              TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/javaapp   NodePort   10.99.158.50   <none>        80:30080/TCP   165m


NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/updayapp   0/2     2            0           8s

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/updayapp-6455f4d7ff   2         2         0       7s




[kuvivek@vivekcentos upday]$
```
ContainerCreating stage in the Pod. Trying again after a few seconds.
```
[kuvivek@vivekcentos upday]$ kubectl get all -n upday
NAME                            READY   STATUS    RESTARTS   AGE
pod/helloworldapp               1/1     Running   0          165m
pod/updayapp-6455f4d7ff-jghgl   1/1     Running   0          24s
pod/updayapp-6455f4d7ff-lm76v   1/1     Running   0          24s


NAME              TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
service/javaapp   NodePort   10.99.158.50   <none>        80:30080/TCP   165m


NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/updayapp   2/2     2            2           25s

NAME                                  DESIRED   CURRENT   READY   AGE
replicaset.apps/updayapp-6455f4d7ff   2         2         2       24s




[kuvivek@vivekcentos upday]$
```

9. Creating the Horizontal Pod Autoscaling.

```
[kuvivek@vivekcentos upday]$ 
[kuvivek@vivekcentos upday]$ kubectl autoscale deployment updayapp --cpu-percent=50 --min=1 --max=10 -n upday
horizontalpodautoscaler.autoscaling/updayapp autoscaled
[kuvivek@vivekcentos upday]$ 
[kuvivek@vivekcentos upday]$ kubectl get all -n upday
NAME                           READY   STATUS    RESTARTS   AGE
pod/updayapp-8ffd77894-fgpsd   1/1     Running   0          4m54s
pod/updayapp-8ffd77894-nvjmw   1/1     Running   0          4m54s




NAME                       READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/updayapp   2/2     2            2           4m54s

NAME                                 DESIRED   CURRENT   READY   AGE
replicaset.apps/updayapp-8ffd77894   2         2         2       4m54s


NAME                                           REFERENCE             TARGETS         MINPODS   MAXPODS   REPLICAS   AGE
horizontalpodautoscaler.autoscaling/updayapp   Deployment/updayapp   <unknown>/50%   1         10        2          2m30s


[kuvivek@vivekcentos upday]$ 
[kuvivek@vivekcentos upday]$ 
```

Capturing the Configuration for the  Horizontal Pod AutoScaling, and storing only the relevant configuration in the 
`hap_updayapp.yaml` file, as shown below.

```
[kuvivek@vivekcentos upday]$ 
[kuvivek@vivekcentos upday]$ kubectl edit horizontalpodautoscaler updayapp -n upday
Edit cancelled, no changes made.
[kuvivek@vivekcentos upday]$ 
[kuvivek@vivekcentos upday]$ vi hpa_updayapp.yaml 
[kuvivek@vivekcentos upday]$ 
```

Similarly extracting namespace and only keeping the relevant content apturing the 

```
[kuvivek@vivekcentos upday]$ 
[kuvivek@vivekcentos upday]$ kubectl edit namespace upday


Press ENTER or type command to continue
Edit cancelled, no changes made.
[kuvivek@vivekcentos upday]$ vi namespace_upday.yaml 
[kuvivek@vivekcentos upday]$ 
```

10. Creation of Pod Disruption Budget 

Since the Pod disruption budget need manadtory parameter selector, It is required to add the same matchingLabels which were added in the deployment.yaml file.
Here the selector label is `run=helloworlapp`. So the command to generate the 
pod disruption budget is shown below.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl create poddisruptionbudget pdb_upday --selector run=helloworldapp --min-available=2 -n upday
poddisruptionbudget.policy/pdb_upday created
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl get poddisruptionbudget -n upday
NAME        MIN AVAILABLE   MAX UNAVAILABLE   ALLOWED DISRUPTIONS   AGE
pdb_upday   2               N/A               0                     17s
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$
```

However, It is better to capture the relevant info into a configuration file.
Either of these commands would suffice.

```
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl edit poddisruptionbudget -n upday
Edit cancelled, no changes made.
[kuvivek@vivekcentos upday]$
[kuvivek@vivekcentos upday]$ kubectl edit poddisruptionbudget pdb_upday -n upday
Edit cancelled, no changes made.
[kuvivek@vivekcentos upday]$
```
The current saved pdb_upday.yaml contains all the Pod Disruption Budget Minimum Available Configuration settings.

