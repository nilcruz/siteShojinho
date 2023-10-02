-- Criação das tabelas --

CREATE TABLE Alunos (
    idAluno INT IDENTITY(1,1) PRIMARY KEY,
    NomeCompleto NVARCHAR(255) NOT NULL,
    DataNascimento DATE NOT NULL,
    RA VARCHAR(20) NOT NULL,
    AutorizacaoSaida VARCHAR(3) NOT NULL CHECK (AutorizacaoSaida IN ('sim', 'nao')),
    idSerie INT
);

CREATE TABLE Series (
    idSerie INT IDENTITY(1,1) PRIMARY KEY,
    NomeSerie NVARCHAR(255) NOT NULL
);

CREATE TABLE Responsaveis (
    idResponsavel INT IDENTITY(1,1) PRIMARY KEY,
    NomeResponsavel NVARCHAR(255) NOT NULL
);

CREATE TABLE Telefones (
    idTelefone INT IDENTITY(1,1) PRIMARY KEY,
    TipoTelefone NVARCHAR(20) NOT NULL,
    NumeroTelefone NVARCHAR(20) NOT NULL
);

CREATE TABLE Justificativas (
    idJustificativa INT IDENTITY(1,1) PRIMARY KEY,
    DataJustificativa DATE NOT NULL,
    DescricaoJustificativa NVARCHAR(MAX)
);

CREATE TABLE AlunoResponsaveis (
    idAluno INT NOT NULL,
    idResponsavel INT NOT NULL,
    PRIMARY KEY (idAluno, idResponsavel)
);

CREATE TABLE AlunoTelefones (
    idAluno INT NOT NULL,
    idTelefone INT NOT NULL,
    PRIMARY KEY (idAluno, idTelefone)
);

CREATE TABLE AlunoJustificativa (
    idAluno INT NOT NULL,
    idJustificativa INT NOT NULL,
    PRIMARY KEY (idAluno, idJustificativa)
);

CREATE TABLE AtestadosMedicos (
    idAtestado INT IDENTITY(1,1) PRIMARY KEY,
    idAluno INT NOT NULL,
    DataEntrega DATE NOT NULL,
    DataAtestado DATE NOT NULL,
    DiasAtestado INT NOT NULL
);

CREATE TABLE ArquivosAluno (
    idArquivo INT IDENTITY(1,1) PRIMARY KEY,
    idAluno INT NOT NULL,
    NomeArquivo NVARCHAR(255) NOT NULL,
    Arquivo VARBINARY(MAX) NOT NULL
);

CREATE TABLE Professores (
    idProfessor INT IDENTITY(1,1) PRIMARY KEY,
    NomeCompleto NVARCHAR(255) NOT NULL,
    RegistroFuncional NVARCHAR(20) NOT NULL,
    Login NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Senha NVARCHAR(255) NOT NULL,
    TelefoneContato NVARCHAR(255) NOT NULL,
    FotoPerfil VARBINARY(MAX)
);

CREATE TABLE SeriesProfessores (
    idProfessor INT NOT NULL,
    idSerie INT NOT NULL,
    PRIMARY KEY (idProfessor, idSerie)
);

CREATE TABLE UsuariosAdministradores (
    idUsuarioAdmin INT IDENTITY(1,1) PRIMARY KEY,
    NomeCompleto NVARCHAR(255) NOT NULL,
    RegistroFuncional NVARCHAR(20) NOT NULL,
    Login NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Senha NVARCHAR(255) NOT NULL,
    TelefoneContato NVARCHAR(255) NOT NULL,
    FotoPerfil VARBINARY(MAX)
);

CREATE TABLE Eventos (
    idEvento INT IDENTITY(1,1) PRIMARY KEY,
    TituloEvento NVARCHAR(255) NOT NULL,
    DataInsercao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DescricaoLembrete NVARCHAR(MAX)
);

-- Criação das chaves estrangeiras --

-- Aluno com Série 1 X N --
ALTER TABLE Alunos ADD CONSTRAINT FK_Alunos_Series FOREIGN KEY (idSerie) REFERENCES Series(idSerie);

-- Aluno Responsaveis N X N --
CREATE TABLE AlunoResponsaveis (
    idAluno INT NOT NULL,
    idResponsavel INT NOT NULL,
    PRIMARY KEY (idAluno, idResponsavel),
    CONSTRAINT FK_AlunoResponsaveis_Alunos FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno),
    CONSTRAINT FK_AlunoResponsaveis_Responsaveis FOREIGN KEY (idResponsavel) REFERENCES Responsaveis(idResponsavel)
);

-- Aluno Telefones N X N --
CREATE TABLE AlunoTelefones (
    idAluno INT NOT NULL,
    idTelefone INT NOT NULL,
    PRIMARY KEY (idAluno, idTelefone),
    CONSTRAINT FK_AlunoTelefones_Alunos FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno),
    CONSTRAINT FK_AlunoTelefones_Telefones FOREIGN KEY (idTelefone) REFERENCES Telefones(idTelefone)
);

-- Aluno Justificativa N X N  --
CREATE TABLE AlunoJustificativa (
    idAluno INT NOT NULL,
    idJustificativa INT NOT NULL,
    PRIMARY KEY (idAluno, idJustificativa),
    CONSTRAINT FK_AlunoJustificativa_Alunos FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno),
    CONSTRAINT FK_AlunoJustificativa_Justificativas FOREIGN KEY (idJustificativa) REFERENCES Justificativas(idJustificativa)
);

