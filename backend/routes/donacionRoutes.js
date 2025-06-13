import express from 'express';
import { registrarDonacion } from '../controllers/donacionController.js';

const router = express.Router();

router.post('/donaciones', registrarDonacion);

export default router;