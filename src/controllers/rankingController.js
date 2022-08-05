import connection from "../db/database.js";

export async function getRanking (req, res) {
    try {
        const users = await connection.query(`
        SELECT users.id, users.name
        FROM users;
        `);
        const sumVisits = await connection.query(`
        SELECT s."userId" as id, u.name, COUNT(s.identifier) as "linksCount", SUM(s."visitCount") as "visitCount"
        FROM "shortUrls" s
        JOIN users u
        ON s."userId" = u.id
        GROUP BY "userId", u.name
        ORDER BY "visitCount" DESC
        LIMIT 10
        `);
        return res.status(200).send(sumVisits.rows);
    } catch (error) {
        return res.sendStatus(500);
    }
}