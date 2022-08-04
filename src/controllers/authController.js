import connection from '../db/database.js';
import jwt from 'jsonwebtoken';
import bcrypt, { compareSync } from 'bcrypt';
import { signUpSchema, signInSchema } from '../schemas/authSchema.js';

export async function signUp (req, res) {
    const newUser = req.body;  
    const {error} = signUpSchema.validate(newUser)
    if (error) return res.status(422).send(error.message);
    try {
        const checkExistingUser = await connection.query(`
        SELECT * FROM users
        WHERE email = $1;
        `, [newUser.email]);
        if (checkExistingUser.rowCount > 0) return res.status(409).send("Esse email está em uso");

        const passwordHash = bcrypt.hashSync(newUser.password, 10);

        await connection.query(`
        INSERT INTO users
        (name, email, password)
        VALUES ($1, $2, $3);
        `, [newUser.name, newUser.email, passwordHash]);

        return res.status(201).send(checkExistingUser);
    } catch (error) {
        return res.sendStatus(500);
    }
}

export async function signIn (req, res) {
    const userLogin = req.body;
    const { error } = signInSchema.validate(userLogin);
    if (error) return res.status(422).send(error.message);
    try {
        
        const checkExistingUser = await connection.query(`
        SELECT * FROM users
        WHERE email = $1;
        `, [userLogin.email]);
        if (checkExistingUser.rowCount === 0) return res.sendStatus(401);
        // const comparePassword = compareSync(userLogin.password, checkExistingUser.rows.password);
        // if (!comparePassword) return res.sendStatus(401);
        // const token = jwt.sign({id: checkExistingUser.rows.id}, process.env.JWT_SECRET);
        // return res.status(200).json({
        //     user: {
        //         id: checkExistingUser.rows.id,
        //         email: checkExistingUser.rows.email
        //     },
        //     token
        // });
        return res.status(200).send(checkExistingUser.rows[0].password);
    } catch (error) {
        return res.sendStatus(500); 
    }
}