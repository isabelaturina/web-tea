document.addEventListener('DOMContentLoaded', function() {
    const menuItems = document.querySelectorAll('.menu-item');

    menuItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const action = this.querySelector('span').textContent;
            
            // Aqui você pode adicionar a lógica para cada ação
            switch(action) {
                case 'Controle de perfis':
                    // Redirecionar para página de controle de perfis
                    window.location.href = 'controle-perfis.html';
                    break;
                    
                case 'Excluir Notícia':
                    // Redirecionar para página de exclusão de notícias
                    window.location.href = 'excluir-noticia.html';
                    break;
                    
                case 'Atividade do site':
                    // Redirecionar para página de atividades
                    window.location.href = 'atividades.html';
                    break;
                    
                case 'Modificar textos':
                    // Redirecionar para página de modificação de textos
                    window.location.href = 'modificar-textos.html';
                    break;
            }
        });
    });
}); 