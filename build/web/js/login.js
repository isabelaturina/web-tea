document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('loginForm');
    const togglePassword = document.querySelector('.toggle-password');
    const passwordInput = document.getElementById('senha');

    // Toggle password visibility
    togglePassword.addEventListener('click', function() {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        
        // Trocar o ícone (olho aberto mostra a senha, fechado esconde)
        const icon = this.querySelector('i');
        if (type === 'text') {
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        } else {
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        }
    });

    // Form validation and submission
    form.addEventListener('submit', function(e) {
        e.preventDefault();

        const email = document.getElementById('email').value.trim();
        const senha = passwordInput.value;
        const remember = document.querySelector('input[name="remember"]').checked;

        // Basic validation
        if (!isValidEmail(email)) {
            showError('email', 'Por favor, insira um email válido');
            return;
        }

        if (senha.length < 1) {
            showError('senha', 'Por favor, insira sua senha');
            return;
        }

        // If validation passes, you can submit the form
        console.log('Login válido, enviando dados...');
        console.log('Lembrar usuário:', remember);
        // form.submit();
    });

    // Helper functions
    function showError(fieldId, message) {
        const field = document.getElementById(fieldId);
        const errorDiv = field.parentElement.querySelector('.error-message') || document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        
        if (!field.parentElement.querySelector('.error-message')) {
            field.parentElement.appendChild(errorDiv);
        }

        field.classList.add('error');
        
        // Remove error after 3 seconds
        setTimeout(() => {
            errorDiv.remove();
            field.classList.remove('error');
        }, 3000);
    }

    function isValidEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }

    // Add input event listeners to clear errors on type
    const inputs = form.querySelectorAll('input');
    inputs.forEach(input => {
        input.addEventListener('input', function() {
            const errorMessage = this.parentElement.querySelector('.error-message');
            if (errorMessage) {
                errorMessage.remove();
            }
            this.classList.remove('error');
        });
    });

    // Remember me functionality
    const rememberCheckbox = document.querySelector('input[name="remember"]');
    
    // Check if there's a saved email
    const savedEmail = localStorage.getItem('rememberedEmail');
    if (savedEmail) {
        document.getElementById('email').value = savedEmail;
        rememberCheckbox.checked = true;
    }

    // Save email when "remember me" is checked
    form.addEventListener('submit', function() {
        if (rememberCheckbox.checked) {
            localStorage.setItem('rememberedEmail', document.getElementById('email').value);
        } else {
            localStorage.removeItem('rememberedEmail');
        }
    });
}); 