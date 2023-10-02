INSERT INTO Series (NomeSerie) VALUES
    ('Série A'),
    ('Série B'),
    ('Série C');

INSERT INTO Alunos (NomeCompleto, DataNascimento, RA, AutorizacaoSaida, idSerie) VALUES
    ('Aluno 1', '2000-01-01', 'RA001', 'sim', 1),
    ('Aluno 2', '2001-02-02', 'RA002', 'sim', 2),
    ('Aluno 3', '2002-03-03', 'RA003', 'nao', 3);

INSERT INTO Responsaveis (NomeResponsavel) VALUES
    ('Responsavel 1'),
    ('Responsavel 2'),
    ('Responsavel 3');

INSERT INTO Telefones (TipoTelefone, NumeroTelefone) VALUES
    ('Celular', '123-456-7890'),
    ('Fixo', '987-654-3210'),
    ('Celular', '111-222-3333');

INSERT INTO Justificativas (DataJustificativa, DescricaoJustificativa) VALUES
    ('2023-01-15', 'Justificativa 1'),
    ('2023-02-20', 'Justificativa 2'),
    ('2023-03-25', 'Justificativa 3');

INSERT INTO AlunoResponsaveis (idAluno, idResponsavel) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO AlunoTelefones (idAluno, idTelefone) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO AlunoJustificativa (idAluno, idJustificativa) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO AtestadosMedicos (idAluno, DataEntrega, DataAtestado, DiasAtestado) VALUES
    (1, '2023-04-01', '2023-03-15', 15),
    (2, '2023-04-02', '2023-03-20', 10),
    (3, '2023-04-03', '2023-03-25', 5);

INSERT INTO ArquivosAluno (idAluno, NomeArquivo, Arquivo) VALUES
    (1, 'ArquivoAluno1.pdf', 'conteúdo_binário_do_arquivo1'),
    (2, 'ArquivoAluno2.pdf', 'conteúdo_binário_do_arquivo2'),
    (3, 'ArquivoAluno3.pdf', 'conteúdo_binário_do_arquivo3');

INSERT INTO Professores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato) VALUES
    ('Professor 1', 'RF001', 'prof1', 'prof1@example.com', 'senha123', '555-123-4567'),
    ('Professor 2', 'RF002', 'prof2', 'prof2@example.com', 'senha456', '555-987-6543');

INSERT INTO SeriesProfessores (idProfessor, idSerie) VALUES
    (1, 1),
    (2, 2),
    (1, 3);

INSERT INTO UsuariosAdministradores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato) VALUES
    ('Admin 1', 'AR001', 'admin1', 'admin1@example.com', 'admin123', '555-111-2222'),
    ('Admin 2', 'AR002', 'admin2', 'admin2@example.com', 'admin456', '555-333-4444');

INSERT INTO Eventos (TituloEvento, DescricaoLembrete) VALUES
    ('Evento 1', 'Lembrete para o evento 1'),
    ('Evento 2', 'Lembrete para o evento 2'),
    ('Evento 3', 'Lembrete para o evento 3');
