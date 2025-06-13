import express from 'express'

import { registrarAdopcion } from '../controllers/adopcionController.js';

const router = express.Router();

router.post('/', registrarAdopcion);

export default router;