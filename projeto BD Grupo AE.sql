/* 
Trabalho realizado pelo Grupo AE:
Daniel Rodrigues - a22203178
Tomás Silva - a22207322
*/

--1

--CREATE DATABASE gestao

--CREATE SCHEMA tfc

--2 Carregamento de dados e alterações nas tabelas

-- Tabela vazia, import wizard não reconhecia as colunas, por isso obtamos por criar a tabela após importar as restantes tabelas
USE gestao
CREATE TABLE tfc.AvaliacaoDisciplinaAluno(
    id BIGINT NOT NULL PRIMARY KEY,
    idNumeroAluno BIGINT NOT NULL,
    idNumeroDisciplina BIGINT NOT NULL,
    FOREIGN KEY (idNumeroAluno) REFERENCES tfc.Aluno(id),
    FOREIGN KEY (idNumeroDisciplina) REFERENCES tfc.Disciplina(id),
    nota INT NOT NULL
);

--Coluna nome not null mas está importado com null 
UPDATE tfc.Tecnologia
SET nome = 'nulo'
WHERE nome IS NULL;

ALTER TABLE tfc.Tecnologia
ALTER COLUMN nome VARCHAR(255) NOT NULL;

UPDATE tfc.Empresa_EntidadeExterna
SET nome = 'nulo'
WHERE nome IS NULL;

-- Alterar a coluna para NOT NULL
ALTER TABLE tfc.Empresa_EntidadeExterna
ALTER COLUMN nome VARCHAR(255) NOT NULL;

--3 Criar índices

--Tabela TFCCurso
CREATE INDEX idx_Curso ON tfc.TFCCurso(idCurso);

CREATE INDEX idx_TFC ON tfc.TFCCurso(idTFC);

--Tabela TFCTecnologia

CREATE INDEX idx_TFC ON tfc.TFCTecnologia(idTFC);

CREATE INDEX idx_Tecnologia ON tfc.TFCTecnologia(idTecnologia);

--Tabela TFCDisciplina

CREATE INDEX idx_NumeroDisciplina ON tfc.TFCDisciplina(idNumeroDisciplina);

--Tabela AvaliacaoDisciplinaAluno

CREATE INDEX idx_NumeroAluno ON tfc.AvaliacaoDisciplinaAluno(idNumeroAluno);

CREATE INDEX idx_NumeroDisciplina ON tfc.AvaliacaoDisciplinaAluno(idNumeroDisciplina);

--Tabela Inscricao

CREATE INDEX idx_TFC ON tfc.Inscricao(idTFC);

CREATE INDEX idx_NumeroGrupo ON tfc.Inscricao(idNumeroGrupo);

--Tabela HistoricoTFC

CREATE INDEX idx_TFC ON tfc.HistoricoTFC(idTFC);

CREATE INDEX idx_TFCNumerico ON tfc.HistoricoTFC(idTFCNumerico);

--Tabela Grupo

CREATE INDEX idx_NumeroAluno1 ON tfc.Grupo(idNumeroAluno1);

CREATE INDEX idx_NumeroAluno2 ON tfc.Grupo(idNumeroAluno2);

--Tabela TFC

CREATE INDEX idx_Grupo ON tfc.TFC(idGrupo);

CREATE INDEX idx_tfc ON tfc.TFC(idtfc);

--Tabela ProfessorNDEISI

CREATE INDEX idx_Professor ON tfc.ProfessorNDEISI(idProfessor);

--Tabela Empresa_EntidadeExterna

CREATE INDEX idx_Empresa ON tfc.Empresa_EntidadeExterna(idEmpresa);

--Tabela Utilizador

CREATE INDEX idx_Identificacao ON tfc.Utilizador(idIdentificacao);


--4.1 e 4.2

UPDATE tfc.Aluno
SET 
    curso = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(curso, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    email = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(email, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    nome = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))), 
    numeroAluno = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(numeroAluno, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')))

UPDATE tfc.Curso
SET nome = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));

UPDATE tfc.Disciplina
SET nome = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));


UPDATE tfc.Empresa_EntidadeExterna
SET 
    email = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(email, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    idEmpresa = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idEmpresa, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    interlocutor = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(interlocutor, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    morada = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(morada, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    nome = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));

UPDATE tfc.Grupo
SET 
    idNumeroAluno1= LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idNumeroAluno1, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    idNumeroAluno2= LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idNumeroAluno2, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));


