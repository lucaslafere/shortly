import express, { json } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import jwt from 'jsonwebtoken';
import authRouter from './routes/authRouter.js';
import urlsRouter from './routes/urlsRouter.js';
import rankingRouter from './routes/rankingRouter.js';
import userRouter from './routes/userRouter.js';

dotenv.config();
const app = express();
app.use(cors());
app.use(json());

app.use(authRouter);
app.use(urlsRouter);
app.use(rankingRouter);
app.use(userRouter);


app.listen(process.env.PORT, () => console.log('Rodando'))