-- Atestados Medicos 1 X N --
CREATE TABLE AtestadosMedicos (
    idAtestado INT IDENTITY(1,1) PRIMARY KEY,
    idAluno INT NOT NULL,
    DataEntrega DATE NOT NULL,
    DataAtestado DATE NOT NULL,
    DiasAtestado INT NOT NULL,
    CONSTRAINT FK_AtestadosMedicos_Alunos FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno)
);

-- Arquivos com Aluno 1 X N --
CREATE TABLE ArquivosAluno (
    idArquivo INT IDENTITY(1,1) PRIMARY KEY,
    idAluno INT NOT NULL,
    NomeArquivo NVARCHAR(255) NOT NULL,
    Arquivo VARBINARY(MAX) NOT NULL,
    CONSTRAINT FK_ArquivosAluno_Alunos FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno)
);

-- Tabela SeriesProfessores N X N --
CREATE TABLE SeriesProfessores (
    idProfessor INT NOT NULL,
    idSerie INT NOT NULL,
    PRIMARY KEY (idProfessor, idSerie),
    CONSTRAINT FK_SeriesProfessores_Professores FOREIGN KEY (idProfessor) REFERENCES Professores(idProfessor),
    CONSTRAINT FK_SeriesProfessores_Series FOREIGN KEY (idSerie) REFERENCES Series(idSerie)
);

-- Inserção de dados na tabela Series
INSERT INTO Series (NomeSerie) VALUES
    ('Série A'),
    ('Série B'),
    ('Série C');

-- Inserção de dados na tabela Alunos
INSERT INTO Alunos (NomeCompleto, DataNascimento, RA, AutorizacaoSaida, idSerie) VALUES
    ('Aluno 1', '2000-01-01', 'RA001', 'sim', 1),
    ('Aluno 2', '2001-02-02', 'RA002', 'sim', 2),
    ('Aluno 3', '2002-03-03', 'RA003', 'nao', 3),
    ('Aluno 4', '2002-03-03', 'RA004', 'nao', 1);

-- Inserção de dados na tabela Responsaveis
INSERT INTO Responsaveis (NomeResponsavel) VALUES
    ('Responsavel 1'),
    ('Responsavel 2'),
    ('Responsavel 3');

-- Inserção de dados na tabela Telefones
INSERT INTO Telefones (TipoTelefone, NumeroTelefone) VALUES
    ('Celular', '123-456-7890'),
    ('Fixo', '987-654-3210'),
    ('Celular', '111-222-3333');

-- Inserção de dados na tabela Justificativas
INSERT INTO Justificativas (DataJustificativa, DescricaoJustificativa) VALUES
    ('2023-01-15', 'Justificativa 1'),
    ('2023-02-20', 'Justificativa 2'),
    ('2023-03-25', 'Justificativa 3');

-- Inserção de dados na tabela AlunoResponsaveis
INSERT INTO AlunoResponsaveis (idAluno, idResponsavel) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Inserção de dados na tabela AlunoTelefones
INSERT INTO AlunoTelefones (idAluno, idTelefone) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Inserção de dados na tabela AlunoJustificativa
INSERT INTO AlunoJustificativa (idAluno, idJustificativa) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

-- Inserção de dados na tabela AtestadosMedicos
INSERT INTO AtestadosMedicos (idAluno, DataEntrega, DataAtestado, DiasAtestado) VALUES
    (1, '2023-04-01', '2023-03-15', 15),
    (2, '2023-04-02', '2023-03-20', 10),
    (3, '2023-04-03', '2023-03-25', 5);

-- Inserção de dados na tabela ArquivosAluno
INSERT INTO ArquivosAluno (idAluno, NomeArquivo, Arquivo) VALUES
    (1, 'ArquivoAluno1.pdf', 'conteúdo_binário_do_arquivo1'),
    (2, 'ArquivoAluno2.pdf', 'conteúdo_binário_do_arquivo2'),
    (3, 'ArquivoAluno3.pdf', 'conteúdo_binário_do_arquivo3');

-- Inserção de dados na tabela Professores
INSERT INTO Professores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato) VALUES
    ('Professor 1', 'RF001', 'prof1', 'prof1@example.com', 'senha123', '555-123-4567'),
    ('Professor 2', 'RF002', 'prof2', 'prof2@example.com', 'senha456', '555-987-6543');

-- Inserção de dados na tabela SeriesProfessores
INSERT INTO SeriesProfessores (idProfessor, idSerie) VALUES
    (1, 1),
    (2, 2),
    (1, 3);

-- Inserção de dados na tabela UsuariosAdministradores
INSERT INTO UsuariosAdministradores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato) VALUES
    ('Admin 1', 'AR001', 'admin1', 'admin1@example.com', 'admin123', '555-111-2222'),
    ('Admin 2', 'AR002', 'admin2', 'admin2@example.com', 'admin456', '555-333-4444');

-- Inserção de dados na tabela Eventos
INSERT INTO Eventos (TituloEvento, DescricaoLembrete) VALUES
    ('Evento 1', 'Lembrete para o evento 1'),
    ('Evento 2', 'Lembrete para o evento 2'),
    ('Evento 3', 'Lembrete para o evento 3');
