const API_REFUGIOS = 'http://localhost:3000/api/refugio';
const API_DONACIONES = 'http://localhost:3000/api/donaciones';

document.addEventListener('DOMContentLoaded', () => {
    cargarRefugios();

    document.querySelector('form').addEventListener('submit', async (e) => {
        e.preventDefault();

        const valor = parseFloat(document.getElementById('valorDonacion').value);
        const id_refugio = parseInt(document.getElementById('ListadoRefugio').value);
        const medio_pago = document.getElementById('ListadoMetodoDePago').options[
            document.getElementById('ListadoMetodoDePago').selectedIndex
        ].text;

        const id_adoptante = parseInt(localStorage.getItem('id_usuario'));

        if (!id_adoptante) {
            return alert('Debe iniciar sesión como adoptante.');
        }

        const donacion = { valor, medio_pago, id_adoptante, id_refugio };

        try {
            const res = await fetch(API_DONACIONES, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(donacion)
            });

            const data = await res.json();
            if (res.ok) {
                document.getElementById('Texto').textContent = data.message;
                document.getElementById('Texto').style.display = 'block';
            } else {
                alert(data.message);
            }
        } catch (err) {
            console.error('Error al donar:', err);
        }
    });
});

async function cargarRefugios() {
    try {
        const res = await fetch(API_REFUGIOS);
        const refugios = await res.json();

        const select = document.getElementById('ListadoRefugio');
        refugios.forEach(refugio => {
            const option = document.createElement('option');
            option.value = refugio.id_refugio;
            option.textContent = refugio.nombre_refugio;
            select.appendChild(option);
        });
    } catch (err) {
        console.error('Error al cargar refugios:', err);
    }
}