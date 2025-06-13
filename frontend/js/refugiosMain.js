const API_URL_REFUGIOS = 'http://localhost:3000/api/refugio';

async function cargarRefugios() {
    try {
    const res = await fetch(API_URL_REFUGIOS);
    const datos = await res.json();
console.log(datos);
    const tabla = document.getElementById('tablaRefugios');
    tabla.innerHTML = '';
    datos.forEach(refugio => {
        tabla.innerHTML += `
        <tr>
            <td>${refugio.nombre_refugio}</td>
            <td>${refugio.direccion}</td>
            <td>${refugio.correo}</td>
        </tr>
        `;
    });
    } catch (error) {
    console.error('Error al cargar los clientes:', error);
    }
}

cargarRefugios();