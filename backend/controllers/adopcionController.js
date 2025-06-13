import { pool } from '../config/db.js';

export const registrarAdopcion = async (req, res) => {
  const { correo, id_animal } = req.body;

  try {
    // Obtener ID del usuario por correo
    const [usuarios] = await pool.query('SELECT id_usuario FROM usuarios WHERE correo = ?', [correo]);
    if (usuarios.length === 0) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }

    const id_adoptante = usuarios[0].id_usuario;

    // Insertar adopción
    await pool.query('INSERT INTO adopcion (id_adoptante, id_animal) VALUES (?, ?)', [id_adoptante, id_animal]);

    res.status(201).json({ message: 'Adopción registrada con éxito' });
  } catch (error) {
    console.error("Error al registrar adopción:", error);
    res.status(500).json({ message: 'Error al procesar la adopción' });
  }
};