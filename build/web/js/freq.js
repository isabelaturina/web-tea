function toggleResposta(seta) {
    const resposta = seta.closest('.pergunta-container').querySelector('.resposta');
    const aberta = resposta.classList.toggle('ativa');
    seta.textContent = aberta ? '▲' : '▼';
    
  }
  