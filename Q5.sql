--- Por semestre
--- a) e d)


SELECT
    t.Ano,
    CASE
        WHEN t.Mes BETWEEN 1 AND 6 THEN 'Semestre 1'
        WHEN t.Mes BETWEEN 7 AND 12 THEN 'Semestre 2'
    END AS Semestre,
    COUNT(fc.ID_Chamado_) AS NumeroChamadosAbertos
FROM Fato_Chamados fc
JOIN Dim_Tempo t ON fc.ID_Tempo = t.ID_Tempo
GROUP BY t.Ano,
         CASE
             WHEN t.Mes BETWEEN 1 AND 6 THEN 'Semestre 1'
             WHEN t.Mes BETWEEN 7 AND 12 THEN 'Semestre 2'
         END
ORDER BY t.Ano, Semestre;


--- e)
SELECT
    t.Ano,
    CASE
        WHEN t.Mes BETWEEN 1 AND 6 THEN 'Semestre 1'
        WHEN t.Mes BETWEEN 7 AND 12 THEN 'Semestre 2'
    END AS Semestre,
    dep.Nome_Departamento_,
    COUNT(fc.ID_Chamado_) AS NumeroChamados
FROM Fato_Chamados fc
JOIN Dim_Tempo t ON fc.ID_Tempo = t.ID_Tempo
JOIN Dim_Departamento dep ON fc.ID_Departamento_ = dep.ID_Departamento_
GROUP BY t.Ano,
         CASE
             WHEN t.Mes BETWEEN 1 AND 6 THEN 'Semestre 1'
             WHEN t.Mes BETWEEN 7 AND 12 THEN 'Semestre 2'
         END,
         dep.Nome_Departamento_
ORDER BY t.Ano, Semestre, dep.Nome_Departamento_;


--- h)
SELECT
    t.Ano,
    CASE
        WHEN t.Mes BETWEEN 1 AND 6 THEN 'Semestre 1'
        WHEN t.Mes BETWEEN 7 AND 12 THEN 'Semestre 2'
    END AS Semestre,
    p.Nivel_Prioridade_,
    COUNT(fc.ID_Chamado_) AS NumeroChamadosAbertos
FROM Fato_Chamados fc
JOIN Dim_Tempo t ON fc.ID_Tempo = t.ID_Tempo
JOIN Dim_Prioridade p ON fc.ID_Prioridade_ = p.ID_Prioridade_
GROUP BY t.Ano,
         CASE
             WHEN t.Mes BETWEEN 1 AND 6 THEN 'Semestre 1'
             WHEN t.Mes BETWEEN 7 AND 12 THEN 'Semestre 2'
         END,
         p.Nivel_Prioridade_
ORDER BY t.Ano, Semestre, p.Nivel_Prioridade_;