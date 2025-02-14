#!/bin/bash

# Script per disinstallare K3s e installare Docker

# Funzione per la disinstallazione di K3s
uninstall_k3s() {
    echo "Disinstallando K3s..."
    /usr/local/bin/k3s-uninstall.sh
    echo "K3s disinstallato."
}

# Funzione per l'installazione di Docker
install_docker() {
    echo "Installando Docker..."
    
    # Rimuovi eventuali versioni precedenti di Docker
    sudo apt-get remove -y docker docker-engine docker.io containerd runc

    # Aggiorna l'indice dei pacchetti
    sudo apt-get update

    # Installa i pacchetti necessari per l'installazione di Docker
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common

    # Aggiungi la chiave GPG di Docker
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

    # Aggiungi il repository di Docker
    echo "deb [arch=armhf] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

    # Aggiorna di nuovo l'indice dei pacchetti
    sudo apt-get update

    # Installa Docker
    sudo apt-get install -y docker-ce

    # Aggiungi l'utente corrente al gruppo Docker
    sudo usermod -aG docker $USER
    echo "Docker installato."
}

# Funzione per l'installazione di Docker Compose
install_docker_compose() {
    echo "Installando Docker Compose..."
    
    # Scarica l'ultima versione di Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

    # Rendi eseguibile il file scaricato
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Docker Compose installato."
}

# Inizio dello script
echo "Inizio della disinstallazione di K3s e installazione di Docker e Docker Compose..."

# Disinstallare K3s
uninstall_k3s

# Installare Docker
install_docker

# Installare Docker Compose
install_docker_compose

# Finito
echo "Installazione completata. Riavvia il terminale per applicare le modifiche."

