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
        console.log(checkExistingUser.password)

        if (checkExistingUser.rowCount > 0) return res.status(409).send("Esse email está em uso");
        const passwordHash = bcrypt.hashSync(newUser.password, 10);
        await connection.query(`
        INSERT INTO users
        (name, email, password)
        VALUES ($1, $2, $3);
        `, [newUser.name, newUser.email, passwordHash]);
        return res.sendStatus(201);
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
        if (checkExistingUser.rowCount === 0) return res.sendStatus(409);
        const comparePassword = compareSync(userLogin.password, checkExistingUser.password)
        console.log(checkExistingUser.password);
    } catch (error) {
        return res.sendStatus(500); 
    }
}