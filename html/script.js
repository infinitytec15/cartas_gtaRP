// script.js

// Função para criar uma carta
function createCard(value, suit) {
    const card = document.createElement('div');
    card.classList.add('card');
    card.innerHTML = `
        <div class="card-inner">
            <div class="card-front">
                <span class="card-value">${value}</span>
                <span class="card-suit">${suit}</span>
            </div>
            <div class="card-back"></div>
        </div>
    `;
    return card;
}

// Função para distribuir cartas
function dealCards(cards, container) {
    cards.forEach((card, index) => {
        const cardElement = createCard(card.value, card.suit);
        container.appendChild(cardElement);

        // Animação de distribuição
        setTimeout(() => {
            cardElement.style.transform = `translate(${index * 30}px, ${index * 10}px) rotate(${index * 5}deg)`;
        }, index * 200); // Atraso para simular a distribuição uma por uma
    });
}

// Função para virar uma carta
function flipCard(card) {
    card.classList.toggle('flipped');
}

// Função para mover uma carta
function moveCard(card, x, y) {
    card.style.transform = `translate(${x}px, ${y}px)`;
}

// Inicialização
document.addEventListener('DOMContentLoaded', () => {
    const gameContainer = document.getElementById('gameInterface');
    const deck = [
        { value: 'Ás', suit: '♥' },
        { value: '2', suit: '♦' },
        { value: '3', suit: '♣' },
        { value: '4', suit: '♠' },
        { value: '5', suit: '♥' }
    ];

    // Distribuir cartas
    dealCards(deck, gameContainer);

    // Adicionar evento de clique para virar cartas
    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        card.addEventListener('click', () => {
            flipCard(card);
        });
    });

    // Exemplo de movimento de carta
    const firstCard = cards[0];
    setTimeout(() => {
        moveCard(firstCard, 100, 50); // Move a primeira carta para uma nova posição
    }, 2000); // Atraso de 2 segundos
});