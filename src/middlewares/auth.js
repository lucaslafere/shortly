import connection from "../db/database.js";

export async function auth (req, res, next) {
    const {authorization} = req.headers;
    const token = authorization?.replace('Bearer ', '');
    try {
        const checkUserSession = await connection.query(`
        SELECT * FROM sessions
        WHERE token = $1;
        `, [token]);
        const userSession = checkUserSession.rows[0];
        if (!userSession) return res.sendStatus(401);
        req.userId = userSession.userId
    } catch (error) {
        return res.sendStatus(500);
    }
    next();
};
