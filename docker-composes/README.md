
# Run
```
docker compose -f core.yaml --env-file test.env up -d
```

# Configurations
## Data and configs
Data and configs are inside /mnt/ssd. This is really important to be backed up regularly to allow the restore in an easy way

## Netdata
You need to setup netdata inside the configurations doing:

```
cd /mnt/ssd/netdataconfig
sudo ./edit-config stream.conf
```

Then modify the params according to the official doc:
https://learn.netdata.cloud/docs/observability-centralization-points/metrics-centralization-points/configuring-metrics-centralization-points