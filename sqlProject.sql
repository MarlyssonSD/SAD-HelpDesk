DROP DATABASE IF EXISTS db_sad;
CREATE DATABASE db_sad;
USE db_sad;

CREATE TABLE IF NOT EXISTS Dim_Categoria (
    id_categoria INT NOT NULL,
    cod_categoria INT NOT NULL,
    descricao_categoria VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE IF NOT EXISTS Dim_CanalAtendimento (
    ID_Canal INT NOT NULL,
    Cod_Canal_ VARCHAR(50) NOT NULL,
    descricao_canal VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Canal)
);

CREATE TABLE IF NOT EXISTS Dim_Satisfacao (
    ID_Satisfacao_ INT NOT NULL,
    Cod_Satisfacao INT NOT NULL,
    Nivel_Satisfacao VARCHAR(100) NOT NULL,
    PRIMARY KEY (ID_Satisfacao_)
);

CREATE TABLE IF NOT EXISTS Dim_Prioridade (
    ID_Prioridade_ INT NOT NULL,
    Nivel_Prioridade_ VARCHAR(20) NOT NULL,
    cod_prioridade INT NOT NULL,
    PRIMARY KEY (ID_Prioridade_)
);

CREATE TABLE IF NOT EXISTS Dim_Status (
    ID_Status_ INT NOT NULL,
    cod_status INT NOT NULL,
    Descricao_Status_ VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_Status_)
);

CREATE TABLE IF NOT EXISTS Dim_TipoServico (
    ID_Servico_ INT NOT NULL,
    cod_servico INT NOT NULL,
    descricao_servico VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID_Servico_)
);

CREATE TABLE IF NOT EXISTS Dim_Suporte (
    id_suporte INT NOT NULL,
    cod_suporte INT NOT NULL,
    descricao_suporte VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_suporte)
);

CREATE TABLE IF NOT EXISTS Dim_Funcionario (
    ID_Funcionario_ INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(100) NOT NULL,
    Departamento VARCHAR(50),
    Cargo VARCHAR(100),
    Setor VARCHAR(50),
    PRIMARY KEY (ID_Funcionario_)
);

CREATE TABLE IF NOT EXISTS Dim_Departamento (
    ID_Departamento_ INT NOT NULL,
    Nome_Departamento_ VARCHAR(100) NOT NULL,
    Setor_ VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_Departamento_)
);

CREATE TABLE IF NOT EXISTS Dim_Usuario (
    ID_Usuario_ INT NOT NULL,
    Nome_Usuario_ VARCHAR(100) NOT NULL,
    Cargo_ VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID_Usuario_)
);

CREATE TABLE IF NOT EXISTS Dim_Tempo (
    ID_Tempo INT NOT NULL,
    Data_ DATE,
    Dia SMALLINT,
    Dia_Semana_ VARCHAR(25),
    DiaUtil CHAR(3),
    Feriado CHAR(3),
    FimSemana CHAR(3),
    Quinzena SMALLINT,
    Mes INT,
    nomeMes VARCHAR(20),
    FimMes VARCHAR(3),
    Trimestre_ SMALLINT,
    nomeTrimestre_ VARCHAR(20),
    Semestre_ SMALLINT,
    NomeSemestre VARCHAR(20),
    Ano SMALLINT NOT NULL,
    Estacao VARCHAR(9),
    PRIMARY KEY (ID_Tempo)
);

CREATE TABLE IF NOT EXISTS Fato_Chamados (
    ID_Chamado_ INT NOT NULL,
    id_categoria INT NOT NULL,
    ID_Satisfacao_ INT NOT NULL,
    ID_Prioridade_ INT NOT NULL,
    ID_Status_ INT NOT NULL,
    ID_Servico_ INT NOT NULL,
    id_suporte INT NOT NULL,
    ID_Funcionario_ INT NOT NULL,
    ID_Tempo INT NOT NULL,
    ID_Usuario_ INT NOT NULL,
    ID_Departamento_ INT NOT NULL,
    ID_Canal INT NOT NULL,
    tempo_abertura_andamento INT,
    tempo_abertura_fechamento INT,
    tempo_andamento_fechamento INT,
    Tempo_Esperado_Atendimento_ INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (ID_Chamado_, id_categoria)
);

