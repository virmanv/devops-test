# Why running Zulip on a self-hosted could be better than slack?
Well, when I started on looking at self-hosted solution for chats there were quite a few. One of which striked me was `mattermost`. But the scope is on Zulip vs Slack so as per my research here are some points:

1. Slack has more inefficiency reading the chats on larger channels while Zulip has a better threading model assigning a topic name to every message.
2. Zulip being a open source platform, it can be self-hosted by an company on its servers which protects the sensetive conversations decreasingly vulnerable to security attacks.
3. Zulip provides the flexibility for teams working in different timezones while effective Slack conversations happen mostly only during when all the team members are present in the same time.



# terraform scripts
 The folder `tf` defines the terraform scripts for redis and rabbitMq installations on cluster. 

I know I could have easily created a helm template and in the requirements.yaml I could have mentioned the dependencies. I rather used `kustomize` as I was facinated by this tool and I took this opportunity to learn it.


# base
 base repo creates the basic kustomization and config for postgres, memcache and zulip
# overlay
In an overlay we can have differnt env's configs. The main things that may vary in different environment is resources which is limits and request on cpu or pvc's. I have provided an example of overlay where the default pvc has 1G of storage request but in staging environment I am overriding it to 8.

#Security
1. I would like to configure Network policy's around the cluster which only allows mtls communication within our services and any incoming request coming into the cluster.

2. Since we are using file storage to store chats and images. On each pod I will setup a securityContext which will allow non root users a read only access.

3. As the security best practices, I would prefer only authorised image with vulnerability scanned


