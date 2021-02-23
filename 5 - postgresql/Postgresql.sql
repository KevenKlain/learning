========================================================================================================================================================================================================
									Mês de Dezembro 01/2021
Foco do Estudo 
	• Banco de Dados - Postgres 
	• API Rest 
	• PHP
											  END
========================================================================================================================================================================================================								
========================================================================================================================================================================================================
							  17/12/2021 - Banco de Dados - Postgres 
Conteúdos Abordados 
	• 2.3. Criação de tabelas
	• 2.4. Inserção de linhas em tabelas
	• 2.5. Consultar tabelas
	• 2.6. Junções entre tabelas
										NOTES - 17/12/2021
/*										    CONCLUÍDO
2.3. Criação de tabelas 

	CREATE TABLE clima(
		cidade VARCHAR(80),
		temp_min INT,
		temp_max INT,
		prcp REAL,
		dta DATE
	);

	CREATE TABLE cidades (
		nome VARCHAR(80),
		localizacao POINT
	);
		
2.4. Inserção de linhas em tabelas

	INSERT INTO clima 
	VALUES ('São Franciso', 46, 50, 0.25, '1994-11-27');

	INSERT INTO cidades
	VALUES ('São Francisco', '(-194.0, 53.0)');

	INSERT INTO clima (cidade, temp_min, temp_max, prcp, dta)
	VALUES ('São Francisco', 43, 47, 0.0, '1994-11-29');

	INSERT INTO clima (dta, cidade, temp_max, temp_min)
	VALUES ('1994-11-29', 'Hayward', 54, 37);

2.5. Consultar tabelas
 
	SELECT * 
	FROM clima;

	SELECT cidade, (temp_max+temp_min)/2 
	AS temp_media, dta
	FROM clima

	SELECT * FROM clima 
	WHERE cidade = 'São Francisco' 
	AND prcp > 0.0;

	SELECT * FROM clima 
	ORDER BY cidade;

	SELECT * FROM clima 
	ORDER BY cidade, temp_min;

	SELECT DISTINCT cidade 
	FROM clima;

	SELECT DISTINCT cidade 
	FROM clima 
	ORDER BY cidade;

2.6. Junções entre tabelas

	SELECT *
	FROM clima, cidades
	WHERE cidade = nome;

	SELECT cidade, temp_min, temp_max, prcp, dta, localizacao
	FROM clima, cidades
	WHERE cidade = nome;

	SELECT clima.cidade, clima.temp_min, clima.temp_max,
		   clima.prcp, clima.dta, cidades.localizacao
	FROM clima, cidades
	WHERE cidades.nome = clima.cidade;

	SELECT * 
	FROM clima 
	INNER JOIN cidades
	ON (clima.cidade = cidades.nome)

	SELECT *
	FROM clima
	LEFT OUTER JOIN cidades
	ON (clima.cidade = cidades.nome)

	SELECT *
	FROM clima
	RIGHT OUTER JOIN cidades
	ON (clima.cidade = cidades.nome)

	SELECT *
	FROM clima
	FULL OUTER JOIN cidades
	ON (clima.cidade = cidades.nome)

	SELECT c1.cidade, c1.temp_min AS menor, c1.temp_max AS maior,
		   c2.cidade, c2.temp_min AS menor, c2.temp_max AS maior
	FROM clima c1, clima c2
	WHERE c1.temp_min < c2.temp_min
	AND c1.temp_max > c2.temp_max

	SELECT *
	FROM clima w, cidades c
	WHERE w.cidade = c.nome;*/
========================================================================================================================================================================================================	
	SELECT c.dt_saida, p.dt_saida
	FROM db_gol.tb_notfat c
	JOIN db_gol.tb_venda p
	ON c.id_empresa = p.id_empresa
	AND c.id_notfat = p.id_notfat
	WHERE c.id_empresa = 1
	AND c.id_notfat = 707641
========================================================================================================================================================================================================
							  25/01/2021 - Banco de Dados - Postgres 
Conteúdos Abordados 
	Capítulo 2. A linguagem SQL 
		• 2.7. Funções de agregação 
		• 2.8. Atualizações 
		• 2.9. Exclusões 
	Capítulo 3. Funcionalidades avançadas 
		• 3.2. Visões
		• 3.3. Chaves estrangeiras
		• 3.4. Transações 
		• 3.5. Herança
										NOTES - 20/12/2020
