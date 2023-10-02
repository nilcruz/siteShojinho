-- CRIAÇÃO DA TABELA ALUNOS --

CREATE TABLE Alunos (
    idAluno INT AUTO_INCREMENT PRIMARY KEY,
    NomeCompleto VARCHAR(255) NOT NULL,
    DataNascimento DATE NOT NULL,
    RA VARCHAR(20) NOT NULL,
    AutorizacaoSaida ENUM('sim', 'nao') NOT NULL
);

-- CRIAÇÃO DA TABELA RESPONSAVEIS --

CREATE TABLE Responsaveis (
    idResponsavel INT AUTO_INCREMENT PRIMARY KEY,
    NomeResponsavel VARCHAR(255) NOT NULL
);

-- CRIAÇÃO DA TABELA TELEFONES --

CREATE TABLE Telefones (
    idTelefone INT AUTO_INCREMENT PRIMARY KEY,
    TipoTelefone VARCHAR(20) NOT NULL,
    NumeroTelefone VARCHAR(20) NOT NULL
);

-- CRIAÇÃO DA TABELA JUSTIFICATIVAS --

CREATE TABLE Justificativas (
    idJustificativa INT AUTO_INCREMENT PRIMARY KEY,
    DataJustificativa DATE NOT NULL,
    DescricaoJustificativa TEXT
);

-- CRIAÇÃO DA TABELA ASSOCIATIVA ALUNORESPONSAVEIS -- 

CREATE TABLE AlunoResponsaveis (
    idAluno INT NOT NULL,
    idResponsavel INT NOT NULL,
    PRIMARY KEY (idAluno, idResponsavel),
);

-- CRIAÇÃO DA TABELA ASSOCIATIVA ALUNOTELEFONES -- 

CREATE TABLE AlunoTelefones (
    idAluno INT NOT NULL,
    idTelefone INT NOT NULL,
    PRIMARY KEY (idAluno, idTelefone),
);

-- CRIAÇÃO DA TABELA ASSOCIATIVA ALUNOJUSTIFICATIVAS -- 

CREATE TABLE AlunoJustificativa (
    idAluno INT NOT NULL,
    idJustificativa INT NOT NULL,
    PRIMARY KEY (idAluno, idJustificativa),
);


-- CRIAÇÃO DA TABELA ATESTADOSMEDICOS --

CREATE TABLE AtestadosMedicos (
    idAtestado INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT NOT NULL,
    DataEntrega DATE NOT NULL,
    DataAtestado DATE NOT NULL,
    DiasAtestado INT NOT NULL,
);

-- CRIAÇÃO DA TABELA ARQUIVOSALUNO (ARMAZENAR ARQUIVOS PDF)

CREATE TABLE ArquivosAluno (
    idArquivo INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT NOT NULL,
    NomeArquivo VARCHAR(255) NOT NULL,
    Arquivo BLOB NOT NULL,
);


-- CRIAÇÃO DA TABELA PROFESSORES --

CREATE TABLE Professores (
    idProfessor INT AUTO_INCREMENT PRIMARY KEY,
    NomeCompleto VARCHAR(255) NOT NULL,
    RegistroFuncional VARCHAR(20) NOT NULL,
    Login VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    TelefoneContato VARCHAR(255) NOT NULL,
    FotoPerfil BLOB
);

-- CRIAÇÃO DA TABELA SERIES --

CREATE TABLE Series (
    idSerie INT AUTO_INCREMENT PRIMARY KEY,
    NomeSerie VARCHAR(255) NOT NULL
);


-- CRIAÇÃO DA TABELA ASSOCIATIVA SERIEPROFESSORES --
CREATE TABLE SeriesProfessores (
    idProfessor INT NOT NULL,
    idSerie INT NOT NULL,
    PRIMARY KEY (idProfessor, idSerie),
);

-- CRIAÇÃO DA TABELA USUARIOSADMINISTRADORES --
CREATE TABLE UsuariosAdministradores (
    idUsuarioAdmin INT AUTO_INCREMENT PRIMARY KEY,
    NomeCompleto VARCHAR(255) NOT NULL,
    RegistroFuncional VARCHAR(20) NOT NULL,
    Login VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    TelefoneContato VARCHAR(255) NOT NULL,
    FotoPerfil BLOB
);

-- CRIAÇÃO DA TABELA EVENTOS --

CREATE TABLE Eventos (
    idEvento INT AUTO_INCREMENT PRIMARY KEY,
    TituloEvento VARCHAR(255) NOT NULL,
    DataInsercao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DescricaoLembrete TEXT
);


-- CRIAÇÃO DAS CHAVES ESTRANGEIRAS --

-- Adiciona a foreign key na tabela AlunoResponsaveis
ALTER TABLE AlunoResponsaveis
ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);

ALTER TABLE AlunoResponsaveis
ADD FOREIGN KEY (idResponsavel) REFERENCES Responsaveis(idResponsavel);

-- Adiciona a foreign key na tabela AlunoTelefones
ALTER TABLE AlunoTelefones
ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);

ALTER TABLE AlunoTelefones
ADD FOREIGN KEY (idTelefone) REFERENCES TelefonesContato(idTelefone);

-- Adiciona a foreign key na tabela AlunoJustificativa
ALTER TABLE AlunoJustificativa
ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);

ALTER TABLE AlunoJustificativa
ADD FOREIGN KEY (idJustificativa) REFERENCES Justificativas(idJustificativa);

-- Adiciona a foreign key na tabela AtestadosMedicos
ALTER TABLE AtestadosMedicos
ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);

-- Adiciona a foreign key na tabela ArquivosAluno
ALTER TABLE ArquivosAluno
ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);

-- Adiciona a foreign key na tabela SerieProfessores
ALTER TABLE SerieProfessores
ADD FOREIGN KEY (idProfessor) REFERENCES Professores(idProfessor);

ALTER TABLE SerieProfessores
ADD FOREIGN KEY (idSerie) REFERENCES Series(idSerie);





