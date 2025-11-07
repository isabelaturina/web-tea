<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Entendendo o Autismo - TEA+</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/entendendo-autismo.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
 
    <header>
        <div class="header-container">
            <div class="logo">
                <img src="icon/logo.png" alt=""/>
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
            <div class="menu-toggle">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </header>


    <main class="hero-section">
        <div class="hero-content">
            <h1>Entendendo <span>o autismo</span></h1>
            <h2>Explore cada aba abaixo para aprender mais.</h2>
            <p>Explore cada aspecto para aprender mais sobre o Transtorno do Espectro Autista. Informações baseadas em evidências científicas para famílias e profissionais.</p>
            
            <div class="stats">
                <div class="stat-item">
                    <div class="stat-number">1 em 36</div>
                    <div class="stat-label">crianças</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">+2M</div>
                    <div class="stat-label">no Brasil</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">85%</div>
                    <div class="stat-label">Evoluíram</div>
                </div>
            </div>

            <div class="action-buttons">
              <a href="diagnostico.jsp" class="action-btn with-arrow">Como identificar</a>
              <a href="direitoseleis.jsp" class="action-btn">Direitos e Leis</a>
            </div>
        </div>
    </main>

    <section class="autism-info">
        <h2>O que é o Autismo?</h2>
        <div class="info-cards">
            <div class="info-card">
                <img src="icon/neuro-icon.png" alt=""/>
                <h3>Condição Neurológica</h3>
                <p>O autismo é uma condição neurológica que afeta o desenvolvimento cerebral e a forma como a pessoa interage com o mundo.</p>
            </div>
            <div class="info-card">
                <img src="icon/infocard2-icon.png" alt=""/>
                <h3>Espectro Amplo</h3>
                <p>Compreende uma variedade de manifestações e intensidades, afetando cada pessoa de maneira única.</p>
            </div>
            <div class="info-card">
                <img src="icon/infocard3-icon.png" alt=""/>
                <h3>Força e Talentos</h3>
                <p>Pessoas autistas podem desenvolver habilidades extraordinárias quando recebem suporte adequado.</p>
            </div>
        </div>
    </section>

    
    <section class="accordion-section">
        <div class="accordion-item">
            <div class="accordion-header">
      
                <h3>Principais sinais do Autismo</h3>
                <span class="accordion-arrow">▼</span>
            </div>
            <div class="accordion-content">
                <div class="sintomas-grid">
                    <div class="sintoma-categoria">
                        <h4>Comunicação e Linguagem:</h4>
                        <ul>
                            <li>Atraso ou ausência da fala</li>
                            <li>Repetição de palavras (ecolalia)</li>
                            <li>Dificuldade em manter conversa</li>
                            <li>Uso literal da linguagem</li>
                            <li>Dificuldade com gestos e expressões faciais</li>
                        </ul>
                    </div>
                    <div class="sintoma-categoria">
                        <h4>Interação Social:</h4>
                        <ul>
                            <li>Preferência por atividades solitárias</li>
                            <li>Dificuldade em fazer amizades</li>
                            <li>Evita contato visual</li>
                            <li>Dificuldade em compreender sinais sociais</li>
                            <li>Resistência ao contato físico</li>
                        </ul>
                    </div>
                    <div class="sintoma-categoria">
                        <h4>Comportamentos Repetitivos:</h4>
                        <ul>
                            <li>Movimentos repetitivos (balançar, bater palmas)</li>
                            <li>Interesse intenso em temas específicos</li>
                            <li>Necessidade de rotina</li>
                            <li>Sensibilidade sensorial (sons, texturas, luzes)</li>
                            <li>Dificuldade com mudanças</li>
                        </ul>
                    </div>
                    <div class="sintoma-categoria">
                        <h4>Sinais Precoces (0-3 anos):</h4>
                        <ul>
                            <li>Não responde ao nome aos 12 meses</li>
                            <li>Não aponta para objetos aos 14 meses</li>
                            <li>Não brinca de faz de conta aos 18 meses</li>
                            <li>Evita contato visual</li>
                            <li>Atraso na fala ou perda de habilidades</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <div class="accordion-header">
                
                <h3>Níveis de Suporte no Autismo</h3>
                <span class="accordion-arrow">▼</span>
            </div>
            <div class="accordion-content">
                <div class="niveis-suporte">
                    <p class="niveis-intro">O Transtorno do Espectro Autista (TEA) é classificado em três níveis de suporte, baseados na quantidade de assistência necessária para as atividades diárias:</p>
                    
                    <div class="nivel-card nivel-1">
                        <div class="nivel-header">
                            <span class="nivel-numero">1</span>
                            <h4>Nível 1 - Suporte Mínimo</h4>
                        </div>
                        <p class="nivel-desc">Pessoas que precisam de pouco apoio para atividades diárias</p>
                        <div class="nivel-detalhes">
                            <div class="caracteristicas">
                                <h5>Características:</h5>
                                <ul>
                                    <li>Funciona independentemente</li>
                                    <li>Comunica e estuda normalmente</li>
                                    <li>Tem vida social (com apoio)</li>
                                    <li>Mantém rotinas, vínculo emocional</li>
                                </ul>
                            </div>
                            <div class="desafios">
                                <h5>Desafios:</h5>
                                <ul>
                                    <li>Dificuldade em situações sociais complexas</li>
                                    <li>Dificuldade de adaptar sua organização</li>
                                    <li>Sensibilidade sensorial</li>
                                    <li>Ansiedade em mudanças de rotina</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="nivel-card nivel-2">
                        <div class="nivel-header">
                            <span class="nivel-numero">2</span>
                            <h4>Nível 2 - Suporte Substancial</h4>
                        </div>
                        <p class="nivel-desc">Pessoas que precisam de maior suporte para atividades diárias</p>
                        <div class="nivel-detalhes">
                            <div class="caracteristicas">
                                <h5>Características:</h5>
                                <ul>
                                    <li>Comunicação verbal limitada</li>
                                    <li>Podem trabalhar com apoio</li>
                                    <li>Interesses restritos e específicos</li>
                                    <li>Rotinas bem estruturadas</li>
                                </ul>
                            </div>
                            <div class="desafios">
                                <h5>Desafios:</h5>
                                <ul>
                                    <li>Dificuldades sociais marcantes</li>
                                    <li>Comportamentos repetitivos bem visíveis</li>
                                    <li>Sensibilidade sensorial intensa</li>
                                    <li>Necessita apoio para atividades diárias</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="nivel-card nivel-3">
                        <div class="nivel-header">
                            <span class="nivel-numero">3</span>
                            <h4>Nível 3 - Suporte Substancial</h4>
                        </div>
                        <p class="nivel-desc">Pessoas que precisam de suporte intensivo para atividades diárias</p>
                        <div class="nivel-detalhes">
                            <div class="caracteristicas">
                                <h5>Características:</h5>
                                <ul>
                                    <li>Comunicação verbal limitada</li>
                                    <li>Podem trabalhar com apoio</li>
                                    <li>Interesses muito restritos e específicos</li>
                                    <li>Rotinas bem estruturadas</li>
                                </ul>
                            </div>
                            <div class="necessidades">
                                <h5>Necessidades:</h5>
                                <ul>
                                    <li>Supervisão constante</li>
                                    <li>Apoio para todas as atividades</li>
                                    <li>Ambiente altamente estruturado</li>
                                    <li>Cuidados especializados</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="importante-lembrar">
                        <h5>Importante Lembrar:</h5>
                        <ul>
                            <li>Cada pessoa é única: O nível pode variar ao longo da vida</li>
                            <li>Não é hierárquico: Não define valor ou potencial da pessoa</li>
                            <li>Pode mudar: Com suporte e intervenção, as dificuldades podem diminuir</li>
                            <li>Individualidade: O mesmo nível pode se manifestar de formas diferentes em cada pessoa</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="accordion-item">
            <div class="accordion-header">
                
                <h3>Lidando com o preconceito</h3>
                <span class="accordion-arrow">▼</span>
            </div>
            <div class="accordion-content">
                <div class="preconceito-content">
                    <p class="preconceito-intro">O preconceito contra pessoas autistas ainda acontece com frequência, especialmente pela falta de informação. É importante saber como lidar:</p>
                    
                    <div class="preconceito-grid">
                        <div class="preconceito-column">
                            <h4>Para Famílias:</h4>
                            <ul>
                                <li>Eduque-se sobre o autismo</li>
                                <li>Explique para parentes e amigos</li>
                                <li>Conecte-se com outras famílias</li>
                                <li>Conheça os direitos legais</li>
                                <li>Procure apoio profissional</li>
                            </ul>
                        </div>
                        <div class="preconceito-column">
                            <h4>Para a Sociedade:</h4>
                            <ul>
                                <li>Questione estereótipos</li>
                                <li>Aprenda sobre neurodiversidade</li>
                                <li>Seja paciente e compreensivo</li>
                                <li>Promova inclusão em espaços públicos</li>
                                <li>Apoie políticas inclusivas</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="faq-section">
        <div class="faq-header">
           <img src="icon/perguntas.png" alt="Ícone de pergunta" class="faq-icon" />
           
            <h2>Perguntas <span>Frequentes</span></h2>
            <p>Respostas baseadas em evidências científicas para as dúvidas mais comuns sobre autismo</p>
        </div>

        <div class="faq-categories">
            <button class="category-btn active" data-category="diagnostico">
                <img src="icon/conhecimento.png" alt=""/>
                Diagnóstico
            </button>
            <button class="category-btn" data-category="infancia">
                <img src="icon/baby-icon.png" alt=""/>
                Infância
            </button>
            <button class="category-btn" data-category="educacao">
                <img src="icon/educa-icon.png" alt=""/>
                Educação
            </button>
            <button class="category-btn" data-category="familia">
                <img src="icon/familia-icon.png" alt=""/>
                Família
            </button>
            <button class="category-btn" data-category="tratamento">
                <img src="icon/dna-icon.png" alt=""/>
                Tratamento
            </button>
            <button class="category-btn" data-category="sociedade">
                <img src="icon/sociedade-icon.png" alt=""/>
                Sociedade
            </button>
        </div>

        <div class="faq-content">
            <!-- Diagnóstico -->
            <div class="faq-category active" id="diagnostico">
                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Como saber se meu filho é autista?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Observe sinais como: não responder ao nome, evitar contato visual, não apontar para objetos, atraso na fala, comportamentos repetitivos e dificuldade de interação social. Se notar esses sinais, procure um pediatra ou neuropediatra especializado.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Qual a idade ideal para o diagnóstico?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>O diagnóstico pode ser feito a partir dos 18 meses, mas é mais preciso entre 2-3 anos. Quanto mais cedo, melhor para iniciar intervenções que fazem toda a diferença no desenvolvimento.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>O diagnóstico é 100% preciso?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Não existe um exame específico para autismo. O diagnóstico é clínico, baseado na observação do comportamento. É importante procurar profissionais experientes e, se necessário, buscar uma segunda opinião.</p>
                    </div>
                </div>
            </div>

            <!-- Infância -->
            <div class="faq-category" id="infancia">
                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Meu bebê pode ser autista?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Alguns sinais podem aparecer nos primeiros meses: pouco contato visual, não sorrir socialmente aos 6 meses, não responder ao nome aos 12 meses. Mas lembre-se: cada bebê se desenvolve no seu ritmo. Na dúvida, converse com o pediatra.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Crianças autistas podem falar?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Sim! Muitas crianças autistas desenvolvem a fala, algumas até tarde. Outras usam comunicação alternativa (PECS, gestos, tablets). O importante é estimular a comunicação de todas as formas.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Autismo "regride" com o tempo?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Algumas crianças podem apresentar regressão (perder habilidades já adquiridas), especialmente entre 15-30 meses. Isso não significa que o quadro vai piorar para sempre. Com intervenção adequada, muitas habilidades podem ser recuperadas.</p>
                    </div>
                </div>
            </div>

            <!-- Educação -->
            <div class="faq-category" id="educacao">
                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Como escolher a escola ideal?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Busque escolas com experiência em inclusão, equipe capacitada, adaptações curriculares e abertura para trabalhar em parceria com a família e profissionais.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Crianças autistas podem estudar em escola regular?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Sim! A inclusão é um direito garantido por lei. Muitas crianças autistas se beneficiam do ensino regular com apoio adequado (mediador, adaptações curriculares). A escola deve estar preparada para receber e incluir.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>É obrigatório ter mediador escolar?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Não é automático, mas é um direito quando necessário. A escola deve avaliar cada caso. Se a criança precisa de apoio para participar das atividades e se desenvolver, o mediador deve ser disponibilizado.</p>
                    </div>
                </div>
            </div>

            <!-- Família -->
            <div class="faq-category" id="familia">
                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Como ajudar os irmãos a entenderem?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Converse abertamente, explique de forma adequada à idade, dedique tempo individual a cada filho e incentive a empatia e compreensão.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Como lidar com o estresse familiar?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>É normal se sentir sobrecarregado. Busque apoio psicológico, conecte-se com outras famílias, organize uma rede de suporte e não se esqueça de cuidar de si mesmo. Família equilibrada = melhor suporte para a criança.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Devo contar para todos sobre o diagnóstico?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Você decide com quem compartilhar. Para pessoas próximas e profissionais que trabalham com sua criança, é importante para garantir o melhor suporte. Para outros, compartilhe conforme se sentir confortável.</p>
                    </div>
                </div>
            </div>

            <!-- Tratamento -->
            <div class="faq-category" id="tratamento">
                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Quais terapias são recomendadas?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>As principais terapias incluem fonoaudiologia, terapia ocupacional, psicologia e análise do comportamento. O plano terapêutico deve ser personalizado para cada caso.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Autismo tem cura?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Autismo não é doença, então não tem "cura". É uma forma diferente de ser. Com intervenções adequadas, a pessoa pode desenvolver habilidades, ter autonomia e qualidade de vida excelente.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Precisa de medicação?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Não há medicação específica para autismo. Alguns remédios podem ajudar com questões como ansiedade, hiperatividade ou irritabilidade. Sempre com acompanhamento médico especializado.</p>
                    </div>
                </div>
            </div>

            <!-- Sociedade -->
            <div class="faq-category" id="sociedade">
                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Como promover a inclusão?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Eduque-se sobre autismo, combata preconceitos, adapte ambientes quando necessário e promova a aceitação da neurodiversidade em todos os espaços.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Como lidar com olhares e comentários?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Ignore olhares curiosos. Para comentários inadequados, responda com informação: "Meu filho é autista, é uma condição neurológica". A educação muda mentalidades. Você não deve explicações a estranhos, mas pode escolher educar.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span class="question-icon">?</span>
                        <h3>Autistas podem trabalhar?</h3>
                    </div>
                    <div class="faq-answer">
                        <p>Absolutamente! Muitos autistas têm carreiras de sucesso, especialmente em áreas como tecnologia, ciências, artes e matemática. Alguns precisam de adaptações no ambiente de trabalho, mas contribuem imensamente para a sociedade.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
    }

    // --- Script para Acordeões de Conteúdo (Sinais, Níveis, etc.) ---
    // Permite que múltiplos itens fiquem abertos
    document.querySelectorAll('.accordion-header').forEach(header => {
        header.addEventListener('click', () => {
            const item = header.parentElement; // .accordion-item
            item.classList.toggle('active');
            
            const content = header.nextElementSibling; // .accordion-content
            if (item.classList.contains('active')) {
                // Define a altura máxima para o conteúdo se desdobrar
                content.style.maxHeight = content.scrollHeight + 'px';
            } else {
                // Remove a altura máxima para o conteúdo se dobrar
                content.style.maxHeight = null;
            }
        });
    });

    // --- Script para a Seção de FAQ ---
    // Botões de categoria
    document.querySelectorAll('.category-btn').forEach(button => {
        button.addEventListener('click', () => {
            const categoryId = button.getAttribute('data-category');
            
            document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            
            document.querySelectorAll('.faq-category').forEach(category => category.classList.remove('active'));
            document.getElementById(categoryId).classList.add('active');
        });
    });

    // Acordeão das perguntas (apenas uma aberta por vez)
    document.querySelectorAll('.faq-question').forEach(question => {
        question.addEventListener('click', () => {
            const currentItem = question.closest('.faq-item');
            const wasActive = currentItem.classList.contains('active');

            // Fecha todos os itens de FAQ antes de abrir um novo
            document.querySelectorAll('.faq-item').forEach(item => {
                item.classList.remove('active');
            });

            // Se o item clicado não estava ativo, ele se torna ativo
            if (!wasActive) {
                currentItem.classList.add('active');
            }
        });
    });
});
    </script>
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
</body>
</html>
