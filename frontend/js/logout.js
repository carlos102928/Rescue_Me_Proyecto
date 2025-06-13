document.getElementById('logoutBtn').addEventListener('click', () => {
    localStorage.clear();
    window.location.replace('./login.html');
});