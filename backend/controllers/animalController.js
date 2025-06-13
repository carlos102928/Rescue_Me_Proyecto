import { getAnimales } from "../models/animalModel.js";

export const obtenerAnimales = async (req, res) =>{
    getAnimales((err, resultados) =>{
        if (err) return res.status(500).json({error: err.message});
        res.json(resultados);
    });
};

export const getAnimal = async (req, res) =>{
 const animales = await getAnimales()
 res.status(200).json({ message: 'anmimales encontrados', animales})
}

import { getAnimalById } from '../models/animalModel.js';

export const obtenerAnimalPorId = async (req, res) => {
  try {
    const { id } = req.params;
    const animal = await getAnimalById(Number(id));
    console.log('Resultado obtenido:', animal);

    if (!animal) {
      return res.status(404).json({ mensaje: "Animal no encontrado" });
    }

    res.json({ animal });
  } catch (error) {
    console.error("Error al obtener animal:", error);
    res.status(500).json({ mensaje: "Error del servidor" });
  }
};
