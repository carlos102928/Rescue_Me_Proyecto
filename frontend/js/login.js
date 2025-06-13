document.getElementById('loginForm').addEventListener('submit', async (e) =>{
e.preventDefault();

  const correo = document.getElementById('correo').value;
  const contraseña = document.getElementById('contraseña').value;

  const res = await fetch('http://localhost:3000/api/login',{
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({correo, contraseña})
  });

  const data = await res.json();

  if (res.status === 200) {
    //guardar el rol
    localStorage.setItem('rol', data.rol);
    localStorage.setItem('correo', correo); // opcional guardar correo :)
    localStorage.setItem('id_usuario', data.id_usuario);
    //Redirigiendo segun Rol
    if (data.rol === 'administrador'){
        window.location.href = '/pages/administrador/InicioAdmin.html'
    } else if (data.rol === 'adoptante'){
        window.location.href = '/pages/adoptante/InicioA.html'
    }
    
  } else {
    alert(data.message);
  }
});