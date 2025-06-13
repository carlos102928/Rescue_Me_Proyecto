document.addEventListener('DOMContentLoaded', () => {
  const params = new URLSearchParams(window.location.search);
  const id_animal = params.get('id_animal');

  fetch(`http://localhost:3000/api/animales/${id_animal}`)
    .then(res => res.json())
    .then(data => {
      const { animal } = data;
      document.getElementById('imagenAnimal').src = `${animal.imagen_url}`;
      document.getElementById('nombreAnimal').textContent = `Animal: ${animal.animal}`;
      document.getElementById('razaAnimal').textContent = `Raza: ${animal.raza}`;
      document.getElementById('refugioAnimal').textContent = `Refugio: ${animal.nombre_refugio}`;
    })
    .catch(err => {
      console.error("Error al cargar el detalle del animal", err);
    });
})

document.getElementById('formAdopcion').addEventListener('submit', async (e) => {
  e.preventDefault();

  const checkbox = document.getElementById('checkboxCompromiso');
  if (!checkbox.checked) {
    alert("Debes aceptar el compromiso antes de adoptar.");
    return;
  }

  const correo = localStorage.getItem('correo');
  const params = new URLSearchParams(window.location.search);
  const id_animal = params.get('id_animal');

  if (!correo || !id_animal) {
    alert("Faltan datos para realizar la adopción.");
    return;
  }

  try {
    const res = await fetch('http://localhost:3000/api/adopciones', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ correo, id_animal })
    });

    const data = await res.json();

    if (res.ok) {
      alert("¡Solicitud de adopción enviada exitosamente!");
      window.location.href = "./AdopcionRe.html"; // redirección opcional
    } else {
      alert(data.message || "Ocurrió un error.");
    }
  } catch (error) {
    console.error("Error al enviar la solicitud:", error);
    alert("Error de red o del servidor.");
  }
});