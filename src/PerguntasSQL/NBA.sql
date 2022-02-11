
# Criando o banco de dados NBA #
create database NBA;

# Usando o banco #
use nba;

# criação da tebela table_name #
CREATE TABLE IF NOT EXISTS TABLE_NAME(
TEAM_ID INT,
LEAGUE_ID INT,
SEASON_ID INT,
STANDINGSDATE VARCHAR( 100 ),
CONFERENCE VARCHAR( 100 ),
TEAM VARCHAR( 100 ),
G INT,
W INT,
L INT,
W_PCT DECIMAL( 10 , 2 ),
HOME_RECORD VARCHAR( 100 ),
ROAD_RECORD VARCHAR( 100 )
);

# Criando a tabela Times # 
CREATE TABLE IF NOT EXISTS times(
LEAGUE_ID INT(11),
TEAM_ID INT(11),
MIN_YEAR INT(11),
MAX_YEAR INT(11),
ABBREVIATION VARCHAR( 100 ),
NICKNAME VARCHAR( 100 ),
YEARFOUNDED INT(11),
CITY VARCHAR( 100 ),
ARENA VARCHAR( 100 ),
ARENACAPACITY INT(11),
OWNER VARCHAR( 100 ),
GENERALMANAGER VARCHAR( 100 ),
HEADCOACH VARCHAR( 100 ),
DLEAGUEAFFILIATION VARCHAR( 100 )
);

# Alterando o nome da tebela para ficar mais fácil de ler #
rename table TABLE_NAME to ranking;

#################################################################

# Adicionando chave primaria#
ALTER TABLE times ADD PRIMARY KEY(TEAM_ID);

#################################################################

# Adicionando chave estrangeira#
alter table ranking add foreign key(TEAM_ID) references times(TEAM_ID);

#################################################################

# testando pegando o resuldado # 
SELECT cast(substring_index(Home_record, '-', 1) as signed) as resultado FROM ranking 
group by resultado
order by resultado desc;

#################################################################

# Pegando o nome completo dos times # 
select distinct r.team, t.nickname from ranking as  r
inner join times as t
on r.TEAM_ID = t.TEAM_ID limit 0,5;

#################################################################

# Pegando os 5 time com mais vitorias em casa # 
SELECT distinct t.team_id, r.team, t.nickname,
sum(cast(substring_index(Home_record, '-', 1) as signed)) as pontos
FROM ranking as r
inner join times as t
on t.TEAM_ID = r.TEAM_ID
group by r.TEAM_ID
order by pontos desc limit 0,5;

#################################################################

# Os 5 times com mais vitorias no total # 
select distinct t.team_id, r.team, t.nickname, sum(r.w) as vitorias from ranking as r
inner join times as t
on t.TEAM_ID = r.TEAM_ID
group by r.TEAM, t.nickname
ORDER by vitorias desc limit 0,5;

#################################################################

#Selecionando as arenas com maior capacidade de cada time#

select r.TEAM, t.NICKNAME, t.ARENA, t.ARENACAPACITY  from times as t
inner join ranking as r
on t.TEAM_ID = r.TEAM_ID 
group by ARENACAPACITY
order by ARENACAPACITY desc limit 0,5;

#################################################################

# Times mais antigos #

select r.TEAM, t.NICKNAME, t.YEARFOUNDED from times as t
inner join ranking as r
on t.TEAM_ID = r.TEAM_ID 
group by YEARFOUNDED
order by YEARFOUNDED asc limit 0,5;














