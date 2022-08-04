import connection from '../db/database.js';
import jwt from 'jsonwebtoken';
import vrypt, { compareSync } from 'bcrypt';
import { signUpSchema } from '../schemas/signUpSchema.js';

export async function signUp (req, res) {
    const user = req.body;
    
    const {error} = signUpSchema.validate(user)
    if (error) return res.status(422).send(error.message);
    const passwordHash = bcrypt.hashSync(user.password, 10);

    try {
        
    } catch (error) {
        
    }
    
}

export async function signIn (req, res) {
    
}