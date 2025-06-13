import express from 'express';
import { obtenerRefugios } from '../controllers/refugioController.js';
const router = express.Router();

router.get('/refugio', obtenerRefugios)

export default router;