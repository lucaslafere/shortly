import { Router } from 'express';
import { getMyUser } from '../controllers/userController.js';
import { auth } from '../middlewares/auth.js';
const router = Router();
router.get('/users/me', auth, getMyUser);

export default router;