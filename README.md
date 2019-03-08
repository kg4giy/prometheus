# Prometheus

These are the YAML files and other support files to run Prometheus and it supported applicaitons and exporters. These are a work in progress, and then some. Use at your own risk. 

Information for running Prometheus as a service based on information from [Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-prometheus-on-ubuntu-16-04)

Prometheus service file (/etc/systemd/system/prometheus.service)

```
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
```

## Node Exporter

Node Exporter service file (/etc/systemd/system/node_exporter.service)

```
[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```

## Alertmanager

There are some serious issues with the mail system that I am still working through with information from the [Prometheus Git Hub](https://github.com/prometheus/alertmanager/issues/384)
