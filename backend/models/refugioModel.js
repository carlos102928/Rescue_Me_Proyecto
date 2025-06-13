import { pool } from '../config/db.js';

export const getRefugios = async() => {
    const [rows] = await pool.query('SELECT * FROM refugio');
    return rows;
};