<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>TEA+</title>
  <link href="css/style.css" rel="stylesheet" type="text/css"/>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet"/>
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
            <a href="noticias-protegido.jsp">Notícias</a>
            <a href="clinicas-protegido.jsp">Clínicas</a>
            <a href="chat-protegido.jsp">Chat Bea</a>
                     
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

  <section class="hero">
    <div class="hero-texto">
      <h1>O autismo é parte deste mundo<br>não um <span class="destaque">mundo</span> a parte dele</h1>
      <p>Conhecer é o primeiro passo para acolher!</p>
    </div>
    <div class="hero-imagem">
    <img src="icon/hero.png"  alt="Ilustração de mãe e filho" />
      
    </div>
  </section>

  <!-- Explore nossos recursos -->
  <section id="explore" class="explore-recursos">
    <h2>Explore Nossos Recursos</h2>
    <p class="subtitulo">ferramentas e informações essenciais para apoiar sua jornada</p>
    
   <div class="cards-grid">
            <a href="curio.jsp" class="card-recurso">
                <div class="icone">
                    <img src="icon/curiosidades.png" alt=""/>
                </div>
                <h3>Curiosidades</h3>
                <p>Descubra fatos interessantes e informações importantes sobre o espectro autista</p>
            </a>

          <a href="direitoseleis.jsp" class="card-recurso">
                <div class="icone">
                    <img src="icon/direitoseleis.png" alt=""/>
                </div>
                <h3>Direitos e leis</h3>
                <p>Conheça os direitos garantidos por lei para pessoas com autismo e suas famílias</p>
            </a>

             <a href="entendendo-autismo.jsp" class="card-recurso">
                <div class="icone">
                    <img src="icon/noticias.png" alt=""/>
                </div>
                <h3>Entendendo</h3>
                <p>Entendo o por que cada pessoa/criança autista age de uma forma</p>
            </a>

            <a href="diagnostico.jsp" class="card-recurso">
                <div class="icone">
                    <img src="icon/clinicasprox.png" alt=""/>
                </div>
                <h3>Diagnosticos</h3>
                <p>Reconhecer os sinais precocemente pode fazer toda a diferença no desenvolvimento da criança. Aqui você encontrará 
                    informações baseadas em evidências científicas.</p>
            </a>
        </div>
    </section>
  
  </section>

  <!-- Quem somos nós --> 
  <section class="quem-somos">
    <div class="quem-somos-texto">
      <h2>Quem somos nós?</h2>
      <p class="descricao">Nossas ideias e o objetivos desse projeto tão especial</p>
      <p class="texto-principal">Acreditamos que cada pessoa é única e especial, e que o autismo não define ninguém. Na TEA+, celebramos a neurodiversidade e trabalhamos para construir um mundo mais inclusivo e acolhedor para pessoas com Transtorno do Espectro Autista (TEA). Promovemos a inclusão, oferecemos suporte a famílias e profissionais, celebramos a neurodiversidade e combatemos o preconceito, buscando construir um mundo onde todas as pessoas, independentemente de suas diferenças, tenham a oportunidade de viver uma vida plena e feliz.</p>
      
      <div class="valores-icones">
        <div class="valor-item">
          <img src="icon/conhecimento.png" alt="Ícone de conhecimento" />
          <h3>Conhecimento<h3>
        </div>
        <div class="valor-item">
          <img src="icon/escudo.png" alt="Ícone de proteção" />
          <h3>Proteção</h3>
        </div>
        <div class="valor-item">
          <img src="icon/mente.png" alt="Ícone de conhecimento global" />
          <h3>Mente</h3>
        </div>
      </div>
    </div>


    <div class="nossos-valores">
      <h3>Nossos Valores</h3>
      <ul>
        <li>Inclusão e acessibilidade para todos</li>
        <li>informações baseadas em evidências</li>
        <li>Suporte contínuo às famílias</li>
        <li>celebração da neurodiversidade</li>
      </ul>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <div class="footer-content">
      <div class="footer-section">
        <div class="logo-footer">
           <img src="icon/logo.png" alt="Logo TEA+" />
           
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
    </div>
  </footer>

  <script>
    document.querySelector('.menu-toggle').addEventListener('click', function() {
      this.classList.toggle('active');
      document.querySelector('nav').classList.toggle('active');
    });

    // Fecha o menu ao clicar em um link
    document.querySelectorAll('nav a').forEach(link => {
      link.addEventListener('click', () => {
        document.querySelector('.menu-toggle').classList.remove('active');
        document.querySelector('nav').classList.remove('active');
      });
    });
  </script>

  
</body>
</html> 