/*                                      CONCLUÍDO										
2.7. Funções de agregação 									
Para servir de exemplo, é possível encontrar a maior temperatura mínima ocorrida em qualquer lugar usando 
SELECT max(temp_min) 
	FROM clima

Se for desejado saber a cidade (ou cidades) onde esta temperatura ocorreu pode-se tentar usar 
Isto está correto porque a subconsulta é uma ação independente, que calcula sua agregação em separado do que está
acontecendo na consulta externa.
SELECT cidade 
	FROM clima 
	WHERE temp_min = (SELECT max(temp_min) 
					  FROM clima
					  
As agregações também são muito úteis em combinação com a cláusula GROUP BY. Por exemplo, pode ser obtida a maior
temperatura mínima observada em cada cidade usando				  
SELECT cidade, max(temp_min)
	FROM clima 
	GROUP BY cidade

produzindo uma linha de saída para cada cidade. Cada resultado da agregação é computado sobre as linhas da tabela
correspondendo a uma cidade. As linhas agrupadas podem ser filtradas utilizando a cláusula HAVING
SELECT cidade, max(temp_min)
	FROM clima
	GROUP BY cidade 
	HAVING max(temp_min) < 40
	
Para concluir, se desejarmos somente as cidades com nome começando pela letra “S” podemos escrever: 
SELECT cidade, max(temp_min)
	FROM clima 
	WHERE cidade LIKE 'S%'
	GROUP BY cidade
	HAVING max(temp_min) < 40

2.8. Atualizações 
As linhas existentes podem ser atualizadas utilizando o comando UPDATE. Suponha que foi descoberto que as leituras de
temperatura estão todas mais altas 2 graus após 28 de novembro de 1994. Os dados podem ser atualizados da seguinte
maneira: 
UPDATE clima 
	SET temp_max = temp_max - 2, temp_min = temp_min - 2
	WHERE dta > '1994-11-28'
Veja o Resultado
SELECT * FROM clima
										
2.9. Exclusões 
As linhas podem ser removidas da tabela através do comando DELETE. Suponha que não estamos mais interessados nos
registros do clima em Hayward. Então precisamos excluir estas linhas da tabela. 
DELETE FROM clima 
	WHERE cidade = 'Hayward'
Deve-se tomar cuidado com comandos na forma:
DELETE FROM nome_da_tabela;
 Sem uma qualificação, o comando DELETE remove todas as linhas da tabela, deixando-a vazia. O sistema não solicita
confirmação antes de realizar esta operação!

	
Capítulo 3. Funcionalidades avançadas 
3.2. Visões 	
Reveja as consultas na Seção 2.6. Supondo que a consulta combinando os registros de clima e de localização das cidades
seja de particular interesse para um aplicativo, mas que não se deseja digitar esta consulta toda vez que for necessária, então
é possível criar uma visão baseada na consulta, atribuindo um nome a esta consulta pelo qual será possível referenciá-la
como se fosse uma tabela comum. 

CREATE VIEW minha_visao AS 
	SELECT cidade, temp_min, temp_max, prcp, dta, localizacao
		FROM clima, cidades
		WHERE cidade = nome
SELECT * FROM minha_visao
	
Fazer livre uso de visões é um aspecto chave de um bom projeto de banco de dados SQL. As visões permitem encapsular,
atrás de interfaces que não mudam, os detalhes da estrutura das tabelas, que podem mudar na medida em que os aplicativos
evoluem.
As visões podem ser utilizadas em praticamente todos os lugares onde uma tabela real pode ser utilizada. Construir visões
baseadas em visões não é raro.

3.3. Chaves estrangeiras
CREATE TABLE tb_cidades (
	cidade varchar(80) primary key,
	localizacao point
);
CREATE TABLE tb_clima (
	cidade varchar(80) references cidades(cidade),
	temp_min int,
	temp_max int,
	prcp real,
	data date
);

3.4. Transações 
Uso do BEGIN, ROLLBACK e COMMIT 

3.5. Herança
Herança é um conceito de banco de dados orientado a objeto, que abre novas possibilidades interessantes ao projeto de
banco de dados.
Vamos criar duas tabelas: a tabela cidades e a tabela capitais. Como é natural, as capitais também são cidades e,
portanto, deve existir alguma maneira para mostrar implicitamente as capitais quando todas as cidades são mostradas. Se
formos bastante perspicazes, poderemos criar um esquema como este: 
CREATE TABLE capitais (
	nome TEXT,
	populacao REAL,
	altitude INT,
	estado CHAR(2)
)

CREATE TABLE interior (
	nome TEXT,
	populacao REAL,
	altitude INT
)

CREATE VIEW cidades AS 
	SELECT nome, populacao, altitude 
	FROM capitais
	UNION
	SELECT nome, populacao, altitude 
	FROM interior

1 - SELECT max(temp_min) FROM clima;

2 - SELECT cidade FROM clima
	WHERE temp_min = (SELECT max(temp_min) FROM clima);

Este esquema funciona bem para as consultas, mas não é bom quando é necessário atualizar várias linhas, entre outras
coisas. 
Esta é uma solução melhor:
CREATE TABLE capitais (
	nome TEXT,
	populacao REAL,
	altitude INT,
)
CREATE TABLE interior (
	estado CHAR (2)	
) INHERITS (cidades);

INSERT INTO capitais (nome, populacao, altitude, estado) 
VALUES ('Las Vegas', 10000, 2174, 'LA'),
	   ('Mariposa', 10000, 1953, 'MP'),
	   ('Madison', 10000, 845, 'MD')

Neste caso, as linhas da tabela capitais herdam todas as colunas (nome, populacao e altitude) da sua tabela
ancestral cidades. O tipo da coluna nome é text, um tipo nativo do PostgreSQL para cadeias de caracteres de tamanho
variável. As capitais dos estados possuem uma coluna a mais chamada estado, que armazena a sigla do estado. No
PostgreSQL uma tabela pode herdar de nenhuma, uma, ou de várias tabelas.
Por exemplo, a consulta abaixo retorna os nomes de todas as cidades, incluindo as capitais dos estados, localizadas a uma
altitude superior a 500 pés
SELECT nome, altitude
	FROM cidades
	WHERE altitude > 500
	
Por outro lado, a consulta abaixo traz todas as cidades que não são capitais de estado e estão situadas a uma altitude
superior a 500 pés: 
SELECT nome, altitude
	FROM ONLY cidades
	WHERE altitude > 500
	
UPDATE db_gol.tb_fator_conversao fc SET tx_gtin = (
	SELECT 
		tb_produto.tx_codigo_personalizado
	FROM db_gol.tb_produto 
	JOIN db_gol.tb_fator_conversao 
	ON tb_produto.id_produto = tb_fator_conversao.id_produto
	WHERE tb_fator_conversao.unidade_medida = 'UN'
	AND fc.id_produto = tb_fator_conversao.id_produto
	AND fc.id_empresa = tb_fator_conversao.id_empresa
	AND fc.unidade_medida = tb_fator_conversao.unidade_medida
)
WHERE unidade_medida = 'UN'

UPDATE db_gol.tb_fator_conversao tb_fator_conversao_update SET tx_gtin = (
	SELECT 
		tb_produto.tx_codigo_personalizado
	FROM db_gol.tb_produto 
	JOIN db_gol.tb_fator_conversao 
	ON tb_produto.id_produto = tb_fator_conversao.id_produto
	WHERE tb_fator_conversao.unidade_medida = 'UN'
	AND tb_fator_conversao_update.id_produto = tb_fator_conversao.id_produto
	AND tb_fator_conversao_update.id_empresa = tb_fator_conversao.id_empresa
	AND tb_fator_conversao_update.unidade_medida = tb_fator_conversao.unidade_medida
)
WHERE unidade_medida = 'UN'

SELECT tb_produto.id_produto, tb_produto.tx_codigo_personalizado,
   tb_fator_conversao.tx_gtin, tb_fator_conversao.id_produto, tb_fator_conversao.unidade_medida
FROM db_gol.tb_produto
JOIN db_gol.tb_fator_conversao
ON tb_produto.id_produto = tb_fator_conversao.id_produto
WHERE tb_fator_conversao.unidade_medida = 'UN'
ORDER BY tb_produto.id_produto
	
	
BEGIN
COMMIT
Rollback
UPDATE db_gol.tb_fator_conversao tb_fator_conversao_update SET tx_gtin = (
	SELECT 
		tb_produto.tx_codigo_personalizado
	FROM db_gol.tb_produto 
	JOIN db_gol.tb_fator_conversao 
	ON tb_produto.id_produto = tb_fator_conversao.id_produto
	WHERE tb_fator_conversao.unidade_medida = 'UN'
	AND tb_fator_conversao_update.id_produto = tb_fator_conversao.id_produto
	AND tb_fator_conversao_update.id_empresa = tb_fator_conversao.id_empresa
	AND tb_fator_conversao_update.unidade_medida = tb_fator_conversao.unidade_medida
)
WHERE unidade_medida = 'UN'

WHERE 4 < length(tx_codigo_personalizado)

UPDATE db_gol.tb_produto ct SET tx_codigo_personalizado = (
	SELECT 
		tb_produto.id_servico
	FROM db_gol.tb_produto 
	WHERE ct.id_produto = tb_produto.id_produto
	AND ct.id_empresa = tb_produto.id_empresa
)
WHERE  4 < LENGTH(tx_codigo_personalizado)
SELECT tx_codigo_personalizado, * 
FROM db_gol.tb_produto 

DO
$$
DECLARE
  c1 record;
  c2 record;
  arr_app varchar(30)[] := array['fat197_1','fat197_2'];  
  v_app varchar(30);
BEGIN
FOR c1 IN SELECT id_empresa, cnpj FROM db_gol.tb_empresa
LOOP
IF((SELECT COUNT(1) FROM db_gol.tb_grupo_usuario WHERE id_empresa = c1.id_empresa AND descricao = 'COMANDA2') = 0) THEN
	INSERT INTO db_gol.tb_grupo_usuario VALUES((SELECT COALESCE(MAX(codigo_grupo) + 1, 1) FROM db_gol.tb_grupo_usuario WHERE id_empresa = c1.id_empresa) , 'COMANDA2', c1.id_empresa); 
END IF;
FOREACH v_app IN ARRAY arr_app
    LOOP
        RAISE NOTICE '%', v_app;
        --RAISE NOTICE '%', 'SELECT count(1) FROM  db_gol.tb_aplicacao WHERE nome_apl=v_app';        
        IF ((SELECT count(1) FROM  db_gol.tb_aplicacao WHERE nome_apl=v_app)=0) THEN           
            INSERT INTO db_gol.tb_aplicacao VALUES(v_app, v_app);
		ELSE
			FOR c2 IN (SELECT codigo_grupo, descricao, id_empresa FROM db_gol.tb_grupo_usuario WHERE id_empresa = c1.id_empresa AND descricao = 'COMANDA2')
			LOOP
				IF((SELECT COUNT(1) FROM db_gol.tb_aplicacao_grupo WHERE id_empresa = c2.id_empresa AND codigo = c2.codigo_grupo AND nome = v_app) = 0) THEN
					INSERT INTO db_gol.tb_aplicacao_grupo VALUES(c2.codigo_grupo, v_app, c2.id_empresa);
				END IF;				
			END LOOP;			
        END IF;
    END LOOP;
END LOOP;
EXCEPTION
WHEN unique_violation THEN
--RAISE NOTICE 'app existente';
END;
$$;
--@@

SELECT c.id_notfat, c.dt_saida, 
       p.dt_saida, p.id_notfat
FROM db_gol.tb_venda p
JOIN db_gol.tb_notfat c
ON c.id_empresa = p.id_empresa
AND c.id_notfat = p.id_notfat
WHERE c.id_empresa = 6231

BEGIN 
ROLLBACK
COMMIT 

UPDATE db_gol.tb_venda tb_venda_update 
SET dt_saida = (SELECT dt_saida   
				FROM db_gol.tb_notfat
				WHERE id_empresa = 6231
			    AND id_notfat = tb_venda_update.id_notfat)
WHERE id_empresa = 6231

SELECT dt_saida, * FROM db_gol.tb_venda WHERE dt_saida IS NULL
SELECT * FROM db_gol.tb_notfat

 SELECT b.id_empresa,
    b.id_notfat,
    b.serie,
    b.id_venda,
    b.dt_emissao,
    b.dt_saida,
    b.dt_entrega,
    b.sit_sefaz,
    b.situacao,
    b.dt_cancel,
    b.xml_nfe,
    b.id_pessoa,
    b.nm_pessoa,
    b.lote_nfe,
    b.cfop,
    b.dt_vencimento,
    COALESCE(b.id_transp, 0) AS id_transp,
    b.carga,
    b.id_vendedor,
    b.observacao AS tx_observacao,
    b.subtotal AS vr_total_prod,
    b.vr_total AS vr_total_nota,
        CASE
            WHEN b.dt_entrega IS NULL THEN 'A'::text
            ELSE 'E'::text
        END AS status,
    b.id_forma,
    COALESCE(d.tx_motorista, ''::character varying) AS tx_motorista,
    b.status AS tx_status
   FROM db_gol.tb_notfat a
     LEFT JOIN db_gol.tb_venda b ON a.id_empresa = b.id_empresa AND a.id_venda = b.id_venda
     LEFT JOIN db_gol.tb_carga_venda c ON c.id_empresa = b.id_empresa AND c.id_venda = b.id_venda
     LEFT JOIN db_gol.tb_carga d ON c.id_empresa = d.id_empresa AND c.id_carga = d.id_carga AND c.id_transportador = d.id_transportador AND c.dt_carga = d.dt_carga
  WHERE b.status = ANY (ARRAY[4, 5, 8]);*/
