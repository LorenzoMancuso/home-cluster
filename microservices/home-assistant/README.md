# Home Assistant
## Trust local reverse proxy
In order to allow the connection from Traefik (or any other proxy in the local cluster), you need to modify the file /config/configuration.yml as follow:
```
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 10.42.0.0/16
```

In this way you are allowing connections from the local cluster's reverse proxies.