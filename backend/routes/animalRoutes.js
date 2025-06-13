import express from "express";
import { getAnimal, obtenerAnimalPorId } from "../controllers/animalController.js";

const router = express.Router();

router.get('/', getAnimal);

router.get('/:id', obtenerAnimalPorId); // GET /animales/:id

export default router;
