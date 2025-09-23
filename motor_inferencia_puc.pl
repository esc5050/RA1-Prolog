% motor_inferencia.pl
% Motor de inferência (Aluno 2)
% Requer: base_conhecimento.pl carregado (trilha/2, perfil/3, pergunta/3).
% As respostas do usuário devem estar como fatos dinâmicos:
%   resposta(ID, s).  % sim
%   resposta(ID, n).  % não
%
% Este arquivo fornece:
%   - calcula_pontuacao(+Trilha, -Score, -Justificativas)
%   - calcula_todas_pontuacoes(-ListaTrilhaScoreJust)
%   - recomenda(-ListaOrdenada)            % todas as trilhas ordenadas desc.
%   - recomenda(+N, -TopN)                 % top N trilhas
%   - melhores_trilhas(-ListaMaxima)       % trilhas com pontuação máxima
%
% Declare resposta/2 dinâmico para que o Aluno 3 ou arquivos de teste possam assertz/retract.
:- dynamic resposta/2.

% -------------------------
% calcula_pontuacao/3
% Score: soma dos pesos de atributos da trilha que tiveram resposta 's' em pelo menos uma pergunta.
% Justificativas: lista de just( Atributo, Peso, PerguntasRespondidasTextos ).
% -------------------------
calcula_pontuacao(Trilha, Score, Justificativas) :-
    % Para cada perfil(Trilha, Atributo, Peso) verificar se há ao menos uma pergunta mapeando para Atributo com resposta s
    findall(Atr-Peso-QIDs-Texts,
        ( perfil(Trilha, Atr, Peso),
          % coletar todas as perguntas que mapeiam para Atr e que receberam resposta 's'
          findall(QID, (pergunta(QID, _, Atr), resposta(QID, s)), QIDs),
          QIDs \= [],                                      % só interesse quando houver ao menos uma resposta s
          % buscar os textos correspondentes às perguntas afirmativas (para justificativa)
          findall(Text, (member(Id, QIDs), pergunta(Id, Text, Atr)), Texts)
        ),
        Matches),
    % Extrair pesos e somar
    findall(P, member(_Atr-P-_-_, Matches), Pesos),
    sum_list(Pesos, Score),
    % Formatamos justificativas em forma mais legível
    build_justificativas(Matches, Justificativas).

% Se não houver matches -> Score 0 e lista vazia
calcula_pontuacao(Trilha, 0, []) :-
    % existe trilha mas não há nenhum atributo com perguntas respondidas 's'
    trilha(Trilha, _Desc),
    \+ ( perfil(Trilha, Atr0, _P0), pergunta(Q0, _, Atr0), resposta(Q0, s) ).

% -------------------------
% build_justificativas/2 - helper
% -------------------------
build_justificativas([], []).
build_justificativas([Atr-Peso-QIDs-Texts | Tail], [just(Atr, Peso, QIDs, Texts) | Rest]) :-
    build_justificativas(Tail, Rest).

% -------------------------
% calcula_todas_pontuacoes(-Lista)
% Lista = [trilha(Trilha, Score, Justificativas), ...]
% -------------------------
calcula_todas_pontuacoes(Lista) :-
    findall(trilha(T, S, J),
        ( trilha(T, _Desc), calcula_pontuacao(T, S, J) ),
        Lista).

% -------------------------
% ordena_trilhas_desc(+ListaIn, -ListaOut)
% ListaIn elements: trilha(Trilha, Score, Just)
% ListaOut sorted by Score descending
% -------------------------
ordena_trilhas_desc(ListIn, ListOut) :-
    predsort(compare_trilha_score, ListIn, ListOut).

compare_trilha_score(Delta, trilha(T1, S1, J1), trilha(T2, S2, J2)) :-
    ( S1 > S2 -> Delta = '<'
    ; S1 < S2 -> Delta = '>'
    ; Delta = '=' ).

% -------------------------
% recomenda(-ListaOrdenada)
% Retorna todas as trilhas ordenadas por compatibilidade (maior->menor).
% -------------------------
recomenda(ListaOrdenada) :-
    calcula_todas_pontuacoes(Lista),
    ordena_trilhas_desc(Lista, ListaOrdenada).

% -------------------------
% recomenda(+N, -TopN)
% Retorna apenas as N primeiras recomendações (ou menos, se houver menos trilhas)
% -------------------------
recomenda(N, TopN) :-
    integer(N), N > 0,
    recomenda(ListaOrdenada),
    take(N, ListaOrdenada, TopN).

% -------------------------
% melhores_trilhas(-Melhores)
% Retorna trilhas com a maior pontuação (pode haver empate)
% Cada elemento: trilha(Trilha, Score, Just)
% -------------------------
melhores_trilhas(Melhores) :-
    calcula_todas_pontuacoes(Lista),
    % encontrar maior Score
    findall(S, member(trilha(_, S, _), Lista), Scores),
    ( Scores = [] -> Max = 0 ; max_list(Scores, Max) ),
    % selecionar trilhas que têm Score = Max
    include(has_score(Max), Lista, Melhores).

has_score(Max, trilha(_, S, _)) :- S =:= Max.

% -------------------------
% Utilitários
% -------------------------
sum_list(List, Sum) :- sum_list(List, 0, Sum).
sum_list([], Acc, Acc).
sum_list([H|T], Acc, Sum) :- Acc1 is Acc + H, sum_list(T, Acc1, Sum).

% take(N, List, Prefix)
take(0, _List, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|Rest]) :-
    N1 is N - 1,
    take(N1, T, Rest).


