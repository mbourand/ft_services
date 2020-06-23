# ft_services

*Ce projet a été réalisé dans le cadre d'un exercice, il n'est pas destiné à servir dans un environnement de production et ne respecte
pas toutes les [bonnes pratiques de kubernetes](https://cloud.google.com/blog/products/containers-kubernetes/your-guide-kubernetes-best-practices)
et des services utilisés. Il n'a été testé que dans un environnement xubuntu avec Minikube v1.9.0, Kubernetes v1.18.0 et Docker v19.03.6
vous pourrez rencontrer des bugs si votre environnement est différent.*

# Installation

## Prérequis
Vous devez installer :
- Docker (v19.03.6 recommandé)
- Kubernetes (v1.18.0 recommandé)
- Minikube (v1.9.0 recommandé)

## Installation & Utilisation

Pour lancer les services, clonez le repo, rendez vous dans le dossier et exécutez la commande ``./setup.sh``

### Ports
- Wordpress est accessible via ``IP:5050``
- PhpMyAdmin est accessible via ``IP:5000``
- Nginx est accessible via ``http://IP`` ou ``https://IP``
- Grafana est accessible via ``IP:3000``
- FTPS est accessible avec la commande ``ftp <IP>``
- SSH est accessible avec la commande ``ssh user@<IP>``

### Utilisateurs
- Wordpress : user/password
- PhpMyAdmin : pma/password
- Grafana : admin/password
- FTPS : user/password
- SSH : user/password

Wordpress et phpMyAdmin sont reliés à une base de données MySQL sur le port 3306.

Grafana est quant à lui relié à une base de données InfluxDB sur le port 8086.

## Désinstallation

Pour désinstaller ft_services, rendez-vous dans le dossier et exécutez la commande ``./uninstall.sh``

# Contenu

### Wordpress
<img src="https://i.imgur.com/drlXoRv.png">

### PhpMyAdmin
<img src="https://i.imgur.com/rwNwmm4.png">

### Grafana
<img src="https://i.imgur.com/pkTCt8n.png">

### FTPS
<img src="https://i.imgur.com/1b1S0Db.png">

### SSH
<img src="https://i.imgur.com/C0J3w51.png">
