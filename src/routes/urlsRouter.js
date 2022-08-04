import { Router } from 'express';
import { shortenUrl, getUrlById, openUrl, deleteUrl } from '../controllers/urlsController.js';

const router = Router();
router.post('/urls/shorten', shortenUrl);
router.get('/urls/:id', getUrlById);
router.get('/urls/open/:shortUrl', openUrl);
router.delete('/urls/:id', deleteUrl);

export default router;