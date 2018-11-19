## TODO

### Geral
- [x] Passar para um tipo de linguagem mais declarativo (tirar as setas, meter cuts).
- [ ] Criar outra fun��o com o mesmo nome para situa��es em que h� condi��es em que um dos casos tem s� uma ou duas linhas.
- [ ] Usar repeat em vez de chamadas recursivas?
- [ ] Organizar a ordem das fun��es.
- [ ] Comentar o c�digo.
- [ ] Relat�rio.
- [x] Ficheiro separado para fun��es auxiliares de matrizes.

#### Visualiza��o
- [ ] Fazer um melhor display do tabuleiro e menus (talvez passar para SWI? com emojis a fazer de n�meros, por exemplo)

#### Menus
- [x] Acrescentar Computer-vs-Player aos menus.

#### Verifica��o de Inputs
- [x] Verificar input de escolhas num�ricas com get_char e peek_char, para se o user meter 1.1 n�o dar, em vez de ler 1.1 como 1(ver se a seguir ao primeiro char vem newline).
- [x] Verificar input das colunas (1 - 9) com get_char.
- [x] Testar melhor inputs errados nas coordenadas de pe�as, por vezes levam a n�o aceita��o futura de coordenadas corretas.
- [x] Erro nestes passos: criar em E5, criar em E6, mover de E6 / mover de E5 para F6 / mover de E5 para F4.
- [x] Erro no check_cell_choice quando recebe Player=0.
- [x] Criar um ficheiro separado para os inputs.

#### Tipos de Jogo
- [x] Player VS Player.
- [x] Player VS Computador.
- [x] Computador VS Computador.

#### L�gica de Jogo
- [x] Fazer condi��o de empate.
- [x] Fazer fun��o para lista de movimentos v�lidos de uma pe�a.
- [x] Fazer fun��o para lista de jogadas poss�veis/v�lidas.
- [x] Apresentar mensagem se o jogador n�o tiver pe�as para mover.
- [ ] Apresentar o n�mero certo de colunas poss�veis para cada linha escolhida.
- [ ] Usar between e findall no has_pieces_surrounded.
- [x] Condi��o de termina��o n�o funciona com move.

### Computer
- [x] Bot n�o est� a gerar todos os moves, s� faz movimentos para a primeira ocorr�ncia.
- [x] Bot nem sempre faz bem os values das jogadas.
- [x] Fazer fun��o de avalia��o do tabuleiro.
- [ ] Fazer uma melhor fun��o de avalia��o do tabuleiro, meter o bot menos ofensivo, dar value a jogadas que reduzam o seu min_empty_surr_cells
       (IDEIA: Comparar o value de uma jogada defensiva, geralmente um move, com uma ofensiva, fazer a de maior valor).
- [x] Fazer fun��o de avalia��o de uma jogada, atrav�s da avalia��o do estado do tabuleiro se essa jogada for escolhida.
- [x] Fazer fun��o de escolha da jogada do computador, dependendo do n�vel de dificuldade.
- [ ] Pensar nos casos em que jogar na primeira ocorr�ncia tem o mesmo min_empty_surr_cells de jogar junto a outra pe�a, mas neste �ltimo reduz-se o segundo menor empty_surr_cells.
