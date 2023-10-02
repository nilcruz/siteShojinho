-- SELECT NOME DO ALUNO, SÉRIE DO ALUNO, ATESTADOS QUE ESSE ALUNO POSSUI E JUSTIFICATIVAS QUE ESSE ALUNO POSSUI --

SELECT
    A.NomeCompleto AS NomeAluno,
    S.NomeSerie AS Serie,
    AM.DataAtestado AS DataAtestadoMedico,
    AM.DiasAtestado AS DiasAtestadoMedico,
    J.DataJustificativa AS DataJustificativa,
    J.DescricaoJustificativa AS DescricaoJustificativa
FROM
    Alunos A
    JOIN AlunoSerie AS ASR ON A.idAluno = ASR.idAluno
    JOIN Series S ON ASR.idSerie = S.idSerie
    LEFT JOIN AtestadosMedicos AM ON A.idAluno = AM.idAluno
    LEFT JOIN AlunoJustificativa AJ ON A.idAluno = AJ.idAluno
    LEFT JOIN Justificativas J ON AJ.idJustificativa = J.idJustificativa;
