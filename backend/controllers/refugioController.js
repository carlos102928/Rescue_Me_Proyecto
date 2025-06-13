import { getRefugios } from '../models/refugioModel.js';

export const obtenerRefugios = async (req, res) => {
    try {
        const resultado = await getRefugios();
        res.json(resultado);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};