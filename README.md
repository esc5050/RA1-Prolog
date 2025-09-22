# Sistema Especialista para Recomendação de Trilha Acadêmica

**Instituição:** PUCPR

**Disciplina:** Programação Lógica e Funcional

**Professor:** Frank Coelho de Alcantara

**Alunos:**
- Aluno 1 - `Julia Machado Kociolek`
- Aluno 2 - `Antonio Bernardo Zilio Tomasi`
- Aluno 3 - `Gustavo Lona Grespan`

## Estrutura do Projeto

O sistema é modular e está organizado nos seguintes arquivos:

* `interface_puc.pl`: Ponto de entrada principal da aplicação. Controla o fluxo de execução, a interface com o usuário e carrega os outros módulos.
* `base_conhecimento_puc.pl`: Contém todos os fatos do sistema. Define as trilhas de especialização, as características de perfil com seus respectivos pesos e as perguntas que mapeiam os interesses do usuário.
* `motor_inferencia_puc.pl`: Contém as regras e a lógica principal do sistema. É responsável por calcular a pontuação de compatibilidade de um aluno para cada trilha com base nas respostas fornecidas.
* `testes_puc.pl`: Contém um predicado auxiliar para a execução de testes automatizados.
* `perfil_teste_puc_*.pl`: Arquivos com conjuntos predefinidos de respostas que simulam diferentes perfis de alunos para validar a lógica do sistema.

## Pré-requisitos

Para executar este projeto, é necessário ter o **SWI-Prolog** instalado.

## Como Executar

Certifique-se de que todos os arquivos `.pl` estejam no mesmo diretório.

### Modo Interativo

Este modo executa o sistema fazendo as perguntas diretamente ao usuário.

1.  Abra o SWI-Prolog.
2.  Carregue o programa principal utilizando o menu **File -> Consult...** e selecionando o arquivo `interface_puc.pl`.
3.  No console do Prolog, que aparecerá com `?-`, digite o seguinte comando e pressione Enter:
    ```prolog
    iniciar.
    ```
4.  Responda às perguntas com `s` (sim) ou `n` (não). Ao final, o ranking de trilhas recomendadas será exibido.

### Modo de Teste

Este modo executa o sistema utilizando um dos perfis de teste pré-definidos, sem a necessidade de entrada manual.

1.  Primeiro, carregue o sistema principal seguindo os passos 1 e 2 do Modo Interativo (consultando `interface_puc.pl`).
2.  Em seguida, carregue o módulo de testes. No console, digite:
    ```prolog
    consult('testes_puc.pl').
    ```
3.  Agora, execute um dos testes chamando o predicado `teste/1` com o nome do arquivo de perfil desejado:

    * **Para o perfil 1:**
        ```prolog
        teste('perfil_teste_puc_1.pl').
        ```
    * **Para o perfil 2:**
        ```prolog
        teste('perfil_teste_puc_2.pl').
        ```
    * **Para o perfil 3:**
        ```prolog
        teste('perfil_teste_puc_3.pl').
        ```
O resultado será exibido diretamente no console.
