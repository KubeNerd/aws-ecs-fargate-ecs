import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';
import { api } from '../lib/axios';

export async function dogsRoute(app: FastifyInstance) {
    app.get('/dogs', async (request: FastifyRequest, reply: FastifyReply) =>{

        try {
            const response = await api.get('/breeds/image/random')

            return reply
                .code(200)
                .header('Content-Type', 'application/json; charset=utf-8')
                .send({ image: response.data.message })


        } catch (error) {
            console.error(error);
            return reply
                .code(500)
                .header('Content-Type', 'application/json; charset=utf-8')
                .send({ status: 500 })
        }
    });
}