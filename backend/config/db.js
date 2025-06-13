
import mysql from "mysql2/promise";

export const pool = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "sena",
    database: "proyecto3",
    waitForConnections: true,
    connectionLimit: 10,
        port: '3307'
})