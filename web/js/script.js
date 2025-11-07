function togglePassword() {
    const senhaInput = document.getElementById('senha');
    const eyeIcon = document.getElementById('eye-icon');
    
    // Alterna o tipo do campo senha
    if (senhaInput.type === 'password') {
        senhaInput.type = 'text';
        eyeIcon.textContent = '🙈';  // Ícone de olho fechado
    } else {
        senhaInput.type = 'password';
        eyeIcon.textContent = '👁️';  // Ícone de olho aberto
    }
}

// Menu hambúrguer
document.addEventListener('DOMContentLoaded', function() {
    const menuToggle = document.querySelector('.menu-toggle');
    const mainNav = document.querySelector('.main-nav');

    if (menuToggle && mainNav) {
        menuToggle.addEventListener('click', function() {
            menuToggle.classList.toggle('active');
            mainNav.classList.toggle('active');
        });

        // Fecha o menu ao clicar em um link
        const navLinks = mainNav.querySelectorAll('a');
        navLinks.forEach(link => {
            link.addEventListener('click', () => {
                menuToggle.classList.remove('active');
                mainNav.classList.remove('active');
            });
        });

        // Fecha o menu ao redimensionar a janela para desktop
        window.addEventListener('resize', () => {
            if (window.innerWidth > 991) {
                menuToggle.classList.remove('active');
                mainNav.classList.remove('active');
            }
        });
    }
});
