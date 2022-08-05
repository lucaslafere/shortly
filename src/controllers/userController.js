import connection from "../db/database.js";

export async function getMyUser(req, res) {
  const { userId } = res.locals;
  try {
    const sumVisits = await connection.query(
      `
        SELECT SUM("visitCount") as "visitCount"
        FROM "shortUrls"
        WHERE "userId" = $1;
        `,
      [userId]
    );
    const getUserData = await connection.query(
      `
        SELECT id, name FROM users
        WHERE id = $1
        `,
      [userId]
    );
    if (getUserData.rowCount === 0) return res.sendStatus(404);
    const getUserShortenedUrls = await connection.query(
      `
        SELECT s.id, s.identifier as "shortUrl", u.url, s."visitCount"
        FROM "shortUrls" s
        JOIN urls u
        ON s."urlId" = u.id
        WHERE s."userId" = $1;
        `,
      [userId]
    );
    return res.status(200).json({
      id: userId,
      name: getUserData.rows[0].name,
      visitCount: sumVisits.rows[0].visitCount,
      shortenedUrls: [getUserShortenedUrls.rows],
    });
  } catch (error) {
    return res.sendStatus(500);
  }
}
