import { crearDonacion } from '../models/donacionModel.js';

export const registrarDonacion = async (req, res) => {
    try {
        const { valor, medio_pago, id_adoptante, id_refugio } = req.body;

        if (!valor || !medio_pago || !id_adoptante || !id_refugio) {
            return res.status(400).json({ message: 'Todos los campos son obligatorios' });
        }

        const result = await crearDonacion(valor, medio_pago, id_adoptante, id_refugio);
        res.status(201).json({ message: 'Donación registrada con éxito', id_donacion: result.insertId });
    } catch (error) {
        res.status(500).json({ message: 'Error al registrar la donación', error: error.message });
    }
};

export const obtenerDonacion = (req, res) =>{
    obtenerDonacionModel((err, donaciones) =>{
        if (err) return res.status(500).json({error: err.message});
        res.json(donaciones);
    });
};

