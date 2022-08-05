import connection from '../db/database.js';
import { urlValidation } from '../schemas/urlSchema.js';
import { nanoid } from 'nanoid';

export async function shortenUrl (req, res) {
    const {userId} = res.locals;
    const url = req.body;
    const { error } = urlValidation.validate(url);
    if (!url || error) return res.status(422).send("Please input a valid url");
    try {
        const shortUrl = nanoid();
        if (!shortUrl) return res.status(400).send("There was an error shortening this url");
        const insertUrl = await connection.query(`
        INSERT INTO urls
        (url, "userId")
        VALUES ($1, $2);
        `, [url.url, userId]);
        const urlId = await connection.query(`
        SELECT id FROM urls
        WHERE url = $1 AND "userId" = $2;
        `, [url.url, userId]);
        const insertShortUrl = await connection.query(`
        INSERT INTO "shortUrls"
        (identifier, "urlId", "userId")
        VALUES ($1, $2, $3);
        `, [shortUrl, urlId.rows[0].id, userId]);

    return res.status(201).json({
        shortUrl
    });
    } catch (error) {
        return res.sendStatus(500);
    } 
}

export async function getUrlById (req, res) {

}

export async function openUrl (req, res) {

}

export async function deleteUrl (req, res) {
    
}