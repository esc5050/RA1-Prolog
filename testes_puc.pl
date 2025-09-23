% Executa um teste carregando um perfil específico
teste(ArquivoPerfil) :-
    retractall(resposta(_, _)),  % limpa respostas anteriores
    consult(ArquivoPerfil),      % carrega respostas predefinidas
    recomenda(Ordenado),
    writeln('--- Resultado do Teste ---'),
    exibe_resultado(Ordenado).
