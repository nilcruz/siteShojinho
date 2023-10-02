-- INSERTS NA TABELA ALUNOS --

INSERT INTO Alunos (NomeCompleto, DataNascimento, RA, AutorizacaoSaida)
VALUES ('João Silva', '2000-01-15', '12345', 'sim');

INSERT INTO Alunos (NomeCompleto, DataNascimento, RA, AutorizacaoSaida)
VALUES ('Maria Santos', '2001-05-20', '67890', 'nao');

-- INSERTS NA TABELA RESPONSAVEIS --

INSERT INTO Responsaveis (NomeResponsavel)
VALUES ('José Silva');

INSERT INTO Responsaveis (NomeResponsavel)
VALUES ('Ana Santos');

-- INSERTS NA TABELA TELEFONES --

INSERT INTO Telefones (TipoTelefone, NumeroTelefone)
VALUES ('Celular', '123-456-7890');

INSERT INTO Telefones (TipoTelefone, NumeroTelefone)
VALUES ('Residencial', '987-654-3210');

-- INSERTS NA TABELA JUSTIFICATIVAS --

INSERT INTO Justificativas (DataJustificativa, DescricaoJustificativa)
VALUES ('2023-10-01', 'Falta por motivo de saúde.');

INSERT INTO Justificativas (DataJustificativa, DescricaoJustificativa)
VALUES ('2023-10-02', 'Falta por motivo pessoal.');

-- INSERTS NA TABELA ALUNOxRESPONSAVEIS --

-- Vincula o aluno com ID 1 (João Silva) ao responsável com ID 1 (José Silva)
INSERT INTO AlunoResponsaveis (idAluno, idResponsavel)
VALUES (1, 1);

-- Vincula o aluno com ID 2 (Maria Santos) ao responsável com ID 2 (Ana Santos)
INSERT INTO AlunoResponsaveis (idAluno, idResponsavel)
VALUES (2, 2);

-- INSERTS NA TABELA ALUNOxTELEFONES --

-- Vincula o aluno com ID 1 (João Silva) ao telefone com ID 1
INSERT INTO AlunoTelefones (idAluno, idTelefone)
VALUES (1, 1);

-- Vincula o aluno com ID 2 (Maria Santos) ao telefone com ID 2
INSERT INTO AlunoTelefones (idAluno, idTelefone)
VALUES (2, 2);

-- INSERTS NA TABELA ATESTADOSMEDICOS --

-- Inserir atestado médico para o aluno com ID 1 (João Silva)
INSERT INTO AtestadosMedicos (idAluno, DataEntrega, DataAtestado, DiasAtestado)
VALUES (1, '2023-09-25', '2023-09-24', 3);

-- Inserir atestado médico para o aluno com ID 2 (Maria Santos)
INSERT INTO AtestadosMedicos (idAluno, DataEntrega, DataAtestado, DiasAtestado)
VALUES (2, '2023-09-28', '2023-09-27', 2);

-- INSERTS NA TABELA ARQUIVOSALUNO -- 

-- Insere arquivo para o aluno com ID 1 (João Silva)
INSERT INTO ArquivosAluno (idAluno, NomeArquivo, Arquivo)
VALUES (1, 'Atestado_Joao.pdf', 'conteúdo_do_arquivo_em_formato_binário');

-- Insere arquivo para o aluno com ID 2 (Maria Santos)
INSERT INTO ArquivosAluno (idAluno, NomeArquivo, Arquivo)
VALUES (2, 'Atestado_Maria.pdf', 'conteúdo_do_arquivo_em_formato_binário');

-- INSERTS NA TABELA PROFESSORES --

INSERT INTO Professores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato)
VALUES ('Pedro Oliveira', 'P12345', 'pedro123', 'pedro@email.com', 'senha123', '987-654-3210');

INSERT INTO Professores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato)
VALUES ('Ana Souza', 'P67890', 'ana456', 'ana@email.com', 'senha456', '123-456-7890');

-- INSERTS NA TABELA SERIES --

INSERT INTO Series (NomeSerie)
VALUES ('1º Ano');

INSERT INTO Series (NomeSerie)
VALUES ('2º Ano');

-- INSERTS NA TABELA SERIEPROFESSORES --

-- Vincula o professor com ID 1 (Pedro Oliveira) à série com ID 1 (1º Ano)
INSERT INTO SerieProfessores (idProfessor, idSerie)
VALUES (1, 1);

-- Vincula o professor com ID 2 (Ana Souza) à série com ID 2 (2º Ano)
INSERT INTO SerieProfessores (idProfessor, idSerie)
VALUES (2, 2);

-- INSERTS NA TABELA USUARIOSADMINISTRADORES -- 

INSERT INTO UsuariosAdministradores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato)
VALUES ('Admin 1', 'A12345', 'admin1', 'admin1@email.com', 'admin123', '999-888-7777');

INSERT INTO UsuariosAdministradores (NomeCompleto, RegistroFuncional, Login, Email, Senha, TelefoneContato)
VALUES ('Admin 2', 'A67890', 'admin2', 'admin2@email.com', 'admin456', '111-222-3333');

-- INSERTS NA TABELA EVENTOS --

INSERT INTO Eventos (TituloEvento, DescricaoLembrete)
VALUES ('Reunião de Pais', 'Lembrar de confirmar a data da reunião.');

INSERT INTO Eventos (TituloEvento, DescricaoLembrete)
VALUES ('Prova de Matemática', 'Prova de matemática marcada para sexta-feira às 10h.');
