# DevOps - Busi Florian

### Le groupe

Notre groupe est composé de 4 membres :
 - Mathis Lecherf
 - Tanguy Meignier  
 - Félicien Courdesse 
 - Hugo Poizat

## Le projet

Notre projet permet d'automatiser l'installation d'un wordpress en local via Docker. 

### Configuration

Avant de commencer, il vous faudra : 
 - Un environnement sous Unix (WSL, Ubuntu, Debian)
 - Docker Desktop (pas obligatoire mais fortement conseillé !)

Ce projet se base sur Docker, il est donc primordial de l'avoir.

> sudo apt-get install docker
 
Une fois ceci réalisé, cloner ce repository.

> git clone https://github.com/TheGooodDev/A-DevSecOps-B3DevB-eval-pratique.git

### Lancement du projet

Téléchargement des images Docker : 

> sudo bash 1-create-images.sh

Ce script va télécharger 2 images Docker qui vont par la suite être utilisées, elles ont la chance d'être fournies par Docker et d'être déjà en partie configurées.
Si vous savez que vous les avez déjà téléchargés, vous pouvez directement passer au deuxième script.

Configuration : 

> sudo bash 2-create-container.sh

Ce script va exécuter beaucoup plus de commandes, c'est lui qui va s'occuper de configurer les containers Docker pour à la fin avoir le Wordpress de prêt.

Maintenant, se rendre dans Docker Desktop, il devrait y avoir un container nommé "a-devsecops-b3devb-eval-pratique" contenant trois containers, databse, web et ansible.

> a-devsecops-b3devb-eval-pratique <br />
> |-> database <br />
> |-> web <br />
> |-> ansible <br />

Pour accéder à Wordpress, cliquer sur le premier bouton dans le container web afin d'ouvrir la page web.

## REGEXP

L'équipe s'est divisée en 3 pistes d'exploration : 
- la première a été d'utiliser Vagrant, celle-ci s'est vite révélée impossible à réaliser puisque l'ensemble des PC du groupe ne supportait pas la multi-virtualisation (VM dans une VM)
- la deuxième était sur l'usage d'Ansible, mais il est fortement déconseillé d'utiliser Ansible sous Windows puisque c'est dévelopé pour du Linux sous Linux. Nous avons essayé de contourner ce problème en utilisant Ansible sous WSL (Windows Subsystem for Linux). Mais Ansible, sous Linux, a pour but de créer des VM, mais notre VirtualBox (hébergeur de VM) est sous Windows, il y a donc incompatibilité de Système d'exploitation.
- troisième et dernière piste d'exploration, Docker, il a l'avantage de pouvoir isoler n'importe quel système d'exploitation, il règle donc notre problème d'incompatibilité. Nous avons donc réussi à avoir une installe Wordpress, mais sans l'automatisation qu'aurait du apporter Ansible.

### Solution qui n'a pas pu être réalisée

Création d'un container Docker sous Linux avec dessus Ansible, lui passer un playbook ansible qui créé 2 autres containers, un avec Wordpress, l'autre avec une BDD, mais par manque de temps cette solution n'a pas pu être réalisée.