========================================================================================================================================================================================================
							  19/01/2021 - Banco de Dados - Postgres 
Conteúdos Abordados 
	
										NOTES - 19/01/2021 	

/*
A Clausula MAX ou as Demais Funciona apenas para Sub Select

SELECT MAX(temp_min) FROM clima;

SELECT cidade, temp_min FROM clima 
WHERE temp_min = (SELECT MAX(temp_min) FROM clima)

SELECT cidade, MAX(temp_min)
FROM clima
GROUP BY cidade

SELECT COUNT(cidade), cidade FROM clima 
GROUP BY cidade

SELECT cidade, max(temp_min)
FROM clima 
GROUP BY cidade 
HAVING MAX(temp_min) < 40

SELECT cidade
FROM clima 
WHERE cidade LIKE 'S%'
GROUP BY cidade


CRIANDO VIEW PARA FACILITAR O ACESSO

CREATE VIEW minha_visao 
AS SELECT cidade, temp_min, temp_max, prcp, data, localizacao
	FROM clima, cidades
	WHERE cidade = nome; 

SELECT * FROM minha_visao

CREATE TABLE cidades (   
	nome       text,   
	populacao  real,   
	altitude   int     
);

CREATE TABLE capitais (   
	estado      char(2) 
) INHERITS (cidades);

INSERT INTO cidades(nome, populacao, altitude)
VALUES ('Las Vegas', 10000, 2174),
	   ('Mariposa', 2000, 1953)
	   
INSERT INTO capitais
VALUES ('Madison', 10000, 845, 'MD')

SELECT nome, altitude   FROM cidades   WHERE altitude > 500;
SELECT nome, altitude     FROM ONLY cidades     WHERE altitude > 500;

DO
$$
DECLARE
c1 record;
BEGIN
	FOR c1 IN SELECT cx.id_empresa||'-'||cx.id_caixa||'-'||cx.id_desd||'-'||cx.esp_mov as chave, cx.id_caixa, cx.id_desd, cx.esp_mov
				FROM db_gol.tb_caixa cx 
				WHERE cx.id_empresa = 5807
				AND cx.esp_mov = 'PG'
				AND	cx.dt_movimento != (SELECT pg.dt_pagamento
										  FROM db_gol.tb_rec_pag pg
										  WHERE pg.id_empresa = cx.id_empresa
										  AND pg.id_mov = cx.id_caixa
										  AND pg.id_desd = cx.id_desd
										  AND pg.tipo = cx.esp_mov)
	LOOP
		IF((SELECT COUNT(pg.id_empresa) FROM db_gol.tb_rec_pag pg WHERE (pg.id_empresa||'-'||pg.id_mov||'-'||pg.id_desd||'-'||pg.tipo)::text = (c1.chave)::text) > 0) THEN
			UPDATE db_gol.tb_caixa cx
		    SET dt_movimento = (SELECT pg.dt_pagamento FROM db_gol.tb_rec_pag pg WHERE (pg.id_empresa||'-'||pg.id_mov||'-'||pg.id_desd||'-'||pg.tipo)::text = (c1.chave)::text)
			WHERE (cx.id_empresa||'-'||cx.id_caixa||'-'||cx.id_desd||'-'||cx.esp_mov) = (c1.chave);
		END IF;
	END LOOP;
END;
$$
*/
============================================================================================================================================================================================================================================================================================================	


























