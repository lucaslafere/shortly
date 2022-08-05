import connection from '../db/database.js';
import { urlValidation } from '../schemas/urlSchema.js';

export async function shortenUrl (req, res) {
    const {userId} = res.locals;
    const url = req.body;
    const { error } = urlValidation.validate(url);
    if (!url || error) return res.status(422).send("Please input a valid url");
    try {
        
        const insertUrl = await connection.query(`
        INSERT INTO urls
        (url)
        VALUES ($1);
        `, [url.url]);

    return res.status(201).send("funfou");
    } catch (error) {
        
    } 
}

export async function getUrlById (req, res) {

}

export async function openUrl (req, res) {

}

export async function deleteUrl (req, res) {
    
}