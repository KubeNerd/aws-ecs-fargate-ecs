import { FastifyInstance, FastifyReply, FastifyRequest } from 'fastify';


export async function healtcheckRoute(app: FastifyInstance) {
    app.get('/healthcheck', async (request:FastifyRequest , reply: FastifyReply) =>{

        try {
          
            return reply
            .code(200)
            .header('Content-Type', 'application/json; charset=utf-8')
            .send({ status: 200 })

        } catch (error) {
            console.error(error);
                      
            return reply
            .code(500)
            .header('Content-Type', 'application/json; charset=utf-8')
            .send({ status: 500 })
        }
    });
}