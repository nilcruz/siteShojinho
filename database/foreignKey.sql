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





