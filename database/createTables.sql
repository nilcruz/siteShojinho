CREATE TABLE Alunos (
    idAluno INT AUTO_INCREMENT PRIMARY KEY,
    NomeCompleto VARCHAR(255) NOT NULL,
    DataNascimento DATE NOT NULL,
    RA VARCHAR(20) NOT NULL,
    AutorizacaoSaida ENUM('sim', 'nao') NOT NULL,
    idSerie INT
);

CREATE TABLE Series (
    idSerie INT AUTO_INCREMENT PRIMARY KEY,
    NomeSerie VARCHAR(255) NOT NULL
);

CREATE TABLE Responsaveis (
    idResponsavel INT AUTO_INCREMENT PRIMARY KEY,
    NomeResponsavel VARCHAR(255) NOT NULL
);

CREATE TABLE Telefones (
    idTelefone INT AUTO_INCREMENT PRIMARY KEY,
    TipoTelefone VARCHAR(20) NOT NULL,
    NumeroTelefone VARCHAR(20) NOT NULL
);

CREATE TABLE Justificativas (
    idJustificativa INT AUTO_INCREMENT PRIMARY KEY,
    DataJustificativa DATE NOT NULL,
    DescricaoJustificativa TEXT
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
    idAtestado INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT NOT NULL,
    DataEntrega DATE NOT NULL,
    DataAtestado DATE NOT NULL,
    DiasAtestado INT NOT NULL
);

CREATE TABLE ArquivosAluno (
    idArquivo INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT NOT NULL,
    NomeArquivo VARCHAR(255) NOT NULL,
    Arquivo BLOB NOT NULL
);

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

CREATE TABLE SeriesProfessores (
    idProfessor INT NOT NULL,
    idSerie INT NOT NULL,
    PRIMARY KEY (idProfessor, idSerie)
);

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

CREATE TABLE Eventos (
    idEvento INT AUTO_INCREMENT PRIMARY KEY,
    TituloEvento VARCHAR(255) NOT NULL,
    DataInsercao DATETIME DEFAULT CURRENT_TIMESTAMP,
    DescricaoLembrete TEXT
);