-- ligações
ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_categoria_fato_chamados_fk
FOREIGN KEY (id_categoria)
REFERENCES Dim_Categoria (id_categoria)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT fato_chamados_dim_canalatendimento_fk
FOREIGN KEY (ID_Canal)
REFERENCES Dim_CanalAtendimento (ID_Canal)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_satisfacao_fato_chamados_fk
FOREIGN KEY (ID_Satisfacao_)
REFERENCES Dim_Satisfacao (ID_Satisfacao_)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_prioridade_fato_chamados_fk
FOREIGN KEY (ID_Prioridade_)
REFERENCES Dim_Prioridade (ID_Prioridade_)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_status_fato_chamados_fk
FOREIGN KEY (ID_Status_)
REFERENCES Dim_Status (ID_Status_)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_servico_fato_chamados_fk
FOREIGN KEY (ID_Servico_)
REFERENCES Dim_TipoServico (ID_Servico_)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_setor_ti_fato_chamados_fk
FOREIGN KEY (id_suporte)
REFERENCES Dim_Suporte (id_suporte)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_funcionario_fato_chamados_fk
FOREIGN KEY (ID_Funcionario_)
REFERENCES Dim_Funcionario (ID_Funcionario_)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_departamento_fato_chamados_fk
FOREIGN KEY (ID_Departamento_)
REFERENCES Dim_Departamento (ID_Departamento_)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_usuario_fato_chamados_fk
FOREIGN KEY (ID_Usuario_)
REFERENCES Dim_Usuario (ID_Usuario_)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Fato_Chamados ADD CONSTRAINT dim_tempo_fato_chamados_fk
FOREIGN KEY (ID_Tempo)
REFERENCES Dim_Tempo (ID_Tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

-- Limpar dados anteriores (se necessário)
-- DELETE FROM Fato_Chamados;
-- DELETE FROM Dim_Categoria;
-- DELETE FROM Dim_CanalAtendimento;
-- DELETE FROM Dim_Satisfacao;
-- DELETE FROM Dim_Prioridade;
-- DELETE FROM Dim_Status;
-- DELETE FROM Dim_TipoServico;
-- DELETE FROM Dim_Suporte;
-- DELETE FROM Dim_Funcionario;
-- DELETE FROM Dim_Departamento;
-- DELETE FROM Dim_Usuario;
-- DELETE FROM Dim_Tempo;

-- Preencher Dim_Tempo (2023 e 2024)
INSERT INTO Dim_Tempo (ID_Tempo, Data_, Dia, Dia_Semana_, DiaUtil, Feriado, FimSemana, Quinzena, Mes, nomeMes, FimMes, Trimestre_, nomeTrimestre_, Semestre_, NomeSemestre, Ano, Estacao)
VALUES
  (2023001, '2023-01-15', 15, 'Domingo', 'Não', 'Não', 'Sim', 1, 1, 'Janeiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2023, 'Verão'),
  (2023002, '2023-02-10', 10, 'Sexta-feira', 'Sim', 'Não', 'Não', 1, 2, 'Fevereiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2023, 'Verão'),
  (2023003, '2023-03-17', 17, 'Sexta-feira', 'Sim', 'Não', 'Não', 2, 3, 'Março', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2023, 'Verão'),
  (2023004, '2023-04-20', 20, 'Quinta-feira', 'Sim', 'Não', 'Não', 2, 4, 'Abril', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2023, 'Outono'),
  (2023005, '2023-05-18', 18, 'Quinta-feira', 'Sim', 'Não', 'Não', 2, 5, 'Maio', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2023, 'Outono'),
  (2023006, '2023-06-01', 1, 'Quinta-feira', 'Sim', 'Não', 'Não', 1, 6, 'Junho', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2023, 'Outono'),
  (2023007, '2023-07-07', 7, 'Sexta-feira', 'Sim', 'Não', 'Não', 1, 7, 'Julho', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2023, 'Inverno'),
  (2023008, '2023-07-14', 14, 'Sexta-feira', 'Sim', 'Não', 'Não', 1, 7, 'Julho', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2023, 'Inverno'),
  (2023009, '2023-08-23', 23, 'Quarta-feira', 'Sim', 'Não', 'Não', 2, 8, 'Agosto', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2023, 'Inverno'),
  (2023010, '2023-09-16', 16, 'Sábado', 'Não', 'Não', 'Sim', 2, 9, 'Setembro', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2023, 'Inverno');


-- Continuação Dim_Tempo (2023)
INSERT INTO Dim_Tempo (ID_Tempo, Data_, Dia, Dia_Semana_, DiaUtil, Feriado, FimSemana, Quinzena, Mes, nomeMes, FimMes, Trimestre_, nomeTrimestre_, Semestre_, NomeSemestre, Ano, Estacao)
VALUES
  (2023011, '2023-10-10', 10, 'Terça-feira', 'Sim', 'Não', 'Não', 1, 10, 'Outubro', 'Não', 4, '4º Trimestre', 2, '2º Semestre', 2023, 'Primavera'),
  (2023012, '2023-11-02', 2, 'Quinta-feira', 'Não', 'Sim', 'Não', 1, 11, 'Novembro', 'Não', 4, '4º Trimestre', 2, '2º Semestre', 2023, 'Primavera'),
  (2023013, '2023-12-25', 25, 'Segunda-feira', 'Não', 'Sim', 'Não', 2, 12, 'Dezembro', 'Não', 4, '4º Trimestre', 2, '2º Semestre', 2023, 'Verão'),
  (2023014, '2023-01-03', 3, 'Terça-feira', 'Sim', 'Não', 'Não', 1, 1, 'Janeiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2023, 'Verão'),
  (2023015, '2023-02-20', 20, 'Segunda-feira', 'Não', 'Sim', 'Não', 2, 2, 'Fevereiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2023, 'Verão'),
  (2023016, '2023-03-01', 1, 'Quarta-feira', 'Sim', 'Não', 'Não', 1, 3, 'Março', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2023, 'Verão'),
  (2023017, '2023-04-07', 7, 'Sexta-feira', 'Não', 'Sim', 'Não', 1, 4, 'Abril', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2023, 'Outono'),
  (2023018, '2023-05-01', 1, 'Segunda-feira', 'Não', 'Sim', 'Não', 1, 5, 'Maio', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2023, 'Outono'),
  (2023019, '2023-06-30', 30, 'Sexta-feira', 'Sim', 'Não', 'Não', 2, 6, 'Junho', 'Sim', 2, '2º Trimestre', 1, '1º Semestre', 2023, 'Outono'),
  (2023020, '2023-08-12', 12, 'Sábado', 'Não', 'Não', 'Sim', 1, 8, 'Agosto', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2023, 'Inverno');

-- Preencher Dim_Tempo (2024)
INSERT INTO Dim_Tempo (ID_Tempo, Data_, Dia, Dia_Semana_, DiaUtil, Feriado, FimSemana, Quinzena, Mes, nomeMes, FimMes, Trimestre_, nomeTrimestre_, Semestre_, NomeSemestre, Ano, Estacao)
VALUES
  (2024001, '2024-01-12', 12, 'Sexta-feira', 'Sim', 'Não', 'Não', 1, 1, 'Janeiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2024, 'Verão'),
  (2024002, '2024-02-24', 24, 'Sábado', 'Não', 'Não', 'Sim', 2, 2, 'Fevereiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2024, 'Verão'),
  (2024003, '2024-03-31', 31, 'Domingo', 'Não', 'Não', 'Sim', 2, 3, 'Março', 'Sim', 1, '1º Trimestre', 1, '1º Semestre', 2024, 'Outono'),
  (2024004, '2024-04-14', 14, 'Domingo', 'Não', 'Não', 'Sim', 1, 4, 'Abril', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2024, 'Outono'),
  (2024005, '2024-05-15', 15, 'Quarta-feira', 'Sim', 'Não', 'Não', 1, 5, 'Maio', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2024, 'Outono'),
  (2024006, '2024-06-22', 22, 'Sábado', 'Não', 'Não', 'Sim', 2, 6, 'Junho', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2024, 'Inverno'),
  (2024007, '2024-07-07', 7, 'Domingo', 'Não', 'Não', 'Sim', 1, 7, 'Julho', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2024, 'Inverno'),
  (2024008, '2024-07-13', 13, 'Sábado', 'Não', 'Não', 'Sim', 1, 7, 'Julho', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2024, 'Inverno'),
  (2024009, '2024-08-23', 23, 'Sexta-feira', 'Sim', 'Não', 'Não', 2, 8, 'Agosto', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2024, 'Inverno'),
  (2024010, '2024-09-30', 30, 'Segunda-feira', 'Sim', 'Não', 'Não', 2, 9, 'Setembro', 'Sim', 3, '3º Trimestre', 2, '2º Semestre', 2024, 'Primavera');

-- Continuação Dim_Tempo (2024)
INSERT INTO Dim_Tempo (ID_Tempo, Data_, Dia, Dia_Semana_, DiaUtil, Feriado, FimSemana, Quinzena, Mes, nomeMes, FimMes, Trimestre_, nomeTrimestre_, Semestre_, NomeSemestre, Ano, Estacao)
VALUES
  (2024011, '2024-10-05', 5, 'Sábado', 'Não', 'Não', 'Sim', 1, 10, 'Outubro', 'Não', 4, '4º Trimestre', 2, '2º Semestre', 2024, 'Primavera'),
  (2024012, '2024-11-15', 15, 'Sexta-feira', 'Não', 'Sim', 'Não', 2, 11, 'Novembro', 'Não', 4, '4º Trimestre', 2, '2º Semestre', 2024, 'Primavera'),
  (2024013, '2024-12-30', 30, 'Segunda-feira', 'Sim', 'Não', 'Não', 2, 12, 'Dezembro', 'Sim', 4, '4º Trimestre', 2, '2º Semestre', 2024, 'Verão'),
  (2024014, '2024-01-01', 1, 'Segunda-feira', 'Não', 'Sim', 'Não', 1, 1, 'Janeiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2024, 'Verão'),
  (2024015, '2024-02-13', 13, 'Terça-feira', 'Não', 'Sim', 'Não', 1, 2, 'Fevereiro', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2024, 'Verão'),
  (2024016, '2024-03-21', 21, 'Quinta-feira', 'Sim', 'Não', 'Não', 2, 3, 'Março', 'Não', 1, '1º Trimestre', 1, '1º Semestre', 2024, 'Outono'),
  (2024017, '2024-04-21', 21, 'Domingo', 'Não', 'Sim', 'Sim', 2, 4, 'Abril', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2024, 'Outono'),
  (2024018, '2024-05-30', 30, 'Quinta-feira', 'Não', 'Sim', 'Não', 2, 5, 'Maio', 'Sim', 2, '2º Trimestre', 1, '1º Semestre', 2024, 'Outono'),
  (2024019, '2024-06-01', 1, 'Sábado', 'Não', 'Não', 'Sim', 1, 6, 'Junho', 'Não', 2, '2º Trimestre', 1, '1º Semestre', 2024, 'Inverno'),
  (2024020, '2024-08-30', 30, 'Sexta-feira', 'Sim', 'Não', 'Não', 2, 8, 'Agosto', 'Não', 3, '3º Trimestre', 2, '2º Semestre', 2024, 'Inverno');

-- Preencher Dim_Categoria
INSERT INTO Dim_Categoria (id_categoria, cod_categoria, descricao_categoria)
VALUES
  (1, 101, 'Hardware'),
  (2, 102, 'Software'),
  (3, 103, 'Rede'),
  (4, 104, 'Serviços'),
  (5, 105, 'Segurança'),
  (6, 106, 'Banco de Dados'),
  (7, 107, 'E-mail'),
  (8, 108, 'Impressão'),
  (9, 109, 'Acesso'),
  (10, 110, 'Telefonia');

-- Preencher Dim_CanalAtendimento
INSERT INTO Dim_CanalAtendimento (ID_Canal, Cod_Canal_, descricao_canal)
VALUES
  (1, 'TEL', 'Telefone'),
  (2, 'EML', 'E-mail'),
  (3, 'CHT', 'Chat Online'),
  (4, 'APP', 'Aplicativo'),
  (5, 'PRS', 'Presencial');

-- Preencher Dim_Satisfacao
INSERT INTO Dim_Satisfacao (ID_Satisfacao_, Cod_Satisfacao, Nivel_Satisfacao)
VALUES
  (1, 1, 'Muito Insatisfeito'),
  (2, 2, 'Insatisfeito'),
  (3, 3, 'Neutro'),
  (4, 4, 'Satisfeito'),
  (5, 5, 'Muito Satisfeito');

-- Preencher Dim_Prioridade
INSERT INTO Dim_Prioridade (ID_Prioridade_, Nivel_Prioridade_, cod_prioridade)
VALUES
  (1, 'Baixa', 1),
  (2, 'Média', 2),
  (3, 'Alta', 3),
  (4, 'Crítica', 4),
  (5, 'Emergência', 5);

-- Preencher Dim_Status
INSERT INTO Dim_Status (ID_Status_, cod_status, Descricao_Status_)
VALUES
  (1, 1, 'Aberto'),
  (2, 2, 'Em Andamento'),
  (3, 3, 'Aguardando Resposta'),
  (4, 4, 'Resolvido'),
  (5, 5, 'Fechado'),
  (6, 6, 'Cancelado');

-- Preencher Dim_TipoServico
INSERT INTO Dim_TipoServico (ID_Servico_, cod_servico, descricao_servico)
VALUES
  (1, 201, 'Manutenção de Computador'),
  (2, 202, 'Instalação de Software'),
  (3, 203, 'Configuração de Rede'),
  (4, 204, 'Recuperação de Dados'),
  (5, 205, 'Problema de Acesso'),
  (6, 206, 'Vírus/Malware'),
  (7, 207, 'Treinamento'),
  (8, 208, 'Backup'),
  (9, 209, 'Atualização de Sistema'),
  (10, 210, 'Suporte Remoto');

-- Preencher Dim_Suporte
INSERT INTO Dim_Suporte (id_suporte, cod_suporte, descricao_suporte)
VALUES
  (1, 301, 'Suporte Nível 1'),
  (2, 302, 'Suporte Nível 2'),
  (3, 303, 'Suporte Nível 3'),
  (4, 304, 'Suporte Especializado'),
  (5, 305, 'Suporte de Campo');

-- Preencher Dim_Funcionario
INSERT INTO Dim_Funcionario (ID_Funcionario_, Nome, matricula, Departamento, Cargo, Setor)
VALUES
  (1, 'Carlos Silva', 'F001', 'TI', 'Técnico', 'Suporte'),
  (2, 'Ana Oliveira', 'F002', 'TI', 'Analista', 'Infraestrutura'),
  (3, 'Paulo Souza', 'F003', 'TI', 'Especialista', 'Segurança'),
  (4, 'Mariana Costa', 'F004', 'TI', 'Analista', 'Redes'),
  (5, 'Roberto Almeida', 'F005', 'TI', 'Coordenador', 'Banco de Dados'),
  (6, 'Juliana Lima', 'F006', 'TI', 'Técnico', 'Hardware'),
  (7, 'Felipe Martins', 'F007', 'TI', 'Analista', 'Software'),
  (8, 'Carla Ferreira', 'F008', 'TI', 'Especialista', 'Serviços'),
  (9, 'Bruno Carvalho', 'F009', 'TI', 'Técnico', 'Telefonia'),
  (10, 'Daniela Pereira', 'F010', 'TI', 'Gerente', 'TI');

-- Preencher Dim_Departamento
INSERT INTO Dim_Departamento (ID_Departamento_, Nome_Departamento_, Setor_)
VALUES
  (1, 'Administrativo', 'Escritório'),
  (2, 'Financeiro', 'Escritório'),
  (3, 'Marketing', 'Comunicação'),
  (4, 'Vendas', 'Comercial'),
  (5, 'Recursos Humanos', 'Administrativo'),
  (6, 'Produção', 'Operacional'),
  (7, 'Logística', 'Operacional'),
  (8, 'Jurídico', 'Administrativo'),
  (9, 'TI', 'Tecnologia'),
  (10, 'Atendimento', 'Comercial');

-- Preencher Dim_Usuario
INSERT INTO Dim_Usuario (ID_Usuario_, Nome_Usuario_, Cargo_)
VALUES
  (1, 'João Santos', 'Analista Administrativo'),
  (2, 'Maria Pereira', 'Gerente Financeiro'),
  (3, 'José Costa', 'Diretor de Marketing'),
  (4, 'Fernanda Oliveira', 'Vendedor'),
  (5, 'Ricardo Lima', 'Analista de RH'),
  (6, 'Cristina Souza', 'Supervisor de Produção'),
  (7, 'Antônio Ferreira', 'Coordenador de Logística'),
  (8, 'Patricia Carvalho', 'Advogado'),
  (9, 'Luiz Silva', 'Analista de Sistemas'),
  (10, 'Amanda Rodrigues', 'Atendente');

-- Inserir 30 registros na Fato_Chamados para 2023
INSERT INTO Fato_Chamados (
  ID_Chamado_, id_categoria, ID_Satisfacao_, ID_Prioridade_, ID_Status_, 
  ID_Servico_, id_suporte, ID_Funcionario_, ID_Tempo, ID_Usuario_, 
  ID_Departamento_, ID_Canal, tempo_abertura_andamento, tempo_abertura_fechamento, 
  tempo_andamento_fechamento, Tempo_Esperado_Atendimento_, quantidade
)
VALUES
  (1001, 1, 4, 2, 5, 1, 1, 1, 2023001, 1, 1, 2, 125, 553, 428, 480, 1),
  (1002, 2, 3, 2, 5, 2, 2, 2, 2023002, 2, 2, 1, 92, 1474, 1382, 720, 1),
  (1003, 3, 4, 1, 5, 3, 1, 3, 2023003, 3, 3, 3, 138, 1397, 1259, 240, 1),
  (1004, 4, 5, 3, 5, 4, 3, 4, 2023004, 4, 4, 4, 170, 7858, 7688, 960, 1),
  (1005, 5, 3, 3, 5, 5, 2, 5, 2023005, 5, 5, 2, 144, 3133, 2989, 480, 1),
  (1006, 6, 4, 2, 5, 6, 3, 6, 2023006, 6, 6, 1, 141, 2186, 2045, 360, 1),
  (1007, 7, 5, 2, 5, 7, 1, 7, 2023007, 7, 7, 5, 148, 3090, 2942, 240, 1),
  (1008, 8, 3, 1, 5, 8, 2, 8, 2023007, 8, 8, 3, 100, 714, 614, 360, 1),
  (1009, 9, 2, 3, 5, 9, 3, 9, 2023008, 9, 9, 2, 130, 1096, 966, 720, 1),
  (1010, 10, 4, 2, 5, 10, 1, 10, 2023008, 10, 10, 4, 170, 2953, 2783, 480, 1),
  (1011, 2, 5, 1, 5, 2, 2, 1, 2023003, 1, 3, 1, 83, 2876, 2793, 240, 1),
  (1012, 3, 4, 2, 5, 3, 1, 2, 2023004, 2, 4, 3, 150, 422, 272, 360, 1),
  (1013, 4, 3, 3, 5, 4, 3, 3, 2023005, 3, 5, 2, 118, 12211, 12093, 720, 1),
  (1014, 5, 4, 2, 5, 5, 2, 4, 2023006, 4, 6, 4, 130, 3528, 3398, 480, 1),
  (1015, 6, 5, 1, 5, 6, 3, 5, 2023007, 5, 7, 1, 174, 23575, 23401, 240, 1),
  (1016, 7, 2, 3, 5, 7, 1, 6, 2023008, 6, 8, 5, 89, 8109, 8020, 960, 1),
  (1017, 8, 3, 2, 5, 8, 2, 7, 2023009, 7, 9, 3, 120, 2942, 2822, 480, 1),
  (1018, 9, 4, 2, 5, 9, 3, 8, 2023009, 8, 10, 2, 78, 873, 795, 360, 1),
  (1019, 10, 5, 1, 5, 10, 1, 9, 2023010, 9, 1, 4, 100, 2610, 2510, 240, 1),
  (1020, 1, 3, 3, 5, 1, 2, 10, 2023010, 10, 2, 1, 120, 596, 476, 720, 1),
  (1021, 3, 4, 2, 5, 3, 3, 1, 2023001, 1, 5, 3, 140, 332, 192, 480, 1),
  (1022, 4, 5, 2, 5, 4, 1, 2, 2023002, 2, 6, 2, 123, 516, 393, 360, 1),
  (1023, 5, 2, 3, 5, 5, 2, 3, 2023004, 3, 7, 4, 135, 12859, 12724, 720, 1),
  (1024, 6, 3, 2, 5, 6, 3, 4, 2023005, 4, 8, 1, 133, 1313, 1180, 480, 1),
  (1025, 7, 4, 1, 5, 7, 1, 5, 2023006, 5, 9, 5, 99, 1945, 1846, 240, 1),
  (1026, 8, 5, 3, 5, 8, 2, 6, 2023007, 6, 10, 3, 130, 250, 120, 960, 1),
  (1027, 9, 3, 2, 5, 9, 3, 7, 2023008, 7, 1, 2, 107, 7112, 7005, 480, 1),
  (1028, 10, 4, 2, 5, 10, 1, 8, 2023009, 8, 2, 4, 122, 859, 737, 360, 1),
  (1029, 1, 5, 1, 5, 1, 2, 9, 2023009, 9, 3, 1, 204, 2420, 2216, 240, 1),
  (1030, 2, 3, 3, 5, 2, 3, 10, 2023010, 10, 4, 5, 115, 3215, 3100, 720, 1);

-- Inserir 30 registros na Fato_Chamados para 2024
INSERT INTO Fato_Chamados (
  ID_Chamado_, id_categoria, ID_Satisfacao_, ID_Prioridade_, ID_Status_, 
  ID_Servico_, id_suporte, ID_Funcionario_, ID_Tempo, ID_Usuario_, 
  ID_Departamento_, ID_Canal, tempo_abertura_andamento, tempo_abertura_fechamento, 
  tempo_andamento_fechamento, Tempo_Esperado_Atendimento_, quantidade
)
VALUES
  (2001, 2, 4, 2, 5, 2, 2, 2, 2024001, 2, 2, 3, 110, 480, 370, 360, 1),
  (2002, 3, 3, 3, 5, 3, 3, 3, 2024001, 3, 3, 2, 95, 720, 625, 480, 1),
  (2003, 4, 5, 1, 5, 4, 1, 4, 2024002, 4, 4, 1, 140, 300, 160, 240, 1),
  (2004, 5, 4, 2, 5, 5, 2, 5, 2024002, 5, 5, 4, 175, 550, 375, 360, 1),
  (2005, 6, 2, 3, 5, 6, 3, 6, 2024003, 6, 6, 5, 130, 890, 760, 720, 1),
  (2006, 7, 3, 2, 5, 7, 1, 7, 2024003, 7, 7, 1, 85, 420, 335, 480, 1),
  (2007, 8, 4, 1, 5, 8, 2, 8, 2024004, 8, 8, 2, 120, 270, 150, 240, 1),
  (2008, 9, 5, 3, 5, 9, 3, 9, 2024004, 9, 9, 3, 160, 760, 600, 480, 1),
  (2009, 10, 3, 2, 5, 10, 1, 10, 2024005, 10, 10, 4, 90, 410, 320, 360, 1),
  (2010, 1, 4, 2, 5, 1, 2, 1, 2024005, 1, 1, 5, 105, 430, 325, 480, 1),
  (2011, 3, 5, 1, 5, 3, 1, 3, 2024001, 3, 4, 2, 75, 250, 175, 240, 1),
  (2012, 4, 3, 3, 5, 4, 3, 4, 2024002, 4, 5, 3, 170, 820, 650, 720, 1),
  (2013, 5, 4, 2, 5, 5, 2, 5, 2024003, 5, 6, 1, 115, 480, 365, 360, 1),
  (2014, 6, 5, 1, 5, 6, 3, 6, 2024004, 6, 7, 4, 80, 265, 185, 240, 1),
  (2015, 7, 2, 3, 5, 7, 1, 7, 2024005, 7, 8, 5, 195, 940, 745, 720, 1),
  (2016, 8, 3, 2, 5, 8, 2, 8, 2024006, 8, 9, 1, 110, 495, 385, 480, 1),
  (2017, 9, 4, 2, 5, 9, 3, 9, 2024006, 9, 10, 2, 125, 520, 395, 360, 1),
  (2018, 10, 5, 1, 5, 10, 1, 10, 2024007, 10, 1, 3, 70, 235, 165, 240, 1),
  (2019, 1, 3, 3, 5, 1, 2, 1, 2024007, 1, 2, 4, 190, 880, 690, 720, 1),
  (2020, 2, 4, 2, 5, 2, 3, 2, 2024008, 2, 3, 5, 120, 470, 350, 360, 1),
  (2021, 4, 5, 1, 5, 4, 1, 4, 2024006, 4, 6, 2, 85, 240, 155, 240, 1),
  (2022, 5, 3, 3, 5, 5, 2, 5, 2024007, 5, 7, 3, 175, 835, 660, 720, 1),
  (2023, 6, 4, 2, 5, 6, 3, 6, 2024008, 6, 8, 1, 100, 450, 350, 360, 1),
  (2024, 7, 5, 1, 5, 7, 1, 7, 2024008, 7, 9, 4, 65, 220, 155, 240, 1),
  (2025, 8, 2, 3, 5, 8, 2, 8, 2024009, 8, 10, 5, 185, 910, 725, 720, 1),
  (2026, 9, 3, 2, 5, 9, 3, 9, 2024009, 9, 1, 1, 135, 510, 375, 480, 1),
  (2027, 10, 4, 2, 5, 10, 1, 10, 2024010, 10, 2, 2, 95, 440, 345, 360, 1),
  (2028, 1, 5, 1, 5, 1, 2, 1, 2024010, 1, 3, 3, 60, 215, 155, 240, 1),
  (2029, 2, 3, 3, 5, 2, 3, 2, 2024010, 2, 4, 4, 180, 865, 685, 720, 1),
  (2030, 3, 4, 2, 5, 3, 1, 3, 2024010, 3, 5, 5, 130, 460, 330, 360, 1);
