# Multitor container


### Project creates docker image of [`multitor`](https://github.com/trimstray/multitor) based on Debian 13 container

#### This branch fakes installation of polipo and hpts, so image can weight less. It uses only `privoxy` and `haproxy`


## 1. Build image

```bash
docker build -t multitor-container .
```

## 2. Run image

```bash
docker run -e "TOR_INSTANCES=4" -dt --rm --name multitor --publish 16379:16379 multitor-container:latest
```

### 2.1 Environment variables


- `TOR_INSTANCES` - set number of instanes here (default: 2)
- `MT_SOCKS_PORT` - set socks port (default: 9000)
- `MT_CTRL_PORT`  - set tor control port (default: 9900)



## 3. Test 

```bash
curl --proxy 127.0.0.1:16379 icanazip.com
```

## 4. Stop

```bash
docker stop multitor
```


