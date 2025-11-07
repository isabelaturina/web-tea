async function carregarNoticias() {
    try {
      const resposta = await fetch("http://localhost:8080/api/noticias");
      const noticias = await resposta.json();
  
      const container = document.getElementById("noticias-container");
      container.innerHTML = "";
  
      noticias.forEach(noticia => {
        const card = document.createElement("div");
        card.className = "noticia-card";
        card.innerHTML = `
          <img src="${noticia.imagem || ''}" alt="Imagem da notícia" style="width:100%; max-height:200px; object-fit:cover;">
          <h2>${noticia.titulo}</h2>
          <p>${noticia.descricao}</p>
          <a href="${noticia.link}" target="_blank">Ler mais</a>
          <small>${new Date(noticia.dataPublicacao).toLocaleDateString("pt-BR")}</small>
        `;
        container.appendChild(card);
      });
    } catch (erro) {
      console.error("Erro ao carregar notícias:", erro);
    }
  }
  
  window.onload = carregarNoticias;
  