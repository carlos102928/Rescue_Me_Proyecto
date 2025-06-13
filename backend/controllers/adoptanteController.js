import {getAdoptante} from "../models/adoptanteModel.js";

export const obtenerAdoptantes = (req, res) =>{
    getAdoptante((err, resultados) =>{
        if (err) return res.status(500).json({error: err.message});
        res.json(resiltados);
    });
};