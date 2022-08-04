import { Router } from 'express';
import { getMyUser } from '../controllers/userController.js';

const router = Router();
router.get('/users/me', getMyUser);

export default router;