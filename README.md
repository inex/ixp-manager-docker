# Running IXP Manager on Docker

## Just Get It Running: Docker Compose

If you are familiar with Docker, you can just get the whole environment going with the following:

```sh
# Clone this repository
git clone https://github.com/inex/ixp-manager-docker.git
cd ixp-manager-docker
docker-compose -p ixmp up
```

You can then access IXP Manager via: http://localhost:8880/ with username `docker` and password `docker01`.

The mail catcher can be accessed on: http://localhost:1080/


## Introduction

As the IXP Manager ecosystem grows, it becomes harder and harder to maintain ubiquitous development environments for coding, testing and demonstrating IXP Manager. Docker is ideally suited to solving these issues as well as providing the perfect environment for IXP Manager workshops.

The multi-container Docker environment in this repository builds an IXP Manager system which includes:

* a custom MySQL database container (from [mysql/5.7](https://hub.docker.com/_/mysql/)).
* two emulated switches via SNMP endpoints (using the excellent [SNMP Agent Simulator](http://snmplabs.com/snmpsim/) via [tandrup/snmpsim](https://hub.docker.com/r/tandrup/snmpsim/));
* a mail trap with a web-based frontend to capture and analyse all emails sent by IXP Manager (thanks to [schickling/mailcatcher](https://hub.docker.com/r/schickling/mailcatcher/)).
* a mrtg container to query the switches and build up mrtg log files / graphs (via [cityhawk/mrtg](https://hub.docker.com/r/cityhawk/mrtg/)).
* the complete IXP Manager application build on the [php/7.0-apache](https://hub.docker.com/r/library/php/) base. This has been preconfigured with some customers, routers, switches, etc.
* a Bird-based route server pre-configured for 3 x IPv4 and 2 x IPv6 sessions. This also includes our [Bird's Eye](https://github.com/inex/birdseye) looking glass which has been integrated into *rs1* container and configured into the IXP Manager container.
* five Bird-based route server clients complete with routes and a route server session.

## Disclaimer

**This is not for production use.**

This Docker application has been built solely for non-production use cases. It should never be used in production environments.

## General Instructions

Please see *Just Get It Running: Docker Compose* above to start up the full application. When running, a Docker process list should show something similar to:

```
$ docker ps
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS                   PORTS                              NAMES
7632e2c5d58b        ixpmanager/bird6:1.6.3   "/usr/sbin/bird6 -f …"   24 hours ago        Up 6 minutes             179/tcp                            ixpm_cust-as25441-v6_1
67859b77fe0a        ixpmanager/bird:1.6.3    "/usr/sbin/bird -f -…"   24 hours ago        Up 6 minutes             179/tcp                            ixpm_cust-as112_1
a39bc0df2fb5        ixpmanager/bird6:1.6.3   "/usr/sbin/bird6 -f …"   24 hours ago        Up 6 minutes             179/tcp                            ixpm_cust-as1213-v6_1
c2f5b2d8b936        ixpmanager/bird:1.6.3    "/usr/sbin/bird -f -…"   24 hours ago        Up 6 minutes             179/tcp                            ixpm_cust-as42_1
7a4aef9f8b46        ixpmanager/bird:1.6.3    "/usr/sbin/bird -f -…"   24 hours ago        Up 6 minutes             179/tcp                            ixpm_cust-as1213_1
615b681049f7        ixpmanager/rs1:4.7.0     "/usr/local/sbin/sta…"   24 hours ago        Up 6 minutes             179/tcp, 0.0.0.0:8881->80/tcp      ixpm_rs1_1
2bab1f5dae56        cityhawk/mrtg            "/bin/sh -c 'sh /ent…"   24 hours ago        Up 6 minutes                                                ixpm_mrtg_1
0b170feb8b97        ixpmanager/www:4.7.1     "docker-php-entrypoi…"   25 hours ago        Up 6 minutes             0.0.0.0:8880->80/tcp               ixpm_www_1
bf8a776ed1fa        ixpmanager/mysql:4.7.0   "/entrypoint.sh mysq…"   25 hours ago        Up 6 minutes (healthy)   3306/tcp, 33060/tcp                ixpm_mysql_1
1e6d0e0315d7        schickling/mailcatcher   "mailcatcher --foreg…"   25 hours ago        Up 6 minutes             1025/tcp, 0.0.0.0:1080->1080/tcp   ixpm_mailcatcher_1
7cf52c441ff2        tandrup/snmpsim          "/bin/sh -c 'snmpsim…"   25 hours ago        Up 6 minutes             161/udp                            ixpm_switch1_1
b57d20b94a30        tandrup/snmpsim          "/bin/sh -c 'snmpsim…"   25 hours ago        Up 6 minutes             161/udp                            ixpm_switch2_1
```

A careful reading of the [docker-compose.yml](https://github.com/inex/ixp-manager-docker/blob/master/docker-compose.yml) file should help illuminate the various containers started, the dedicated network details and the volumes used.

You can access the MySQL database via:

```
docker exec -it ixpm_mysql_1 mysql -u root ixpmanager
```

You can get CLI access to the `www` or `rs1` containers using the following respectively:

```
docker exec -it ixpm_www_1 bash
docker exec -it ixpm_rs1_1 bash
```

You can access the Bird CLI of the route servers and customer BGP daemons via:

```
docker exec -it ixpm_rs1_1 birdc -s /var/run/bird/bird-rs1-ipv4.ctl
docker exec -it ixpm_rs1_1 birdc6 -s /var/run/bird/bird-rs1-ipv6.ctl

docker exec -it ixpm_cust-as42_1 birdc
docker exec -it ixpm_cust-as112_1 birdc
docker exec -it ixpm_cust-as1213_1 birdc
docker exec -it ixpm_cust-as1213-v6_1 birdc6
docker exec -it ixpm_cust-as25441-v6_1 birdc6
```

`ixpm_switch1_1` and `ixpm_switch2_1` emulate switches by replaying SNMP dumps from real INEX switches (with some sanitisation). The OIDs for traffic have been replaced with a dynamic function to give varying values.

From the www container, you can interact with these via:

```
$ docker exec -it ixpm_www_1 bash
# ping switch1
...
64 bytes from switch1 (172.30.201.60): icmp_seq=1 ttl=64 time=0.135 ms
...
# ping switch2
...
64 bytes from switch2 (172.30.201.61): icmp_seq=1 ttl=64 time=0.150 ms
...
# snmpwalk -On -v 2c -c switch1 switch1 .1.3.6.1.2.1.1.5.0
.1.3.6.1.2.1.1.5.0 = STRING: "switch1"
# snmpwalk -On -v 2c -c switch2 switch2 .1.3.6.1.2.1.1.5.0
.1.3.6.1.2.1.1.5.0 = STRING: "switch2"
```

You'll note from the above that the hostnames `switch1` and `switch2` work from the `www` container. Note also that the SNMP community is the hostname (`switch1` or `switch2` as appropriate).

The packaged database only contains `switch1`. You can add the second switch via http://localhost:8880/switch/add-by-snmp and setting the hostname and community to `switch2`.

If you want to add new customers for testing, add `switch2` and then use interfaces `Ethernet 2, 8, 13` and `6 and 7` as a lag as these have been preset to provide dynamic stats.
