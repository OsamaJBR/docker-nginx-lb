# docker-nginx-lb
Simple HTTP LB using nginx 1.11 and etcd

##### Build
```
docker build -f Dockerfile -t http-lb-nginx .
```

#### Usage
```
docker run -d -p 8080:80 \
        -e LB_ALGO='least_conn;' \
        -e LB_PORT=80 \
        -e LB_UPSTREAMS='server server1_ip:80; server server2_ip:80;' \
        --name lb http-lb-nginx
```
