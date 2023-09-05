create database filmes;

use filmes;

create table filmes (
id_filme INT,
titulo VARCHAR(60),
genero VARCHAR(45),
duracao VARCHAR(45),
ano_lancamento INT,
preco_aluguel DOUBLE,
PRIMARY KEY (id_filme)
);

create table atuacoes (
	id_protagonista INT,
    id_filme INT,
    id_ator INT, 
    PRIMARY KEY (id_protagonista),
    foreign key (id_filme) references filmes (id_filme),
    foreign key (id_ator) references atores (id_ator)
 );

    
    
create table atores (
	id_ator INT,
    nome_ator VARCHAR(60),
    ano_nascimento INT,
    nacionalidade VARCHAR(20),
	sexo VARCHAR(10),
    PRIMARY KEY (id_ator)
 );
 
DROP TABLE ATUACOES;
DROP TABLE ATORES;

select f.titulo, f.genero, nome_ator, a.nacionalidade, a.sexo, f.ano_lancamento from atuacoes at 
inner join filmes f
on f.id_filme = at.id_filme
inner join atores a
on at.id_ator = a.id_ator;

select f.titulo, f.ano_lancamento
from filmes f
inner join atuacoes a on f.id_filme = a.id_filme
inner join atores at on a.id_ator = at.id_ator
where at.nome_ator = 'Al Pacino';

select at.nome_ator, at.ano_nascimento
from atores at
inner join atuacoes at on a.id_ator = at.id_ator
inner join filmes f on at.id_filme = f.id_filme
where f.titulo = 'Jogos Vorazes';

select distinct a.nome_ator, a.nacionalidade
from atores a
inner join atuacoes at on a.id_ator = at.id_ator
inner join filmes f on at.id_filme = f.id_filme
where a.nacionalidade = 'Reino Unido' and f.genero = 'Drama';

select distinct a.nome_ator
from atores a
inner join atuacoes at on a.id_ator = at.id_ator
inner join filmes f on at.id_filme = f.id_filme
where f.ano_lancamento < 2010;

select genero, COUNT(*) as quantidade
from filmes
group by genero
order by quantidade desc
limit 5;

select at.nome_ator, COUNT(f.id_filme) as num_filmes
from atores at 
inner join atuacoes a on at.id_ator = a.id_ator
inner join filmes f on a.id_filme = f.id_filme
where f.genero = 'Drama' 
group by at.id_ator, at.nome_ator;

select avg (f.ano_lancamento - at.ano_nascimento) as media_idade
from atores at
inner join atuacoes a on at.id_ator = a.id_ator
inner join filmes f on a.id_filme = f.id_filme;

select at.nome_ator, COUNT(a.id_filme) as num_filmes
from atores at
inner join atuacoes a on at.id_ator = a.id_ator
group by at.id_ator, at.nome_ator
order by num_filmes desc
limit 1;






select * from atuacoes;

select * from filmes where id_filme=37;

select * from atores where id_ator=1;

select f.titulo, f.genero, a.nome_ator from atuacoes at 
inner join filmes f
on f.id_filme = at.id_filme
inner join atores a
on at.id_ator = a.id_ator where f.titulo like 'R%';


























