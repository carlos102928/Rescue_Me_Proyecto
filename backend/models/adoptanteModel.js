import { pool } from "../config/db.js";

export const getAdoptante = (callback) =>{
    pool.query("select * from usuarios where id = 1", callback);
};