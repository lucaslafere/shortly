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
    const { id } = req.params;
    try {
        const selectUrl = await connection.query(`
        SELECT "shortUrls".id, "shortUrls".identifier as "shortUrl", urls.url
        FROM "shortUrls"
        JOIN urls
        ON "shortUrls"."urlId" = urls.id
        WHERE "shortUrls".id = $1
        `, [id]);
        if (selectUrl.rowCount === 0) return res.sendStatus(404);
        return res.status(200).json(selectUrl.rows)
    } catch (error) {
        return res.sendStatus(500);
    }
}

export async function openUrl (req, res) {
    const {shortUrl} = req.params;
    try {
        const checkUrl = await connection.query(`
        SELECT url, "shortUrls"."visitCount", "shortUrls".id as "shortUrlId"
        FROM urls
        JOIN "shortUrls"
        ON "shortUrls"."urlId" = urls.id
        WHERE "shortUrls"."identifier" = $1
        `, [shortUrl]);
        if (checkUrl.rowCount === 0) return res.sendStatus(404);
        const updateCount = await connection.query(`
        UPDATE "shortUrls"
        SET "visitCount" = $1
        WHERE id = $2
        `, [checkUrl.rows[0].visitCount + 1, checkUrl.rows[0].shortUrlId]);
        return res.sendStatus(200)
    } catch (error) {
        return res.sendStatus(500);
    }
}

export async function deleteUrl (req, res) {
    
}