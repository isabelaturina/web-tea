const API_URL = "https://api-localizacao-5sf4.onrender.com";
const RAIO_METROS = 10000; // Constante para o raio de busca

document.addEventListener('DOMContentLoaded', () => {
    const buscarButton = document.getElementById('buscarClinicas');
    // Verifica se o botão existe antes de adicionar o event listener
    if (buscarButton) {
        buscarButton.addEventListener('click', buscarClinicas);
    } else {
        console.warn("Elemento com ID 'buscarClinicas' não encontrado. O botão de busca pode não estar funcionando.");
    }

    // Menu mobile
    const menuToggle = document.querySelector('.menu-toggle');
    const navMenu = document.querySelector('nav');

    if (menuToggle && navMenu) {
        menuToggle.addEventListener('click', function() {
            this.classList.toggle('active');
            navMenu.classList.toggle('active');
        });

        document.querySelectorAll('nav a').forEach(link => {
            link.addEventListener('click', () => {
                menuToggle.classList.remove('active');
                navMenu.classList.remove('active');
            });
        });
    } else {
        console.warn("Elementos do menu ('.menu-toggle' ou 'nav') não encontrados. O menu mobile pode não estar funcionando.");
    }
});

// Função para calcular a distância entre duas coordenadas (Fórmula de Haversine)
function calcularDistancia(lat1, lon1, lat2, lon2) {
    // Validar se as coordenadas são números válidos
    if (isNaN(lat1) || isNaN(lon1) || isNaN(lat2) || isNaN(lon2)) {
        console.error('Coordenadas inválidas para cálculo de distância:', { lat1, lon1, lat2, lon2 });
        return 0;
    }

    const R = 6371; // Raio da Terra em km
    const dLat = (lat2 - lat1) * Math.PI / 180;
    const dLon = (lon2 - lon1) * Math.PI / 180;
    const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * Math.PI / 180) * Math.cos(lat2 * Math.PI / 180) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2);
    const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    const distancia = R * c; // Distância em km

    return distancia || 0; // Retorna 0 se o cálculo resultar em NaN
}

// Função assíncrona para obter a localização do usuário usando a API de Geolocalização do navegador
async function obterLocalizacao() {
    return new Promise((resolve, reject) => {
        if (!navigator.geolocation) {
            reject(new Error('Geolocalização não é suportada pelo seu navegador.'));
            return;
        }

        navigator.geolocation.getCurrentPosition(
            (position) => {
                resolve({
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                });
            },
            (error) => {
                // Mensagens de erro mais amigáveis
                let errorMessage = 'Erro desconhecido ao obter localização.';
                switch (error.code) {
                    case error.PERMISSION_DENIED:
                        errorMessage = 'Permissão de geolocalização negada. Por favor, permita o acesso à sua localização.';
                        break;
                    case error.POSITION_UNAVAILABLE:
                        errorMessage = 'Informação de localização indisponível.';
                        break;
                    case error.TIMEOUT:
                        errorMessage = 'Tempo limite excedido ao tentar obter a localização.';
                        break;
                }
                reject(new Error(errorMessage));
            },
            {
                enableHighAccuracy: true, // Tenta obter a localização mais precisa
                timeout: 10000,           // Aumentado o timeout para 10 segundos
                maximumAge: 0             // Não usar localização em cache
            }
        );
    });
}

