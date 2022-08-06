import connection from "../db/database.js";

export async function getRanking (req, res) {
    try {
        const sumVisits = await connection.query(`
        SELECT u.id, u.name, COUNT(s.identifier) as "linksCount", COALESCE(SUM(s."visitCount"),0) as "visitCount"
        FROM users u
        LEFT JOIN "shortUrls" s
        ON s."userId" = u.id
        GROUP BY u.id, u.name
        ORDER BY "visitCount" DESC
        LIMIT 10
        `);
        return res.status(200).send(sumVisits.rows);
    } catch (error) {
        return res.sendStatus(500);
    }
}