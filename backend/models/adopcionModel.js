import { pool } from "../config/db.js";

export const registrarAdopcionEnBD = async (id_adoptante, id_animal) => {
  await pool.query(
    `INSERT INTO adopcion (id_adoptante, id_animal) VALUES (?, ?)`,
    [id_adoptante, id_animal]
  );
};