import connection from "../db/database.js";
import jwt from "jsonwebtoken";

export async function auth (req, res, next) {
    const {authorization} = req.headers;
    const token = authorization?.replace('Bearer ', '');
    const {id} = jwt.verify(token, process.env.JWT_SECRET);
    if (!token || !id) return res.sendStatus(401);
    try {
        const checkUserSession = await connection.query(`
        SELECT * FROM sessions
        WHERE token = $1;
        `, [token]);
        const userSession = checkUserSession.rows[0];
        if (!userSession) return res.sendStatus(401);
        res.locals.userId = id;
    } catch (error) {
        return res.sendStatus(500);
    }
    next();
};
