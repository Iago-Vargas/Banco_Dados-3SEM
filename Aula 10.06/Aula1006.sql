use editora_db;
CREATE TABLE Editora (
  idEditora INT NOT NULL,
  nome VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (idEditora)
);
CREATE TABLE Genero (
  idGenero INT NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  
  PRIMARY KEY (idGenero)
);
CREATE TABLE Livro (
  idLivro INT NOT NULL,
  titulo VARCHAR(45) NOT NULL,
  preco DECIMAL(3) NULL,
  idEditora INT NOT NULL,
  idGenero INT NOT NULL,

  PRIMARY KEY (idLivro),

  INDEX fk_Livro_Editora_idx (idEditora ASC),
  INDEX fk_Livro_Genero_idx (idGenero ASC),

  CONSTRAINT fk_Livro_Editora
    FOREIGN KEY (idEditora)
    REFERENCES Editora (idEditora)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_Livro_Genero
    FOREIGN KEY (idGenero)
    REFERENCES Genero (idGenero)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE Autor (
	idAutor INT NOT NULL,
	nome VARCHAR(45) NOT NULL,
	
	PRIMARY KEY (idAutor)
);
CREATE TABLE Livro_Autor (
  idAutor INT NOT NULL,
  idLivro INT NOT NULL,
  
  PRIMARY KEY (idAutor, idLivro),
  INDEX fk_Autor_has_Livro_Livro_idx (idLivro ASC),
  INDEX fk_Autor_has_Livro_Autor_idx (idAutor ASC),
  
  CONSTRAINT fk_Autor_has_Livro_Autor
    FOREIGN KEY (idAutor)
    REFERENCES Autor (idAutor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,

  CONSTRAINT fk_Autor_has_Livro_Livro
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
CREATE TABLE Ranking (
  idRanking INT NOT NULL,
  dataInicial DATE NOT NULL,
  dataFinal DATE NOT NULL,
  
  PRIMARY KEY (idRanking)
);
CREATE TABLE Ranking_Semanal (
  idRanking INT NOT NULL,
  idLivro INT NOT NULL,
  posicao DECIMAL(2) NULL,
  quantidadeSemanas DECIMAL(2) NULL,
  semanasConsecutivas DECIMAL(2) NULL,
  posicaoSemanaAnterior DECIMAL(2) NULL,
  
  PRIMARY KEY (idRanking, idLivro),
  INDEX fk_Ranking_has_Livro_Livro_idx (idLivro ASC),
  INDEX fk_Ranking_has_Livro_Ranking_idx (idRanking ASC),
  
  CONSTRAINT fk_Ranking_has_Livro_Ranking
    FOREIGN KEY (idRanking)
    REFERENCES Ranking (idRanking)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
  CONSTRAINT fk_Ranking_has_Livro_Livro
    FOREIGN KEY (idLivro)
    REFERENCES Livro (idLivro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
insert into Genero values (1, 'Infantil');
insert into Genero values (2, 'Ficção');
insert into Genero values (3, 'Romance');
insert into Genero values (4, 'Auto-ajuda');
insert into Genero values (5, 'Negócios');
insert into Genero values (6, 'História');
select * from Genero;

insert into Editora values (1, 'Ática');
insert into Editora values (2, 'Makron Books');
insert into Editora values (3, 'Rocco');
insert into Editora values (4, 'Scipione');
insert into Editora values (5, 'Sagra Luzato');

insert into Autor values (1, 'Pedro');
insert into Autor values (2, 'Marcos');
insert into Autor values (3, 'Felipe');
insert into Autor values (4, 'Ana');
insert into Autor values (5, 'Maria');
insert into Autor values (6, 'Francisco');
insert into Autor values (7, 'Lucas');

insert into Livro values (1, 'A', 25.30, 1, 1);
insert into Livro values (2, 'B', 32.45, 1, 4);
insert into Livro values (3, 'C', 122.00, 4, 2);
insert into Livro values (4, 'D', 100.99, 4, 3);
insert into Livro values (5, 'E', 16.16, 1, 5);
insert into Livro values (6, 'F', 4.56, 3, 1);
insert into Livro values (7, 'G', 85.20, 2, 5);
insert into Livro values (8, 'H', 89.90, 5, 5);
insert into Livro values (9, 'I', 63.36, 2, 2);
insert into Livro values (10, 'J', 41.40, 3, 3);
insert into Livro values (11, 'K', 200.30, 4, 6);
insert into Livro values (12, 'L', 99.99, 2, 4);


insert into Livro_Autor values (1, 1);
insert into Livro_Autor values (6, 1);
insert into Livro_Autor values (6, 2);
insert into Livro_Autor values (5, 3);
insert into Livro_Autor values (1, 3);
insert into Livro_Autor values (4, 3);
insert into Livro_Autor values (4, 4);
insert into Livro_Autor values (1, 5);
insert into Livro_Autor values (5, 6);
insert into Livro_Autor values (3, 6);
insert into Livro_Autor values (3, 7);
insert into Livro_Autor values (2, 8);
insert into Livro_Autor values (6, 9);
insert into Livro_Autor values (6, 10);
insert into Livro_Autor values (1, 10);
insert into Livro_Autor values (2, 11);
insert into Livro_Autor values (2, 12);

insert into Ranking values (1, '20030817', '20030823');
insert into Ranking values (2, '20030824', '20030830');
insert into Ranking values (3, '20030831', '20030906');
insert into Ranking values (4, '20030907', '20030913');

insert into Ranking_Semanal values (1,1,4,6,3,3);
insert into Ranking_Semanal values (2,1,5,7,3,4);
insert into Ranking_Semanal values (3,2,1,1,1,null);
insert into Ranking_Semanal values (4,2,1,2,2,1);
insert into Ranking_Semanal values (1,3,2,2,2,null);
insert into Ranking_Semanal values (2,3,2,3,3,2);
insert into Ranking_Semanal values (3,3,8,4,4,2);
insert into Ranking_Semanal values (4,3,10,5,5,8);
insert into Ranking_Semanal values (1,4,1,50,43,1);
insert into Ranking_Semanal values (2,5,1,1,1,null);
insert into Ranking_Semanal values (3,5,2,2,2,1);
insert into Ranking_Semanal values (4,5,9,3,3,2);
insert into Ranking_Semanal values (4,6,8,1,1,null);
insert into Ranking_Semanal values (3,7,5,1,1,null);
insert into Ranking_Semanal values (4,7,5,2,2,5);
insert into Ranking_Semanal values (1,8, 3,13,12,6);
insert into Ranking_Semanal values (2,8, 3, 14,13,3);
insert into Ranking_Semanal values (3,8,3,15,14,3);
insert into Ranking_Semanal values (4,8,4,16,15,3);
insert into Ranking_Semanal values (2,9,7,1,1,null);
insert into Ranking_Semanal values (3,9,7,2,2,7);
insert into Ranking_Semanal values (1,10,8,4,4,10);
insert into Ranking_Semanal values (2,10,9,5,5,8);
insert into Ranking_Semanal values (3,11,9,1,1,null);
insert into Ranking_Semanal values (1,12,6,3,2,6);
-- ============================================================================================
select distinct Autor.nome --Mostrar o nome dos autores que aparecem na Tabela
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor
-- ============================================================================================

select count(*) --Comando que usamos para mostrar quantas linhas possuem na tabela
from Ranking_Semanal;
-- ============================================================================================

select * from Autor; --Mostramos os Autores
-- ============================================================================================

select distinct(Autor.nome) --Mostramos todos os autores em Ordem alfabetica 
from Autor, Livro_Autor
where Autor.idAutor = Livro_Autor.idAutor
order by Autor.nome; --Comando para ordenar por alfabeto
-- ============================================================================================

select nome --Mostramos os autores que possuem a letra M começando o nome
from Autor
where nome like 'M%'
order by nome;
-- ============================================================================================

select nome --Mostramos agora com L
from Autor
where nome like 'L%'
order by nome;
-- ============================================================================================

select nome --Somente os que NÃO começam com L
from Autor
where nome not like 'L%'
order by nome;
-- ============================================================================================

select Livro.titulo, Editora.nome --Esse não entendi
from Livro, Editora
where (Editora.idEditora = 1 or Editora.idEditora = 5) and
      Livro.idEditora = Editora.idEditora;
-- ============================================================================================

select Livro.titulo, Genero.descricao, Livro.idEditora 'Código Editora', Editora.nome --Mostramos os livros da editora 1 e da 5
from Livro, Genero, Editora
where  Genero.descricao = 'Infantil' and -- Somente os Infantil
       Livro.idGenero = Genero.idGenero and
       (Livro.idEditora = 1 or Livro.idEditora = 5) and --Somente da 1 e da 5
       Livro.idEditora = Editora.idEditora;
       
select Livro.titulo, Genero.descricao, Livro.idEditora 'Código Editora', Editora.nome
from((Livro
inner join Genero on Genero.descricao = 'Infantil' and (Livro.idEditora = 1 or Livro.idEditora = 5))
inner join Editora on Livro.idGenero = Genero.idGenero and Livro.idEditora = Editora.idEditora)
-- ============================================================================================

select idLivro, titulo, preco --Mostramos o Id do livro, Titulo e o Preco
from Livro;
-- ============================================================================================

select *  --Colocamos os autores em ordem contraria à alfabetica
from autor 
order by nome desc; --Comando que deixamos ao contrario
-- ============================================================================================

select *  --Do livro mais caro até o mais barato
from Livro 
order by preco desc; --Ordenamos do mais caro ao mais barato
-- ============================================================================================

select * --Mais barato ao mais caro
from Livro 
order by preco; --Metodo de ordenar
-- ============================================================================================

select livro.titulo, livro.preco  --Somente os livros de Auto-Ajuda
from livro 
where idGenero = '4' --Genero 4 é o de Auto-Ajuda
order by preco; --Ordenamos do mais barato ao mais caro

SELECT *  --Outro metodo de mostrar os de Auto-Ajuda (Mais completo)
FROM Livro, Genero 
WHERE Livro.idGenero = Genero.idGenero AND 
Genero.descricao = 'Auto-ajuda' 
ORDER BY preco ASC; 

select livro.*  --Outro metodo de mostrar os de Auto-Ajuda
from livro,genero 
where descricao = 'Auto-Ajuda' and livro.idGenero = genero.idGenero 
order by preco asc;
-- ============================================================================================

select count(*) --Mostramos a quantidade de autores cadastrados
from autor; 
-- ============================================================================================

select max(preco) as livroMaisCaro, min(preco) as livroMaisBarato  --Buscamos o livro mais barato e mais caro da Editora 1
from Livro
where Livro.idEditora = 1; --Buscamos somente da Editora 1

select max(preco), min(preco) 
from livro 
where idEditora = '1';

select titulo, preco 
from livro 
where preco = (select max(preco) 
	       from livro 
               where idEditora = 1) or 
      preco = (select min(preco) 
               from livro 
               where idEditora = 1);

-- ============================================================================================
select Livro.titulo, Editora.nome as editora, Genero.descricao as genero --Mostramos os livros com seus Editores e Generos
from Livro, Editora, Genero 
where Livro.idEditora=Editora.idEditora and 
      Livro.idGenero=Genero.idGenero;

SELECT Livro.titulo, Editora.nome 'Editora', Genero.descricao 'Genero' 
FROM Livro, Editora, Genero 
WHERE Livro.idGenero = Genero.idGenero AND 
Livro.idEditora = Editora.idEditora;
-- ============================================================================================
SELECT Livro.titulo, Ranking_semanal.posicao, Ranking_semanal.semanasConsecutivas 
FROM Livro, Ranking_semanal 
WHERE semanasConsecutivas = (SELECT max(semanasConsecutivas) 
                             FROM Ranking_semanal 
                             WHERE posicao = 1) AND 
      Livro.idLivro = Ranking_semanal.idLivro;

select top 1 livro.titulo, ranking_semanal.idLivro, ranking_semanal.semanasConsecutivas 
from ranking_semanal, livro 
where Livro.idLivro = Ranking_semanal.idLivro
order by semanasConsecutivas desc;

-- ============================================================================================

select distinct Autor.nome as autor -- Para mostrarmos o titulo que ficou  mais semanas em 1 lugar no ranking
from Livro, Autor, Livro_Autor, Ranking, Ranking_Semanal 
where Livro_Autor.idAutor=Autor.idAutor and 
      Livro_Autor.idLivro=Livro.idLivro and 
      Ranking_Semanal.idRanking = Ranking.idRanking and 
      Ranking_Semanal.idLivro=Livro.idLivro and Ranking.idRanking=2;
      
select distinct Autor.nome as autor 
from Livro, Autor, Livro_Autor, Ranking, Ranking_Semanal 
where (Ranking.dataInicial='2003-08-24' and Ranking.dataFinal='2003-08-30') and
Livro_Autor.idAutor=Autor.idAutor and 
Livro_Autor.idLivro=Livro.idLivro and 
Ranking_Semanal.idRanking = Ranking.idRanking and 
Ranking_Semanal.idLivro=Livro.idLivro;

select autor.nome
from autor,ranking, ranking_semanal, livro_autor
where ranking_semanal.idRanking = (select idRanking
				from ranking
				where dataInicial = '2003-08-24' and
				dataFinal = '2003-08-30') 
      and ranking.idRanking = ranking_semanal.idRanking and
      ranking_semanal.idLivro = livro_autor.idLivro and
      livro_autor.idAutor = autor.idAutor;