## TODO

### Geral
- [ ] Passar para um tipo de linguagem mais declarativo (tirar as setas, meter cuts).
- [ ] Criar outra função com o mesmo nome para situações em que há condições em que um dos casos tem só uma ou duas linhas.
- [ ] Usar repeat em vez de chamadas recursivas?
- [ ] Organizar a ordem das funções.
- [ ] Comentar o código.
- [ ] Relatório.

#### Visualização
- [ ] Fazer um melhor display do tabuleiro e menus (talvez passar para SWI? com emojis a fazer de números, por exemplo)

#### Menus
- [ ] Acrescentar Computer-vs-Player aos menus.

#### Verificação de Inputs
- [x] Verificar input de escolhas numéricas com get_char e peek_char, para se o user meter 1.1 não dar, em vez de ler 1.1 como 1(ver se a seguir ao primeiro char vem newline).
- [x] Verificar input das colunas (1 - 9) com get_char.
- [x] Testar melhor inputs errados nas coordenadas de peças, por vezes levam a não aceitação futura de coordenadas corretas.
- [x] Erro nestes passos: criar em E5, criar em E6, mover de E6 / mover de E5 para F6 / mover de E5 para F4.
- [x] Erro no check_cell_choice quando recebe Player=0.
- [x] Criar um ficheiro separado para os inputs.

#### Tipos de Jogo
- [ ] Player VS Player.
- [ ] Player VS Computador.
- [ ] Computador VS Computador.

#### Lógica de Jogo
- [ ] Fazer condição de empate.
- [ ] Fazer função para lista de movimentos válidos de uma peça.
- [ ] Fazer função para lista de jogadas possíveis/válidas.
- [ ] Apresentar mensagem se o jogador não tiver peças para mover.
- [ ] Apresentar o número certo de colunas possíveis para cada linha escolhida.

### Computer
- [ ] Fazer função de avaliação do tabuleiro.
- [ ] Fazer função de avaliação de uma jogada, através da avaliação do estado do tabuleiro se essa jogada for escolhida.
- [ ] Fazer função de escolha da jogada do computador, dependendo do nível de dificuldade.
