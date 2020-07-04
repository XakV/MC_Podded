# MC_Podded
Setting up your MC servers in a podman pod

Steps:

1. Install Ansible
2. Clone this repo
3. Pull a java 8 image. I started with Fedora base and installed openjdk8 with buildah.
4. Update playbooks/vars/main.yml with the name of your java image
5. I'm bind mounting four directories for the servers. 
    a. /srv/water - the waterfall (bungeecord server)
    b. /srv/bear, /srv/duck, /srv/goat
    If you want to run more/less servers or change the server names, do that now.
    Create the server directories with the same owner as you are running podman.
6. Run the get_latest_jars playbook
7. For simplicities sake, you might just want to start up all the servers for the first run manually.
    a. You can accept the EULA and probably do some configuration as well
8. Check the vars file against the templates and playbooks, adjust as needed.
9. Run the create images playbook, this should create an image with names you set in vars
10. make sure the shell scripts are executable (chmod +x)
11. run the container_config.sh script
12. If successful, run run_servers.sh
13. podman pod ps will show you if the pod is running. 
14. localhost's firewall rules will need to expose the port that the bungeecord/waterfall server runs on.

If it all fails, you'll have some troubleshooting to do? 
Try;
    - check the images with 'podman inspect'
    - will the image start by itself? 


