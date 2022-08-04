import express, { json } from 'express';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();
const app = express();
app.use(cors());
app.use(json());

app.post("/sign-up", (req, res) => {
    
})
app.post("/sign-in", (req, res) => {

})
app.post("/urls/shorten", (req, res) => {

})
app.get("/urls/:id", (req, res) => {

})
app.get("/urls/open/:shortUrl", (req, res) => {

})
app.delete("/urls/:id", (req, res) => {

})
app.get("/users/me", (req, res) => {

})
app.get("/ranking", (req, res) => {

})


app.listen(process.env.PORT, () => console.log("Rodando"))