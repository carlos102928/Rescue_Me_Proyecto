import { pool } from '../config/db.js';

export const crearDonacion = async (valor, medio_pago, id_adoptante, id_refugio) => {
    const [result] = await pool.query(
        'INSERT INTO donaciones (valor, medio_de_pago, id_adoptantes, id_refugio) VALUES (?, ?, ?, ?)',
        [valor, medio_pago, id_adoptante, id_refugio]
    );
    return result;
};