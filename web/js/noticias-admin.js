document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById('modal-confirmacao');
    const btnConfirmar = document.getElementById('btn-confirmar');
    const btnCancelar = document.getElementById('btn-cancelar');
    let noticiaParaExcluir = null;

    // Função para formatar a data
    function formatarData(dataString) {
        const data = new Date(dataString);
        return data.toLocaleDateString('pt-BR', {
            day: '2-digit',
            month: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        });
    }

    // Função para criar card de notícia com botão de exclusão
    function criarCardNoticia(noticia) {
        return `
            <article class="noticia-card" data-id="${noticia.id}">
                <button class="delete-button" title="Excluir notícia">
                    <i class="fas fa-trash-alt"></i>
                </button>
                <img src="${noticia.imagem}" alt="${noticia.titulo}" onerror="this.src='../img/noticia-padrao.jpg'" />
                <div class="content">
                    <span class="categoria">Autismo</span>
                    <h2>${noticia.titulo}</h2>
                    <p>${noticia.descricao}</p>
                    <div class="info">
                        <span class="data">${formatarData(noticia.dataPublicacao)}</span>
                    </div>
                    <a href="${noticia.link}" target="_blank" class="ler-mais">Ler mais</a>
                </div>
            </article>
        `;
    }

    // Função para mostrar o modal
    function mostrarModal() {
        modal.classList.add('active');
    }

    // Função para esconder o modal
    function esconderModal() {
        modal.classList.remove('active');
        noticiaParaExcluir = null;
    }

    // Função para excluir notícia
    async function excluirNoticia(id) {
        try {
            const response = await fetch(`http://localhost:8080/api/noticias/${id}`, {
                method: 'DELETE'
            });

            if (!response.ok) {
                throw new Error('Erro ao excluir notícia');
            }

            // Remove o card da notícia do DOM
            const card = document.querySelector(`.noticia-card[data-id="${id}"]`);
            if (card) {
                card.remove();
            }

            // Feedback visual
            const feedback = document.createElement('div');
            feedback.className = 'feedback-message success';
            feedback.textContent = 'Notícia excluída com sucesso!';
            document.body.appendChild(feedback);

            setTimeout(() => {
                feedback.remove();
            }, 3000);

        } catch (error) {
            console.error('Erro ao excluir notícia:', error);
            
            // Feedback de erro
            const feedback = document.createElement('div');
            feedback.className = 'feedback-message error';
            feedback.textContent = 'Erro ao excluir notícia. Tente novamente.';
            document.body.appendChild(feedback);

            setTimeout(() => {
                feedback.remove();
            }, 3000);
        }
    }

    // Carregar notícias
    async function carregarNoticias() {
        const container = document.getElementById('noticias-container');
        
        try {
            const response = await fetch('http://localhost:8080/api/noticias');
            if (!response.ok) {
                throw new Error('Erro ao carregar notícias');
            }
            
            const data = await response.json();
            
            if (!data || data.length === 0) {
                container.innerHTML = '<p class="sem-noticias">Nenhuma notícia encontrada.</p>';
                return;
            }

            container.innerHTML = '';
            data.forEach(noticia => {
                container.innerHTML += criarCardNoticia(noticia);
            });

            // Adicionar event listeners aos botões de exclusão
            document.querySelectorAll('.delete-button').forEach(button => {
                button.addEventListener('click', function(e) {
                    e.preventDefault();
                    const card = this.closest('.noticia-card');
                    noticiaParaExcluir = card.dataset.id;
                    mostrarModal();
                });
            });
            
        } catch (error) {
            console.error('Erro ao carregar notícias:', error);
            container.innerHTML = `
                <div class="erro-container">
                    <p class="erro-mensagem">Não foi possível carregar as notícias no momento.</p>
                    <button onclick="carregarNoticias()" class="botao-tentar-novamente">Tentar novamente</button>
                </div>
            `;
        }
    }

    // Event Listeners
    btnConfirmar.addEventListener('click', function() {
        if (noticiaParaExcluir) {
            excluirNoticia(noticiaParaExcluir);
            esconderModal();
        }
    });

    btnCancelar.addEventListener('click', esconderModal);

    // Fechar modal ao clicar fora
    modal.addEventListener('click', function(e) {
        if (e.target === modal) {
            esconderModal();
        }
    });

    // Carregar notícias quando a página carregar
    carregarNoticias();
}); 