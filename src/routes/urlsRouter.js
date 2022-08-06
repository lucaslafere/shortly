import { Router } from 'express';
import { shortenUrl, getUrlById, openUrl, deleteUrl } from '../controllers/urlsController.js';
import { auth } from '../middlewares/auth.js';

const router = Router();
router.post('/urls/shorten', auth, shortenUrl);
router.get('/urls/:id', getUrlById);
router.get('/urls/open/:shortUrl', openUrl);
router.delete('/urls/:id', auth, deleteUrl);

export default router;