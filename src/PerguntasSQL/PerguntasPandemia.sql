SELECT * FROM projetonba.games;

select count(*) as "Numeros de Partidas" from projetonba.games where SEASON = 2019; 

select sum(HOME_TEAM_WINS) as "Vitorias em Casa" from projetonba.games where SEASON = 2019; 

select count(*) as "Numeros de Partidas" from projetonba.games where SEASON between 2011 and 2013; 


select sum(HOME_TEAM_WINS) as "Vitorias em Casa" from projetonba.games where SEASON between 2011 and 2013; 