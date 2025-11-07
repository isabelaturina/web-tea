document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('resetPasswordForm');
    const notification = document.querySelector('.notification');

    // Esconder a notificação inicialmente
    if (notification) notification.style.display = 'none';

    // Função para alternar visibilidade da senha
    function setupPasswordToggle(toggleButton) {
        const input = toggleButton.parentElement.querySelector('input');
        toggleButton.addEventListener('click', function () {
            const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
            input.setAttribute('type', type);

            const icon = toggleButton.querySelector('i');
            if (type === 'text') {
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            } else {
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            }
        });
    }

    // Aplica o toggle para todos os botões encontrados
    document.querySelectorAll('.toggle-password').forEach(setupPasswordToggle);

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        const novaSenha = document.getElementById('novaSenha').value;
        const confirmarSenha = document.getElementById('confirmarSenha').value;

        // Validar se as senhas são iguais
        if (novaSenha !== confirmarSenha) {
            alert('As senhas não coincidem!');
            return;
        }

        // Validar requisitos mínimos da senha
        const senhaRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$/;
        if (!senhaRegex.test(novaSenha)) {
            alert('A senha deve ter no mínimo 6 caracteres e incluir uma combinação de números, letras e caracteres especiais!');
            return;
        }

        // Aqui você pode adicionar a lógica para enviar a alteração para o backend
        console.log('Alteração de senha solicitada');

        // Mostrar a notificação
        if (notification) notification.style.display = 'block';

        // Limpar o formulário
        form.reset();
    });
});
