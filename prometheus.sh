#!/bin/bash


# Create the users
sudo useradd --no-create-home --shell /bin/false prometheus
sudo useradd --no-create-home --shell /bin/false node_exporter

# Create the directories
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo mkdir /git

# Upload the files (fabric)
"/home/pi/git/prometheus/*.yml","/home/pi/git/prometheus"
"/home/pi/git/prometheus/service/*.service","/home/pi/git/prometheus"

# Change the permissions
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

# Copy the binaries
sudo cp prometheus-home/prometheus-2.7.2.linux-armv7/prometheus /usr/local/bin/
sudo cp prometheus-home/prometheus-2.7.2.linux-armv7/promtool /usr/local/bin/
sudo cp prometheus-home/node_exporter-0.17.0.linux-armv7/node_exporter /usr/local/bin


# Set the permissions
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Copy the libraries
sudo cp -r prometheus-home/prometheus-2.7.2.linux-armv7/consoles /etc/prometheus
sudo cp -r prometheus-home/prometheus-2.7.2.linux-armv7/console_libraries /etc/prometheus

# Change the permissions
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Delete the leftover
rm -rf prometheus-home/prometheus-2.7.2.linux-armv7
rm -rf prometheus-home/node_exporter-0.17.0.linux-armv7

# Copy the YAML file
sudo cp /home/pi/git/prometheus/prometheus-yml.org /etc/prometheus/prometheus.yml
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml

# Copy the prometheus.service file
sudo cp /home/pi/git/prometheus/prometheus.service /etc/systemd/system/
sudo cp /home/pi/git/prometheus/node_exporter/node_exporter.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl start node_exporter
sudo systemctl status prometheus
sudo systemctl status node_exporter
sudo systemctl enable prometheus
sudo systemctl enable node_exporter

prometheus-home/node_exporter-0.17.0.linux-armv7