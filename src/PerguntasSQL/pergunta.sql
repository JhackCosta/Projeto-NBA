 
CREATE TABLE `detalhes_jogo` (
  `id_jogo` varchar(8) NOT NULL,
  `id_time` varchar(10) NOT NULL,
  `nome_jogador` varchar(100) DEFAULT NULL,
  `min_jogador` time DEFAULT NULL,
  `qtd_cestas_feitas` tinyint DEFAULT NULL,
  `qtd_tentv_cestas` tinyint DEFAULT NULL,
  `pct_aprov_cestas` float DEFAULT NULL,
  `qtd_cestas3pt_feitas` tinyint DEFAULT NULL,
  `qtd_tentv_cestas3pt` tinyint DEFAULT NULL,
  `pct_aprov_cestas3pt` float DEFAULT NULL,
  `qtd_cestasLL_feitas` tinyint DEFAULT NULL,
  `qtd_tentv_cestasLL` tinyint DEFAULT NULL,
  `pct_aprov_cestasLL` float DEFAULT NULL,
  `qtd_reb_ofensivos` tinyint DEFAULT NULL,
  `qtd_reb_defensivos` tinyint DEFAULT NULL,
  `qtd_reb_total` tinyint DEFAULT NULL,
  `qtd_ast` tinyint DEFAULT NULL,
  `qtd_roubos` tinyint DEFAULT NULL,
  `qtd_bloqueios` tinyint DEFAULT NULL,
  `qtd_bolas_perdidas` tinyint DEFAULT NULL,
  `qtd_faltas` tinyint DEFAULT NULL,
  `pts` tinyint DEFAULT NULL
);

# tabela referente a roubos e bloqueios de jogadores
select nome_jogador, sum(qtd_roubos) as roubos, sum(qtd_bloqueios) as bloqueios from detalhes_jogo
group by nome_jogador 
order by roubos desc limit 10;

#tabela referente a bolas perdidas e faltas
select nome_jogador, sum(qtd_bolas_perdidas) as perdidas, sum(qtd_faltas) as faltas from detalhes_jogo  
group by nome_jogador 
order by perdidas desc limit 10;

Quais jogadores mais pontuaram?

SELECT nome_jogador, sum(qtd_cestas_feitas) AS cestinhas FROM detalhes_jogo GROUP BY nome_jogador ORDER BY cestinhas DESC LIMIT 10;

Quais jogadores mais deram assistências?

SELECT nome_jogador, sum(qtd_ast) AS assist FROM detalhes_jogo GROUP BY nome_jogador ORDER BY assist desc limit 1

