
# https://docs.docker.com/reference/build-checks/from-as-casing/

FROM --platform=linux/amd64 node:20 AS base

WORKDIR /app

COPY  package*.json tsconfig.json ./
COPY . .

RUN npm ci && npm install -y

RUN npm run build

FROM --platform=linux/amd64 node:20-alpine3.20

WORKDIR /app

COPY --from=base /app/dist /app
COPY --from=base /app/package*.json /app
COPY --from=base /app/node_modules ./node_modules

EXPOSE 3333

CMD ["npm", "start"]