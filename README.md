# trumpgen

## Installation:
```
docker build -t ryanmcdermott/trumpgen .
docker run -ti -v $PWD/src:/opt/trumpgen ryanmcdermott/trumpgen npm install
docker run -ti -v $PWD/src:/opt/trumpgen ryanmcdermott/trumpgen elm package install -y
docker run -ti -v $PWD/src:/opt/trumpgen ryanmcdermott/trumpgen npm run build
```

## Running:
```
docker run -t -d -v $PWD/src:/opt/trumpgen -p 80:80 -e "PORT=80" ryanmcdermott/trumpgen node src/server.js
```
