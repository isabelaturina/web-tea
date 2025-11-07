<html lang="pt-BR">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Curiosidades</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/curio.css" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
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


     <nav class="primeira">
      <h1>Curiosidades Sobre o <span>autismo</span></h1>
      <p>
        Informações e fatos que ajudam a entender melhor o espectro autista e
        celebrar suas singularidades.
      </p>
      <div class="circulo"></div>
      <div class="circulo2"></div>
    </nav>

    <div class="cards-container">
      <div class="quadrado">
        <img src="icon/hiperfoco.png" class="hiperfoco" alt="Ícone de hiperfoco" />
        <div class="text-content">
          <h2 class="hiperfoco2">Hiperfoco</h2>
          <p class="txthiperfoco">
            Estado de concentração extrema e intensa em um interesse ou atividade
            específica, comum em pessoas autistas.
          </p>
        </div>
      </div>

      <div class="quadrado2">
        <img src="icon/sensibilidade.png" class="sensibilidade" alt="Ícone de sensibilidade sensorial" />
        <div class="text-content">
          <h2 class="sensibilidade2">Sensibilidade sensorial</h2>
          <p class="txtsensibilidade">
            Pessoas autistas costumam ter o sistema sensorial diferente, percebendo
            estímulos (som, luz, toque, cheiro, gosto, etc.) de forma mais 
            intensa (hipersensibilidade) ou menos intensa (hipossensibilidade) que o
            habitual.
          </p>
        </div>
      </div>

      <div class="quadrado3">
        <img src="icon/pessoas.png" class="pessoas" alt="Ícone de estatística" />
        <div class="text-content">
          <h2 class="pessoas2">1 em cada 36 crianças</h2>
          <p class="txtpessoas">
            Esse número mostra que o autismo é muito mais comum do que se pensava no
            passado. Os diagnósticos aumentaram bastante nas últimas décadas
          </p>
        </div>
      </div>

      <div class="quadrado4">
        <img src="icon/simbolotea.png" class="simbolo" alt="Símbolo do autismo" />
        <div class="text-content">
          <h2 class="simbolo2">símbolo do autismo</h2>
          <p class="txtsimbolo">
            Diversidade, identidade, inclusão, respeito. Cada cor e forma representa
            a variedade de características, habilidades e desafios de cada pessoa
            autista.
          </p>
        </div>
      </div>
    </div>

    <div class="famosos">
      <h3>Famosos que <span>possuem </span> o aspecto <span>Autista</span></h3>
      <p>Personalidades conhecidas mundialmente que estão no espectro autista e mostram que o autismo não é uma limitação, mas uma forma única de ver o mundo</p>
      <div class="galeria-famosos">
        <div class="famoso-item card-blue">
          <div class="img-container">
            <img src="icon/anthony.png" alt="Anthony Hopkins" class="foto-famoso" />
          </div>
          <h4>Anthony Hopkins</h4>
          <span class="tag">Ator britânico</span>
          <p class="descricao">
            Vencedor do Oscar de melhor ator, diagnosticado com síndrome de Asperger em 2014. Sua mente científica e sua intensa concentração são características que o ajudaram a se tornar um dos maiores atores de todos os tempos.
          </p>
        </div>
        <div class="famoso-item card-green">
          <div class="img-container">
            <img src="icon/greta thunberg.jpg" alt="Greta Thunberg" class="foto-famoso" />
          </div>
          <h4>Greta Thunberg</h4>
          <span class="tag">Ativista ambiental</span>
          <p class="descricao">
            Tornou-se a inspiradora voz do ativismo em prol do meio ambiente. A jovem sueca vê seu autismo como um "superpoder" que a ajuda a ver as mudanças climáticas.
          </p>
        </div>
        <div class="famoso-item card-purple">
          <div class="img-container">
            <img src="icon/leticia sabatella.png" alt="Leticia Sabatella" class="foto-famoso" />
          </div>
          <h4>Leticia Sabatella</h4>
          <span class="tag">Atriz brasileira</span>
          <p class="descricao">
            Em entrevista, compartilhou que só recebeu o diagnóstico aos 48 anos. A atriz vê o autismo como uma característica que a ajuda a ter uma visão única da sociedade e interações artísticas.
          </p>
        </div>
        <div class="famoso-item card-pink">
          <div class="img-container">
            <img src="icon/cantora-sia 1.png" alt="Sia" class="foto-famoso" />
          </div>
          <h4>Sia</h4>
          <span class="tag">Cantora compositora</span>
          <p class="descricao">
            Recebeu em 2021 seu diagnóstico com síndrome de Asperger. A artista australiana vê sua neurodivergência como parte fundamental de sua expressão artística e criatividade musical.
          </p>
        </div>
        <div class="famoso-item card-blue">
          <div class="img-container">
            <img src="icon/albert.png" alt="Albert Einstein" class="foto-famoso" />
          </div>
          <h4>Albert Einstein</h4>
          <span class="tag">Físico teórico</span>
          <p class="descricao">
            É hoje um dos físicos mais renomados de todos os tempos. Estudos posteriores sugerem que ele apresentava características do espectro autista, como dificuldades de comunicação.
          </p>
        </div>
        <div class="famoso-item card-green">
          <div class="img-container">
            <img src="icon/elon musk.png" alt="Elon Musk" class="foto-famoso" />
          </div>
          <h4>Elon Musk</h4>
          <span class="tag">Empresário inovador</span>
          <p class="descricao">
            CEO da Tesla e SpaceX, revelou publicamente em um programa de TV que tem síndrome de Asperger. Sua mente única o ajuda a pensar de forma diferente e inovar.
          </p>
        </div>
      </div>
      <div class="mensagem-final">
        <p>Esses exemplos mostram que o autismo pode ser um exemplo de força e inovação</p>
      </div>
    </div>
 <section class="fatos-importantes">
      <h2>Fatos <span>importantes</span> sobre o <span>autismo</span></h2>
      <p class="subtitulo">Informações essenciais que todo responsável deve conhecer sobre o autismo</p>
      
      <div class="fatos-grid">
        <div class="fato-card">
          <span class="numero">1</span>
          <p>Pessoas autistas possuem seu próprio ritmo para aprender e se expressar</p>
        </div>
        <div class="fato-card">
          <span class="numero">2</span>
          <p>O autismo afeta pessoas de todos os grupos étnicos e socioeconômicos</p>
        </div>
        <div class="fato-card">
          <span class="numero">3</span>
          <p>Cada pessoa autista é única, com suas próprias forças e desafios</p>
        </div>
        <div class="fato-card">
          <span class="numero">4</span>
          <p>Muitas pessoas autistas são altamente criativas e inovadoras</p>
        </div>
        <div class="fato-card">
          <span class="numero">5</span>
          <p>O diagnóstico precoce pode fazer uma grande diferença no desenvolvimento</p>
        </div>
        <div class="fato-card">
          <span class="numero">6</span>
          <p>Terapias personalizadas são mais efetivas que abordagens genéricas</p>
        </div>
      </div>
    </section>

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
        
      </div>
    </footer>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
          const menuToggle = document.querySelector('.menu-toggle');
          const mainNav = document.querySelector('.main-nav');

          if (menuToggle && mainNav) {
              menuToggle.addEventListener('click', function() {
                  menuToggle.classList.toggle('active');
                  mainNav.classList.toggle('active');
              });
          }
      });
    </script>
  </body>
</html>
