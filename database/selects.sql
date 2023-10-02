-- SELECT NOME DO ALUNO, SÉRIE DO ALUNO, ATESTADOS QUE ESSE ALUNO POSSUI E JUSTIFICATIVAS QUE ESSE ALUNO POSSUI --

SELECT 
    A.NomeCompleto AS NomeAluno,
    S.NomeSerie AS Serie,
    AM.DataAtestado AS DataAtestado,
    AM.DiasAtestado AS DiasAtestado,
    J.DescricaoJustificativa AS Justificativa
FROM Alunos AS A
INNER JOIN Series AS S ON A.idSerie = S.idSerie
LEFT JOIN AtestadosMedicos AS AM ON A.idAluno = AM.idAluno
LEFT JOIN AlunoJustificativa AS AJ ON A.idAluno = AJ.idAluno
LEFT JOIN Justificativas AS J ON AJ.idJustificativa = J.idJustificativa;

-- SELECT NOME DO PROFESSOR, SÉRIE QUE ESTÁ ATRELADO, E OS ALUNOS DESSA SÉRIE -- 
SELECT
    P.NomeCompleto AS NomeProfessor,
    S.NomeSerie AS Serie,
    A.NomeCompleto AS NomeAluno
FROM Professores AS P
INNER JOIN SeriesProfessores AS SP ON P.idProfessor = SP.idProfessor
INNER JOIN Series AS S ON SP.idSerie = S.idSerie
INNER JOIN Alunos AS A ON S.idSerie = A.idSerie
ORDER BY NomeProfessor, Serie, NomeAluno;
