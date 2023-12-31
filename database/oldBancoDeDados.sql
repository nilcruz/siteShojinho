CREATE TABLE Administrador (
    id_administrador INT PRIMARY KEY AUTO_INCREMENT,
    nm_administrador VARCHAR(255) NOT NULL,
    login_administrador VARCHAR(50) NOT NULL UNIQUE,
    password_administrador VARCHAR(255) NOT NULL
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nm_professor VARCHAR(255) NOT NULL,
    dt_nascimento DATE NOT NULL,
    registro_funcional VARCHAR(20) NOT NULL UNIQUE,
    login_professor VARCHAR(50) NOT NULL UNIQUE,
    password_professor VARCHAR(255) NOT NULL
);

CREATE TABLE Serie (
    id_serie INT PRIMARY KEY AUTO_INCREMENT,
    nm_serie VARCHAR(255) NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor) ON DELETE SET NULL
);

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nm_aluno VARCHAR(255) NOT NULL,
    dt_nasc DATE NOT NULL,
    ra_aluno VARCHAR(20) NOT NULL UNIQUE,
    id_serie INT,
    dt_matricula DATE,
    dt_transferencia DATE,
    FOREIGN KEY (id_serie) REFERENCES Serie(id_serie) ON DELETE CASCADE
);

CREATE TABLE Atestado (
    id_atestado INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    dt_inicio DATE NOT NULL,
    qtd_dias INT NOT NULL,
    dt_retorno DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE
);

CREATE TABLE Justificativa (
    id_justificativa INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    motivo_justificativa VARCHAR(255) NOT NULL,
    dt_justificativa DATE NOT NULL,
    qtd_dias INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno) ON DELETE CASCADE
);



-- INSERTS --


-- Inserção na tabela Professor
INSERT INTO Professor (nome, data_nascimento, registro_funcional, login, password)
VALUES
    ('João Silva', '1980-05-15', 'RF123', 'joao123', 'senha123'),
    ('Maria Santos', '1975-09-20', 'RF456', 'maria456', 'segura123'),
    ('Pedro Souza', '1992-02-10', 'RF789', 'pedro789', 'protegida456');

-- Inserção na tabela Serie
INSERT INTO Serie (nm_serie, id_professor)
VALUES
    ('1º ANO', 1),
    ('2º ANO', 2),
    ('3º ANO', 3);

-- Inserção na tabela Aluno
INSERT INTO Aluno (nm_aluno, dt_nasc, ra_aluno, id_serie, dt_matricula, dt_transferencia)
VALUES
    ('Carlos Rodrigues', '2005-06-30', '12345', 1, '2023-08-25', NULL),
    ('Ana Oliveira', '2004-03-15', '54321', 2, '2023-08-25', NULL),
    ('Lucas Pereira', '2006-09-10', '67890', 1, '2023-08-25', NULL),
    ('Juliana Fernandes', '2003-11-08', '98765', 3, '2023-08-25', NULL),
    ('Mateus Santos', '2007-02-20', '13579', 1, '2023-08-25', NULL);

-- Inserção na tabela Atestado
INSERT INTO Atestado (id_aluno, dt_inicio, qtd_dias, dt_retorno)
VALUES
    (1, '2023-08-01', 5, '2023-08-06'),
    (2, '2023-08-10', 3, '2023-08-13'),
    (3, '2023-08-05', 2, '2023-08-07'),
    (4, '2023-08-15', 4, '2023-08-19'),
    (5, '2023-08-03', 1, '2023-08-04');

-- Inserção na tabela Justificativa
INSERT INTO Justificativa (id_aluno, motivo_justificativa, dt_justificativa, qtd_dias)
VALUES
    (1, 'Doença', '2023-08-02', 2),
    (2, 'Falecimento de um familiar', '2023-08-11', 1),
    (3, 'Participação em evento esportivo', '2023-08-06', 1),
    (4, 'Atestado médico', '2023-08-16', 2),
    (5, 'Viagem familiar', '2023-08-04', 1);


-- SELECTS --

SELECIONA E EXIBE O NOME DE TODOS OS ALUNOS DO 1º ANO

SELECT Aluno.nm_aluno
FROM Aluno
INNER JOIN Serie ON Aluno.id_serie = Serie.id_serie
WHERE Serie.nm_serie = '1º ANO';

SELECIONA E EXIBE O NOME E INFORMAÇÕES DE TODOS OS ATESTADOS QUE UM ALUNO POSSUI

SELECT Aluno.nm_aluno, Atestado.*
FROM Atestado
INNER JOIN Aluno ON Atestado.id_aluno = Aluno.id_aluno
WHERE Aluno.id_aluno = 1;

SELECIONA E EXIBE O NOME E INFORMAÇÕES DE TODOS AS JUSTIFICATIVAS QUE UM ALUNO POSSUI

SELECT Aluno.nm_aluno, Justificativa.*
FROM Justificativa
INNER JOIN Aluno ON Justificativa.id_aluno = Aluno.id_aluno
WHERE Aluno.id_aluno = 2;


SELECIONA E EXIBE O NOME DO PROFESSOR E A QUE SÉRIE ELE PERTENCE

SELECT Professor.nome AS NomeProfessor, Serie.nm_serie AS SerieDoProfessor
FROM Professor
LEFT JOIN Serie ON Professor.id_professor = Serie.id_professor;






