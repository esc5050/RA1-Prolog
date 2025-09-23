% base_conhecimento.pl
% Fatos:
%   trilha(NomeAtom, 'Descrição textual').
%   perfil(TrilhaAtom, AtributoAtom, Peso). % Peso: 1 (baixa) .. 5 (alta)
%   pergunta(ID, 'Texto da pergunta?', AtributoAtom).
%
% Salve e use: consult('base_conhecimento.pl').

% -------------------------
% Trilhas (6 novas)
% -------------------------
trilha(engenharia_de_software, 'Engenharia de Software: arquitetura, processos de engenharia e qualidade de software.').
trilha(automacao_embarcada, 'Automação Embarcada: desenvolvimento para microcontroladores e sistemas embarcados.').
trilha(computacao_grafica, 'Computação Gráfica e Visualização: modelagem 3D, shaders e renderização interativa.').
trilha(bioinformatica, 'Bioinformática: análise computacional de sequências biológicas e dados omicos.').
trilha(internet_das_coisas, 'Internet das Coisas (IoT): sensores, conectividade e aplicações distribuídas embarcadas.').
trilha(engenharia_de_qualidade, 'Engenharia de Qualidade de Software: testes automatizados, CI/CD e métricas de qualidade.').

% -------------------------
% Perfis / Atributos por trilha com pesos (1..5)
% -------------------------
% Engenharia de Software
perfil(engenharia_de_software, arquitetura_software, 5).
perfil(engenharia_de_software, metodos_agile, 4).
perfil(engenharia_de_software, teste_automatizado, 4).
perfil(engenharia_de_software, modelagem_uml, 3).
perfil(engenharia_de_software, engenharia_requisitos, 4).

% Automação Embarcada
perfil(automacao_embarcada, microcontroladores, 5).
perfil(automacao_embarcada, linguagem_c_embarcada, 5).
perfil(automacao_embarcada, sensores_e_atuadores, 4).
perfil(automacao_embarcada, otimizacao_tempo_real, 4).
perfil(automacao_embarcada, eletronica_basica, 3).

% Computação Gráfica
perfil(computacao_grafica, matematica_geometrica, 5).
perfil(computacao_grafica, shaders_programacao, 4).
perfil(computacao_grafica, modelagem_3d, 4).
perfil(computacao_grafica, processamento_imagem, 3).
perfil(computacao_grafica, desempenho_gpus, 3).

% Bioinformática
perfil(bioinformatica, biologia_molecular, 5).
perfil(bioinformatica, analise_sequencias, 5).
perfil(bioinformatica, estatistica_aplicada, 4).
perfil(bioinformatica, python_para_bioinfo, 4).
perfil(bioinformatica, bancos_de_dados_biologicos, 3).

% Internet das Coisas (IoT)
perfil(internet_das_coisas, protocolos_comunicacao, 5).
perfil(internet_das_coisas, conectividade_sem_fio, 4).
perfil(internet_das_coisas, plataformas_cloud, 3).
perfil(internet_das_coisas, seguranca_embarcada, 4).
perfil(internet_das_coisas, prototipagem_rapida, 3).

% Engenharia de Qualidade
perfil(engenharia_de_qualidade, teste_automatizado, 5).
perfil(engenharia_de_qualidade, ci_cd, 5).
perfil(engenharia_de_qualidade, metricas_qualidade, 4).
perfil(engenharia_de_qualidade, revisao_codigo, 4).
perfil(engenharia_de_qualidade, ferramentas_integracao, 4).

% -------------------------
% Perguntas (mapeamento pergunta(ID, 'Texto?', atributo))
% Respostas esperadas: s (sim) / n (não) no sistema principal.
% -------------------------
pergunta(1,  'Você já programou diretamente em C para dispositivos pequenos (microcontroladores)?', linguagem_c_embarcada).
pergunta(2,  'Tem interesse em arquitetura de software e boas práticas de engenharia?', arquitetura_software).
pergunta(3,  'Gosta de trabalhar com modelagem 3D, animação ou efeitos visuais?', modelagem_3d).
pergunta(4,  'Tem conhecimento básico de eletrônica (resistores, sensores, atuadores)?', eletronica_basica).
pergunta(5,  'Se interessa por analisar sequências biológicas (DNA/RNA) ou dados experimentais?', analise_sequencias).
pergunta(6,  'Costuma usar ou quer aprender testes automatizados e frameworks de teste?', teste_automatizado).
pergunta(7,  'Tem afinidade com matemática aplicada à geometria e álgebra linear?', matematica_geometrica).
pergunta(8,  'Já trabalhou com plataformas em nuvem (deploy, armazenamento, IoT hub)?', plataformas_cloud).
pergunta(9,  'Se interessa por otimização de desempenho em hardware (ex.: microcontrollers ou GPUs)?', desempenho_gpus).
pergunta(10, 'Você conhece conceitos de integração contínua (CI) e entrega contínua (CD)?', ci_cd).
pergunta(11, 'Gosta de prototipar dispositivos com placas como Arduino/ESP/BeagleBone?', prototipagem_rapida).
pergunta(12, 'Tem curiosidade por segurança em dispositivos restritos (hardening, autenticação)?', seguranca_embarcada).
pergunta(13, 'Já lidou com análise estatística aplicada a dados experimentais ou científicos?', estatistica_aplicada).
pergunta(14, 'Se interessa em revisar e melhorar a qualidade do código (code review)?', revisao_codigo).
pergunta(15, 'Tem interesse em aprender a programar shaders ou pipeline gráfico?', shaders_programacao).
pergunta(16, 'Prefere trabalhar com requisitos, processos e documentação de projetos?', engenharia_requisitos).
pergunta(17, 'Você já utilizou bancos de dados específicos para genômica ou biologia?', bancos_de_dados_biologicos).
pergunta(18, 'Se interessa por protocolos de comunicação (MQTT, CoAP, BLE, LoRa)?', protocolos_comunicacao).
pergunta(19, 'Tem experiência com sensores, leitura/filtragem de sinais e aquisição de dados?', sensores_e_atuadores).
pergunta(20, 'Gosta de definir métricas e indicadores para medir qualidade de software?', metricas_qualidade).

