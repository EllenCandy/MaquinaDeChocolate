## Máquina de estados de Moore
_Ellen Brzozoski e Roberto Ferreira_

### 1. problema
Construir um controlador de máquina de vender chocolate utilizando a ideia da
Máquina de Estado de Moore
- cada chocolate custa R$1,00
- sao aceitas apenas moedas de R$0,25 e R$ 0,50 (uma de cada vez)
- caso passe de R$1,00 devolve todas as moedas

### 2. estrutura
Primeiramente, foi utilizado o Flip Flop Tipo D para o registrador com 3 bits de carga
com objetivo de armazenar o valor inserido na máquina.
Em segundo lugar, foi montada uma função de próximo estado, que funciona
detectando o estado que a máquina deverá obter com a inserção das moedas.

Entradas:
<br/>
ea = estado atual
<br/>
m_25 = moeda de 25 centavos
<br/>
m_50 = moeda de 50 centavos

Saída:
<br/>
pe = próximo estado


(terminar...)
