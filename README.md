#Multitor container

## 1. Build image

```bash
docker build -t multitor-container .
```

## 2. Run image

```bash
docker run -e "TOR_INSTANCES=4" -dt --rm --name multitor --publish 16379:16379 multitor-container:latest
```

- `TOR_INSTANCES` - set number of instanes here (default: 2)


## 3. Test 

```bash
curl --proxy 127.0.0.1:16379 icanazip.com
```

## 4. Stop

```bash
docker stop multitor
```


