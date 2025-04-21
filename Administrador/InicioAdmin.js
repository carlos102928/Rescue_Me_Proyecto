function toggleMenu() {
    let menu = document.getElementById("menu");
    menu.style.display = (menu.style.display === "block") ? "none" : "block";
}

document.addEventListener("click", function(event) {
    let menu = document.getElementById("menu");
    let button = document.querySelector(".menu-button");
    if (!button.contains(event.target) && !menu.contains(event.target)) {
        menu.style.display = "none";
    }
});