# eggjs for Docker
[Dockerfile](https://hub.docker.com/r/daijie/eggjs/~/dockerfile/) for eggjs

### Versions
- daijie/eggjs:latest
    node9
- daijie/eggjs:alinode-alpine
    alinode3, node 8
- daijie/eggjs:alinode-4-alpine
    alinode4, node 10

## Quick Start
To create a project in current directory

```docker run -t -i  --rm -v `pwd`:/usr/src/app  daijie/eggjs egg-init egg-example --type=simple```

## Usage in docker-compose
`docker-compose.yml`

- for dev environment

```
version: '3'
services:
  egg:
    image: daijie/eggjs
    volumes:
      - ./egg-example:/usr/src/app
    ports: 
      - 7001:7001
    entrypoint: npm run dev
```

- for production

```
version: '3'
services:
  egg:
    image: daijie/eggjs
    volumes:
      - ./egg-example:/usr/src/app
    ports: 
      - 7001:7001
    entrypoint: npm start
```

## trap
Don't forget to remove `--daemon` in `package.json` for `npm start`


[eggjs](https://eggjs.org/)
