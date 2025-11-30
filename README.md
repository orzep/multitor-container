# Multitor container

### Project creates docker image of [`multitor`](https://github.com/trimstray/multitor) based on Debian 13 container

#### If you want smaller image use [`privoxy-only`](https://github.com/orzep/multitor-container/tree/privoxy-only) branch

## 1. Build image

```bash
docker build -t multitor-container .
```

## 2. Run image

### 2.1 HTTP Proxy

```bash
docker run -e "TOR_INSTANCES=4" -dt --rm --name multitor --publish 16379:16379 multitor-container:latest
```

### 2.2 SOCKS Proxy

```bash
 docker run -e "TOR_INSTANCES=4" -e "MT_PROXY=socks" -e "MT_USE_HAPROXY=0" -dt --rm --name multitor --publish 16379:16379 multitor-container:latest
 ```

### 2.3 Environment variables

- `TOR_INSTANCES`  - set number of instanes here (default: 2)
- `MT_SOCKS_PORT`  - set socks port (default: 9000)
- `MT_CTRL_PORT`   - set tor control port (default: 9900)
- `MT_PROXY        - set proxy type (`privoxy`, `polipo`, `hpts`, default: `privoxy`) 
- `MT_USE_HAPROXY` - set to 1 to use haproxy (default: 1)

## 3. Test 

### 3.1 HTTP Proxy

```bash
curl --proxy 127.0.0.1:16379 icanazip.com
```

### 3.2 SOCKS Proxy

```bash
curl --socks5 127.0.0.1:16379 icanhazip.com
```

## 4. Stop

```bash
docker stop multitor
```


