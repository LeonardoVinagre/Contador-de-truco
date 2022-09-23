# Contexto

Para a avaliação de Desenvolvimento de aplicativos Mobile foi atribuida a criação de um marcador de truco ou um jogo da velho, foi escolhido pela dupla então o projeto do marcador de truco
Projeto realizado por:
### Douglas Sturion 202010264
### Leonardo Vinagre 202010277

## Objetivo

O objetivo do marcador é realizar a contagem dos pontos de uma partida de truco, com botão que acrescenta os tentos de forma automática, aumentando a quantidade de acordo com as chamadas de truco, o aplicativo também pode subtrair os pontos em caso de engano, além disso, apresenta alguns pop-ups informativos, como o fim da partida ou uma chamada incorreta de truco na mão de 11!
Os pontos também podem ser modificados clicando no valor desejado, afinal a exibição do placar é feito com o uso de botões Radio.
![Preview do app](https://user-images.githubusercontent.com/66652899/191983715-4a31fc9e-a394-48e2-a46f-ffc038fbb0c3.png)
![Erro de mão de onze](https://user-images.githubusercontent.com/66652899/191984181-6a87bd86-f60d-4e67-910a-c3c4766127cb.png)
![Fim da partida](https://user-images.githubusercontent.com/66652899/191984234-b123b2a3-8932-42a0-977f-05f243411df7.png)


## Funções

#### removeScore: Função de remoção de pontos
#### newRound: Nova rodada da mesma partida o contador de truco é zerado
#### checkScore: Verifica algum vencedor
#### winningMessage: Mensagem para o vencedor da partida
#### newGame: Quando alguem vencer o jogo é resetado
#### elevenPointsError: Erro de chamar truco na mão de onze
#### maxPointError: Erro de chamar truco alem de 12 pontos
#### score: Função de pontuação da rodada
#### conter: Retorna o Widget contendo os Radio buttons referente ao time

## Iniciando
flutter pub get


