## TODO

### Geral
- [ ] Passar para um tipo de linguagem mais declarativo (tirar as setas, meter cuts).
- [ ] Criar outra fun��o com o mesmo nome para situa��es em que h� condi��es em que um dos casos tem s� uma ou duas linhas.
- [ ] Usar repeat em vez de chamadas recursivas?
- [ ] Organizar a ordem das fun��es.
- [ ] Comentar o c�digo.
- [ ] Relat�rio.

#### Visualiza��o
- [ ] Fazer um melhor display do tabuleiro e menus (talvez passar para SWI? com emojis a fazer de n�meros, por exemplo)

#### Menus
- [ ] Acrescentar Computer-vs-Player aos menus.

#### Verifica��o de Inputs
- [x] Verificar input de escolhas num�ricas com get_char e peek_char, para se o user meter 1.1 n�o dar, em vez de ler 1.1 como 1(ver se a seguir ao primeiro char vem newline).
- [x] Verificar input das colunas (1 - 9) com get_char.
- [x] Testar melhor inputs errados nas coordenadas de pe�as, por vezes levam a n�o aceita��o futura de coordenadas corretas.
- [x] Erro nestes passos: criar em E5, criar em E6, mover de E6 / mover de E5 para F6 / mover de E5 para F4.
- [x] Erro no check_cell_choice quando recebe Player=0.
- [x] Criar um ficheiro separado para os inputs.

#### Tipos de Jogo
- [ ] Player VS Player.
- [ ] Player VS Computador.
- [ ] Computador VS Computador.

#### L�gica de Jogo
- [ ] Fazer condi��o de empate.
- [ ] Fazer fun��o para lista de movimentos v�lidos de uma pe�a.
- [ ] Fazer fun��o para lista de jogadas poss�veis/v�lidas.
- [ ] Apresentar mensagem se o jogador n�o tiver pe�as para mover.
- [ ] Apresentar o n�mero certo de colunas poss�veis para cada linha escolhida.

### Computer
- [ ] Fazer fun��o de avalia��o do tabuleiro.
- [ ] Fazer fun��o de avalia��o de uma jogada, atrav�s da avalia��o do estado do tabuleiro se essa jogada for escolhida.
- [ ] Fazer fun��o de escolha da jogada do computador, dependendo do n�vel de dificuldade.
