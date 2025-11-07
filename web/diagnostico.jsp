<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Como Identificar o Autismo</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/diagnosticos.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <div class="header-container">
            <div class="logo">
                <img src="icon/logo.png" alt="Logo do site" />
            </div>
             <nav class="main-nav">
              <a href="index.jsp">Início</a>
              <a href="perfil.jsp">Perfil</a>
               <a href="verificaLoginRedireciona.jsp?destino=noticias.html">Notícias</a>
                <a href="verificaLoginRedireciona.jsp?destino=clinicasprox.html">Clínicas</a><br>
              <a href="verificaLoginRedireciona.jsp?destino=chat.html">IA Bea</a><br>
     
              <% if (session.getAttribute("email") == null) { %>
      <a href="login.html" class="entrar" id="login-link">Entrar</a>
      <a href="cadastro.html" class="cadastrar" id="register-link">Cadastrar</a>
  <% } else { %>
      <a href="logout.jsp" class="logout" id="logout-link">Sair</a>
 
  <% } %>
          </nav>

            </nav>
            <div class="menu-toggle">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </header>


     <main>
        <section class="hero-section">
            <h1>Como Identificar o <span>Autismo</span></h1>
            <p class="subtitle">Reconhecer os sinais precocemente pode fazer toda a diferença no desenvolvimento da criança. Aqui você encontrará informações baseadas em evidências científicas.</p>
            
            <div class="alert">
                <div class="alert-content">
                    <span class="alert-icon">⚠️</span>
                    <p class="alert-title">Importante Lembrar</p>
                    <p class="alert-text">Apenas profissionais qualificados podem fazer o diagnóstico de autismo. Esta página é apenas informativa e não substitui uma avaliação médica profissional. Se você observar alguns destes sinais, procure ajuda especializada.</p>
                </div>
            </div>
        </section>

        <section class="age-signs">
            <h2>Sinais por faixa Etária</h2>
            <p>Os sinais do autismo podem aparecer desde os primeiros meses de vida e evoluem conforme a criança cresce.</p>

            <div class="age-cards">
                <div class="age-card">
                    <button class="favorite-btn">❤️</button>
                    <h3>6-12 meses</h3>
                </div>
                <div class="age-card">
                    <button class="favorite-btn">❤️</button>
                    <h3>12-18 meses</h3>
                </div>
                <div class="age-card">
                    <button class="favorite-btn">❤️</button>
                    <h3>18-24 meses</h3>
                </div>
                <div class="age-card">
                    <button class="favorite-btn">❤️</button>
                    <h3>2-3 anos</h3>
                </div>
            </div>
        </section>

   <section class="areas-afetadas">
            <h2>Principais Áreas Afetadas</h2>
            <div class="areas-grid">
                <div class="area-card">
                    <div class="area-marker blue"></div>
                    <div class="card-content">
                        <div class="card-header">
                            <div class="icon-wrapper">
          
                            </div>
                            <div class="header-text">
                                <h3>Comunicação</h3>
                                <p>Dificuldades na comunicação verbal e não verbal</p>
                            </div>
                        </div>
                        <ul class="symptoms-list">
                            <li>Atraso ou ausência da fala</li>
                            <li>Ecolalia (repetição de palavras)</li>
                            <li>Dificuldade para manter conversas</li>
                            <li>Uso limitado de gestos</li>
                            <li>Tom de voz incomum ou robótico</li>
                        </ul>
                        <div class="card-footer">
                            <span>Área 1 de 4</span>
                            <div class="dots">
                                <span class="dot active"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="area-card">
                    <div class="area-marker green"></div>
                    <div class="card-content">
                        <div class="card-header">
                            <div class="icon-wrapper">
                            
                            </div>
                            <div class="header-text">
                                <h3>Interação Social</h3>
                                <p>Desafios nas relações sociais e vínculos</p>
                            </div>
                        </div>
                        <ul class="symptoms-list">
                            <li>Pouco interesse em outras pessoas</li>
                            <li>Dificuldade para fazer amizades</li>
                            <li>Não compartilha interesses com outros</li>
                            <li>Evita contato visual</li>
                            <li>Não demonstra empatia de forma típica</li>
                        </ul>
                        <div class="card-footer">
                            <span>Área 2 de 4</span>
                            <div class="dots">
                                <span class="dot"></span>
                                <span class="dot active"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="area-card">
                    <div class="area-marker purple"></div>
                    <div class="card-content">
                        <div class="card-header">
                            <div class="icon-wrapper">
                          
                            </div>
                            <div class="header-text">
                                <h3>Comportamentos</h3>
                                <p>Padrões de comportamento restritivos e repetitivos</p>
                            </div>
                        </div>
                        <ul class="symptoms-list">
                            <li>Movimentos repetitivos (balançar, bater palmas)</li>
                            <li>Insistência em rotinas específicas</li>
                            <li>Interesses muito intensos e restritos</li>
                            <li>Fascinação por objetos ou partes de objetos</li>
                            <li>Resistência a mudanças</li>
                        </ul>
                        <div class="card-footer">
                            <span>Área 3 de 4</span>
                            <div class="dots">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot active"></span>
                                <span class="dot"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="area-card">
                    <div class="area-marker orange"></div>
                    <div class="card-content">
                        <div class="card-header">
                            <div class="icon-wrapper">
                          
                            </div>
                            <div class="header-text">
                                <h3>Sensorialidade</h3>
                                <p>Diferenças no processamento sensorial</p>
                            </div>
                        </div>
                        <ul class="symptoms-list">
                            <li>Hipersensibilidade a sons, luzes ou texturas</li>
                            <li>Busca por estímulos sensoriais intensos</li>
                            <li>Reações incomuns à dor</li>
                            <li>Preferências alimentares muito restritas</li>
                            <li>Comportamentos de auto-estimulação</li>
                        </ul>
                        <div class="card-footer">
                            <span>Área 4 de 4</span>
                            <div class="dots">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot active"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="manejos-terapeuticos">
            <h2>Manejos terapêuticos <span>no aspecto autista</span></h2>
            <p class="subtitle">Abordagens que transformam vidas com empatia, ciência e cuidado</p>
            
            <div class="manejos-grid">
                <!-- Fonoaudiólogo -->
                <div class="manejo-card" data-profissional="fonoaudiologo">
                    <div class="manejo-icon">
                        <img src="icon/fono.png" alt=""/>
                    </div>
                    <h3>Fonoaudiólogo</h3>
                    <p>Desenvolve comunicação e linguagem verbal e não verbal.</p>
                    <button class="saiba-mais">saiba mais</button>
                </div>

                <!-- Terapeuta ABA -->
                <div class="manejo-card" data-profissional="terapeuta-aba">
                    <div class="manejo-icon">
                        <img src="icon/ABA.png" alt=""/>
                    </div>
                    <h3>Terapeuta ABA</h3>
                    <p>Aplica técnicas baseadas na análise do comportamento.</p>
                    <button class="saiba-mais">saiba mais</button>
                </div>

                <!-- Terapeuta Ocupacional -->
                <div class="manejo-card" data-profissional="terapeuta-ocupacional">
                    <div class="manejo-icon">
                        <img src="icon/terapeuta ocupacional.png" alt=""/>
                    </div>
                    <h3>Terapeuta Ocupacional</h3>
                    <p>Estimula autonomia, coordenação e organização sensorial na rotina.</p>
                    <button class="saiba-mais">saiba mais</button>
                </div>

                <!-- Psicóloga -->
                <div class="manejo-card" data-profissional="psicologa">
                    <div class="manejo-icon">
                        <img src="icon/psicologa.png" alt=""/>
                    </div>
                    <h3>Psicóloga</h3>
                    <p>Trabalha aspectos emocionais, comportamentais e sociais.</p>
                    <button class="saiba-mais">saiba mais</button>
                </div>

                <!-- Musicoterapeuta -->
                <div class="manejo-card" data-profissional="musicoterapeuta">
                    <div class="manejo-icon">
                        <img src="icon/musicoterapeuta.png" alt=""/>
                    </div>
                    <h3>Musicoterapeuta</h3>
                    <p>Utiliza a música como ferramenta terapêutica.</p>
                    <button class="saiba-mais">saiba mais</button>
                </div>

                <!-- Neuropediatra -->
                <div class="manejo-card" data-profissional="neuropediatra">
                    <div class="manejo-icon">
                        <img src="icon/neuropediatra.png" alt=""/>
                    </div>
                    <h3>Neuropediatra</h3>
                    <p>Diagnóstico e acompanhamento médico especializado.</p>
                    <button class="saiba-mais">saiba mais</button>
                </div>
            </div>
        </section>

        <!-- Modal -->
        <div class="modal" id="profissional-modal">
            <div class="modal-content">
                <button class="modal-close">&times;</button>
                <div class="modal-header">
                    <div class="modal-icon">
                        <img src="" alt="Ícone do profissional" id="modal-icon-img">
                    </div>
                    <div class="modal-title">
                        <h3 id="modal-titulo"></h3>
                        <p id="modal-subtitulo"></p>
                    </div>
                </div>
                <div class="modal-body">
                    <p id="modal-descricao"></p>
                    <div class="areas-atuacao">
                        <h4>Áreas de atuação:</h4>
                        <ul id="modal-areas"></ul>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <div class="logo-footer">
                    <img src="icon/logo.png" alt=""/>
                    <span>Teamais</span>
                </div>
                <p>Nossa missão é ajudar responsáveis e entender mais sobre o espectro autista e auxiliar com informações verdadeiras sobre como lidar com seus filhos autistas.</p>
            </div>

            <div class="footer-section">
        <h4>Links rápidos</h4>
        <nav>
           <a href="index.jsp" >Início</a>
           <a href="curio.jsp" >Curiosidades</a>    
           <a href="direitoseleis.jsp">Direitos e leis</a>
           <a href="entendendo-autismo.jsp">Entendendo</a>       
           <a href="diagnostico.jsp">Diagnostico</a>
        </nav>
      </div>

                    </div>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // --- Script do Menu Hambúrguer ---
            const menuToggle = document.querySelector('.menu-toggle');
            const mainNav = document.querySelector('.main-nav');

            if (menuToggle && mainNav) {
                menuToggle.addEventListener('click', function() {
                    menuToggle.classList.toggle('active');
                    mainNav.classList.toggle('active');
                });

                // Fecha o menu ao clicar em um link
                mainNav.querySelectorAll('a').forEach(link => {
                    link.addEventListener('click', () => {
                        if (mainNav.classList.contains('active')) {
                            mainNav.classList.remove('active');
                            menuToggle.classList.remove('active');
                        }
                    });
                });
            }

            // --- Script do Modal de Profissionais ---
            const profissionaisData = {
                'fonoaudiologo': {
                    titulo: 'Fonoaudiólogo',
                    subtitulo: 'Comunicação e Linguagem',
                    descricao: 'Desenvolve habilidades de comunicação verbal e não verbal, trabalhando fala, linguagem e deglutição.',
                    areas: [
                        'Desenvolvimento da fala',
                        'Comunicação alternativa',
                        'Processamento auditivo',
                        'Habilidades sociais de comunicação'
                    ],
                    icone: 'icon/fono-icon.png'
                },
                'terapeuta-aba': {
                    titulo: 'Terapeuta ABA',
                    subtitulo: 'Análise do Comportamento',
                    descricao: 'Aplica princípios da análise do comportamento para ensinar novas habilidades e reduzir comportamentos inadequados.',
                    areas: [
                        'Modificação comportamental',
                        'Ensino estruturado',
                        'Habilidades acadêmicas',
                        'Comportamentos adaptativos'
                    ],
                    icone: 'icon/aba-icon.png'
                },
                'terapeuta-ocupacional': {
                    titulo: 'Terapeuta Ocupacional',
                    subtitulo: 'Habilidades Funcionais',
                    descricao: 'Desenvolve habilidades motoras, sensoriais e de vida diária para maior independência e qualidade de vida.',
                    areas: [
                        'Integração sensorial',
                        'Coordenação motora',
                        'Atividades de vida diária',
                        'Adaptação de ambientes'
                    ],
                    icone: 'icon/to-icon.png'
                },
                'psicologa': {
                    titulo: 'Psicóloga',
                    subtitulo: 'Comportamento e Cognição',
                    descricao: 'Trabalha aspectos comportamentais, emocionais e cognitivos, auxiliando no desenvolvimento de habilidades sociais.',
                    areas: [
                        'Terapia comportamental',
                        'Habilidades sociais',
                        'Regulação emocional',
                        'Desenvolvimento cognitivo'
                    ],
                    icone: 'icon/psicologo-icon.png'
                },
                'musicoterapeuta': {
                    titulo: 'Musicoterapeuta',
                    subtitulo: 'Terapia pela Música',
                    descricao: 'Utiliza a música como ferramenta terapêutica para desenvolver comunicação, socialização e expressão.',
                    areas: [
                        'Expressão emocional',
                        'Comunicação musical',
                        'Interação social',
                        'Coordenação e ritmo'
                    ],
                    icone: 'icon/music-icon.png'
                },
                'neuropediatra': {
                    titulo: 'Neuropediatra',
                    subtitulo: 'Medicina Especializada',
                    descricao: 'Médico especialista em desenvolvimento neurológico infantil, responsável pelo diagnóstico e acompanhamento médico.',
                    areas: [
                        'Diagnóstico médico',
                        'Prescrição medicamentosa',
                        'Acompanhamento neurológico',
                        'Coordenação multidisciplinar'
                    ],
                    icone: 'icon/neuro-icon.png'
                }
            };

            const modal = document.getElementById('profissional-modal');
            const modalClose = document.querySelector('.modal-close');
            const saibaMaisBtns = document.querySelectorAll('.saiba-mais');

            function abrirModal(profissional) {
                const data = profissionaisData[profissional];
                if (!data) {
                    console.error('Dados não encontrados para:', profissional);
                    return;
                }
                document.getElementById('modal-icon-img').src = data.icone;
                document.getElementById('modal-titulo').textContent = data.titulo;
                document.getElementById('modal-subtitulo').textContent = data.subtitulo;
                document.getElementById('modal-descricao').textContent = data.descricao;
                
                const areasList = document.getElementById('modal-areas');
                areasList.innerHTML = '';
                data.areas.forEach(area => {
                    const li = document.createElement('li');
                    li.textContent = area;
                    areasList.appendChild(li);
                });
                
                modal.classList.add('active');
            }

            if (modal && modalClose && saibaMaisBtns.length > 0) {
                saibaMaisBtns.forEach(btn => {
                    btn.addEventListener('click', () => {
                        const profissional = btn.parentElement.dataset.profissional;
                        abrirModal(profissional);
                    });
                });

                modalClose.addEventListener('click', () => {
                    modal.classList.remove('active');
                });

                window.addEventListener('click', (e) => {
                    if (e.target === modal) {
                        modal.classList.remove('active');
                    }
                });
            }
        });
    </script>
</body>
</html>