// Função principal para buscar clínicas
async function buscarClinicas() {
    const status = document.getElementById("status");
    const clinicasGrid = document.getElementById('clinicas-results');

    // Limpa mensagens anteriores e define um estado inicial
    if (status) {
        status.textContent = "Obtendo sua localização...";
        status.className = "status-message"; // Resetar classes de status
    }
    if (clinicasGrid) {
        clinicasGrid.innerHTML = ''; // Limpa resultados anteriores
    }

    try {
        const coordenadas = await obterLocalizacao();
        
        if (status) {
            status.textContent = "Buscando clínicas próximas...";
        }

        // CORREÇÃO AQUI: Alterado o caminho da API para '/api/clinicas/proximas'
        // para corresponder ao seu Spring Boot Controller
        const url = `${API_URL}/api/clinicas/proximas?lat=${coordenadas.lat}&lng=${coordenadas.lng}&raioEmMetros=${RAIO_METROS}`;

        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
                // REMOVIDO: 'Access-Control-Allow-Origin': '*' - Isso é um cabeçalho de resposta do servidor, não de requisição do cliente.
            },
            mode: 'cors', // Necessário para requisições cross-origin
            credentials: 'omit' // Não enviar cookies ou credenciais
        });

        if (!response.ok) {
            // Tenta obter uma mensagem de erro mais detalhada do servidor
            let errorMessage = `Erro na requisição: ${response.status} ${response.statusText}`;
            try {
                const errorData = await response.json();
                if (errorData && errorData.message) {
                    errorMessage = errorData.message; // Assume que a API retorna um JSON com campo 'message' em caso de erro
                }
            } catch (jsonError) {
                // Ignora se a resposta não for JSON
            }
            throw new Error(errorMessage);
        }

        const data = await response.json();

        // Verificação do formato da resposta da API
        // Se a API retornar a lista de clínicas diretamente, 'data' já é o array.
        // Se a API encapsular em um 'body', como 'ResponseEntity.body(list)', então 'data.body' é o array.
        // Vamos manter 'data.body' conforme seu código original, mas esteja ciente disso.
        const clinicas = data.body; // Supondo que a lista de clínicas esteja em data.body

        if (!clinicas || !Array.isArray(clinicas)) {
            throw new Error('Formato de resposta inválido da API. Esperado um array de clínicas.');
        }

        // Ordenar clínicas por distância
        const clinicasComDistancia = clinicas.map(clinica => ({
            ...clinica,
            distancia: calcularDistancia(
                coordenadas.lat,
                coordenadas.lng,
                clinica.latitude, // Supondo que o nome do campo seja 'latitude' na resposta da API
                clinica.longitude // Supondo que o nome do campo seja 'longitude' na resposta da API
            )
        })).sort((a, b) => a.distancia - b.distancia);

        if (status) {
            status.textContent = `Encontradas ${clinicasComDistancia.length} clínicas em até ${RAIO_METROS/1000} km:`;
            status.classList.remove("erro"); // Remove classe de erro se a busca foi bem-sucedida
        }

        if (clinicasComDistancia.length === 0) {
            if (clinicasGrid) {
                clinicasGrid.innerHTML = `
                    <div class="no-results">
                        <p>Nenhuma clínica encontrada na sua região.</p>
                        <p>Tente aumentar o raio de busca ou verificar se há clínicas cadastradas.</p>
                    </div>
                `;
            }
            return;
        }

        if (clinicasGrid) {
            clinicasComDistancia.forEach(clinica => {
                const clinicaCard = document.createElement('div');
                clinicaCard.className = 'clinica-card';
                clinicaCard.innerHTML = `
                    <h3>${clinica.nome}</h3>
                    <p class="distancia">Distância: ${clinica.distancia.toFixed(2)} km</p>
                    <p class="endereco">📍 ${clinica.rua}</p>
                    ${clinica.telefone ? `<p class="telefone">📞 ${clinica.telefone}</p>` : ''}
                    ${clinica.email ? `<p class="email">✉️ ${clinica.email}</p>` : ''}
                    ${clinica.website ? `<p class="website"><a href="${clinica.website}" target="_blank">🌐 Visitar site</a></p>` : ''}
                `;
                clinicasGrid.appendChild(clinicaCard);
            });
        }

    } catch (error) {
        console.error('Erro na função buscarClinicas:', error);
        if (status) {
            // Adapta a mensagem de erro para o usuário
            let displayMessage = "Ocorreu um erro ao buscar as clínicas.";
            if (error.message.includes("Geolocalização não é suportada") || error.message.includes("Permissão de geolocalização negada")) {
                displayMessage = error.message; // Mensagem específica de geolocalização
            } else if (error.message.includes("Failed to fetch")) {
                displayMessage = "Não foi possível conectar ao servidor da API. Verifique sua conexão ou se a API está online.";
            } else if (error.message.includes("Erro na requisição")) {
                displayMessage = `Erro na API: ${error.message.split(': ')[1] || error.message}`;
            } else {
                displayMessage = `Erro: ${error.message}`;
            }

            status.textContent = displayMessage;
            status.classList.add("erro");
        }
        if (clinicasGrid) {
            clinicasGrid.innerHTML = `
                <div class="error-message">
                    <p>Não foi possível buscar as clínicas neste momento.</p>
                    <p>Por favor, tente novamente mais tarde.</p>
                    <p>Detalhes técnicos (apenas para depuração): ${error.message}</p>
                </div>
            `;
        }
    }
}