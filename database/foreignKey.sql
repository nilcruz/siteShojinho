-- CRIAÇÃO DAS CHAVES ESTRANGEIRAS --

-- Aluno com Série 1 X N --
ALTER TABLE Alunos ADD FOREIGN KEY (idSerie) REFERENCES Series(idSerie);

-- Aluno Responsaveis N X N --
ALTER TABLE AlunoResponsaveis ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);
ALTER TABLE AlunoResponsaveis ADD FOREIGN KEY (idResponsavel) REFERENCES Responsaveis(idResponsavel);

-- Aluno Telefones N X N --
ALTER TABLE AlunoTelefones ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);
ALTER TABLE AlunoTelefones ADD FOREIGN KEY (idTelefone) REFERENCES Telefones(idTelefone);

-- Aluno Justificativa N X N  --
ALTER TABLE AlunoJustificativa ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);
ALTER TABLE AlunoJustificativa ADD FOREIGN KEY (idJustificativa) REFERENCES Justificativas(idJustificativa);

-- Atestados Medicos 1 X N --
ALTER TABLE AtestadosMedicos ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);

-- Arquivos com Aluno 1 X N --
ALTER TABLE ArquivosAluno ADD FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno);

-- Tabela SeriesProfessores N X N --
ALTER TABLE SeriesProfessores ADD FOREIGN KEY (idProfessor) REFERENCES Professores(idProfessor);
ALTER TABLE SeriesProfessores ADD FOREIGN KEY (idSerie) REFERENCES Series(idSerie);
