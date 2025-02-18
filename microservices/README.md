# services
CORE 300xx
default          kubernetes-dashboard        NodePort      30001   10.43.153.125   <none>                        443/TCP                                      
default          netdata                     NodePort      30002   10.43.42.62     192.168.88.11                 19999:30696/TCP     
default          traefik                     NodePort      30003   10.43.21.109    192.168.88.10                 80:31589/TCP,443:30819/TCP                   
pihole           pihole-web                  NodePort      30004   10.43.38.74     <none>                        80:30132/TCP,443:30083/TCP                   
pihole           pihole-dns-tcp              NodePort      30005   10.43.91.24     192.168.88.10                 53:31539/TCP                                 
pihole           pihole-dns-udp              NodePort      30006   10.43.160.119   192.168.88.10                 53:30269/UDP                                 
pihole           pihole-dhcp                 NodePort      30007   10.43.133.42    <none>                        67:31170/UDP                                 

HOME-AUTOMATION 301xx         
home-assistant   home-assistant              NodePort      30101   10.43.119.190   <none>                        8123:30123/TCP                               
home-assistant   zigbee2mqtt                 NodePort      30102   10.43.72.114    <none>                        8080:30223/TCP                               
default          mosquitto                   NodePort      30103   10.43.22.199    192.168.88.10,192.168.88.11   1883:31075/TCP                               

MEDIA-SERVER 302xx    
default          plex                        NodePort      30201   10.43.161.155   192.168.88.11                 32400:32400/TCP                              
default          qbittorrent                 NodePort      30202   10.43.34.201    <none>                        30413:30413/TCP,6881:30423/TCP,6881:30433/UDP
default          sonarr                      NodePort      30203   10.43.65.213    <none>                        80/TCP                                       
default          prowlarr                      NodePort      30205   10.43.65.213    <none>                        80/TCP                                       


default          cm-acme-http-solver-pgg8b   NodePort      31912   10.43.55.166    <none>                        8089:31912/TCP                               
default          cm-acme-http-solver-h8lrd   NodePort      30179   10.43.112.205   <none>                        8089:30179/TCP                               
default          cm-acme-http-solver-92jdm   NodePort      31125   10.43.254.28    <none>                        8089:31125/TCP                               
pihole           cm-acme-http-solver-n5kch   NodePort      32422   10.43.239.217   <none>                        8089:32422/TCP                               
home-assistant   cm-acme-http-solver-wt7h5   NodePort      30112   10.43.102.163   <none>                        8089:30112/TCP                               
default          cm-acme-http-solver-j25sk   NodePort      31526   10.43.56.9      <none>                        8089:31526/TCP                               
home-assistant   cm-acme-http-solver-rbdnz   NodePort      30013   10.43.57.22     <none>                        8089:30013/TCP                               