UPDATE tfc.HistoricoTFC
SET 
    avaliacao = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(avaliacao, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    dataMudancaEstado = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(avaliacao, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    estado = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(estado, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    idTFC = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idTFC, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    utilizador= LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(utilizador, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));

UPDATE tfc.Inscricao
SET 
    estado = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(estado, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    idTFC = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idTFC, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    numeroAluno = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(numeroAluno, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    anoLetivo = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(anoLetivo, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));


UPDATE tfc.ProfessorDEISI
SET 
    email = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(email, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    nome = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    numeroProfessor = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(numeroProfessor, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));


UPDATE tfc.ProfessorNDEISI
SET 
    departamentoAfeto = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(departamentoAfeto, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    email = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(email, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    idProfessor = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idProfessor, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    nome= LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));

UPDATE tfc.Tecnologia
SET nome= LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome , CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));

UPDATE tfc.TFC
SET 
    Titulo = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(Titulo, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    anoLetivo = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(anoLetivo, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    avaliacaoProposta = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(avaliacaoProposta, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    coorientador = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(coorientador, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    dataEstado = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(dataEstado, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    dataProposta = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(dataProposta, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    estado = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(estado, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    descricao = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(descricao, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    idtfc = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idtfc, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    orientador = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(orientador, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    orientadorProposto = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(orientadorProposto, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    preponente = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(preponente, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    motivoRecusa = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(motivoRecusa, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    tecnologias = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(tecnologias, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));

UPDATE tfc.Utilizador
SET idIdentificacao = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(idIdentificacao, CHAR(9), ''), CHAR(10), ''), CHAR(13), ''))),
    tipoUtilizador = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(tipoUtilizador, CHAR(9), ''), CHAR(10), ''), CHAR(13), '')));


--4.3
UPDATE tfc.TFC
SET estado = CASE 
    WHEN estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') THEN 'Anulado'
    ELSE estado
END;

UPDATE tfc.Inscricao
SET estado = CASE 
    WHEN estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Anulado') THEN 'Anulado'
    ELSE estado
END;

UPDATE tfc.HistoricoTFC
SET estado = CASE 
    WHEN estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') THEN 'Anulado'
    ELSE estado
END;

--5
--Adiciona a coluna [id_temp] às tabelas Aluno, ProfessorDEISI, ProfessorNDEISI, Grupo
ALTER TABLE tfc.Aluno ADD id_temp INT;
ALTER TABLE tfc.ProfessorDEISI ADD id_temp INT;
ALTER TABLE tfc.ProfessorNDEISI ADD id_temp INT;
ALTER TABLE tfc.Grupo ADD id_temp INT;

--Elimina duplicadas mantendo o [id_temp] mais baixo

--Elimina duplicadas na tabela Aluno baseado no menor id_temp para cada numeroAluno
DELETE a1
FROM tfc.Aluno a1
JOIN (
    SELECT numeroAluno, MIN(id_temp) as min_id_temp
    FROM tfc.Aluno
    GROUP BY numeroAluno
) a2 ON ((a1.numeroAluno = a2.numeroAluno) AND (a1.id_temp > a2.min_id_temp));

--Elimina duplicadas na tabela ProfessorDEISI baseado no menor id_temp para cada numeroProfessor
DELETE p1
FROM tfc.ProfessorDEISI p1
JOIN (
    SELECT numeroProfessor, MIN(id_temp) as min_id_temp
    FROM tfc.ProfessorDEISI
    GROUP BY numeroProfessor
) p2 ON ((p1.numeroProfessor = p2.numeroProfessor) AND (p1.id_temp > p2.min_id_temp));

--Elimina duplicadas na tabela ProfessorNDEISI baseado no menor id_temp para cada idProfessor
DELETE pn1
FROM tfc.ProfessorNDEISI pn1
JOIN (
    SELECT idProfessor, MIN(id_temp) as min_id_temp
    FROM tfc.ProfessorNDEISI
    GROUP BY idProfessor
) pn2 ON ((pn1.idProfessor = pn2.idProfessor) AND (pn1.id_temp > pn2.min_id_temp));

-- Elimina duplicadas na tabela Grupo baseado no menor id_temp para cada par idNumeroAluno1 e idNumeroAluno2
DELETE g1
FROM tfc.Grupo g1
JOIN (
    SELECT idNumeroAluno1, idNumeroAluno2, MIN(id_temp) as min_id_temp
    FROM tfc.Grupo
    GROUP BY idNumeroAluno1, idNumeroAluno2
) g2 ON ((g1.idNumeroAluno1 = g2.idNumeroAluno1) AND (g1.idNumeroAluno2 = g2.idNumeroAluno2) AND (g1.id_temp > g2.min_id_temp));

