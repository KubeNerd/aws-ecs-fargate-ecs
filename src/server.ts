import { fastify } from 'fastify';
import {  dogsRoute } from './routes/dogs';
import { healtcheckRoute } from './routes/healthcheck';
export const app = fastify()

app.register(healtcheckRoute, { prefix: 'api'});

app.register(dogsRoute, { prefix: 'api'});


try {
    app.listen({ port: 8080, host: '0.0.0.0' }, (err, address) => {
        if (err) {
          console.error(err)
          process.exit(1)
        }
        console.log(`Server listening at ${address}`)
      })
} catch (error) {
    throw new Error(error as any);
}
