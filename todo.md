## TODO

### Geral
- [x] Passar para um tipo de linguagem mais declarativo (tirar as setas, meter cuts).
- [ ] Criar outra função com o mesmo nome para situações em que há condições em que um dos casos tem só uma ou duas linhas.
- [ ] Usar repeat em vez de chamadas recursivas?
- [ ] Organizar a ordem das funções.
- [ ] Comentar o código.
- [ ] Relatório.
- [x] Ficheiro separado para funções auxiliares de matrizes.

#### Visualização
- [ ] Fazer um melhor display do tabuleiro e menus (talvez passar para SWI? com emojis a fazer de números, por exemplo)

#### Menus
- [x] Acrescentar Computer-vs-Player aos menus.

#### Verificação de Inputs
- [x] Verificar input de escolhas numéricas com get_char e peek_char, para se o user meter 1.1 não dar, em vez de ler 1.1 como 1(ver se a seguir ao primeiro char vem newline).
- [x] Verificar input das colunas (1 - 9) com get_char.
- [x] Testar melhor inputs errados nas coordenadas de peças, por vezes levam a não aceitação futura de coordenadas corretas.
- [x] Erro nestes passos: criar em E5, criar em E6, mover de E6 / mover de E5 para F6 / mover de E5 para F4.
- [x] Erro no check_cell_choice quando recebe Player=0.
- [x] Criar um ficheiro separado para os inputs.

#### Tipos de Jogo
- [x] Player VS Player.
- [x] Player VS Computador.
- [x] Computador VS Computador.

#### Lógica de Jogo
- [x] Fazer condição de empate.
- [x] Fazer função para lista de movimentos válidos de uma peça.
- [x] Fazer função para lista de jogadas possíveis/válidas.
- [x] Apresentar mensagem se o jogador não tiver peças para mover.
- [ ] Apresentar o número certo de colunas possíveis para cada linha escolhida.
- [ ] Usar between e findall no has_pieces_surrounded.
- [x] Condição de terminação não funciona com move.

### Computer
- [x] Bot não está a gerar todos os moves, só faz movimentos para a primeira ocorrência.
- [x] Bot nem sempre faz bem os values das jogadas.
- [x] Fazer função de avaliação do tabuleiro.
- [ ] Fazer uma melhor função de avaliação do tabuleiro, meter o bot menos ofensivo, dar value a jogadas que reduzam o seu min_empty_surr_cells
       (IDEIA: Comparar o value de uma jogada defensiva, geralmente um move, com uma ofensiva, fazer a de maior valor).
- [x] Fazer função de avaliação de uma jogada, através da avaliação do estado do tabuleiro se essa jogada for escolhida.
- [x] Fazer função de escolha da jogada do computador, dependendo do nível de dificuldade.
- [ ] Pensar nos casos em que jogar na primeira ocorrência tem o mesmo min_empty_surr_cells de jogar junto a outra peça, mas neste último reduz-se o segundo menor empty_surr_cells.
