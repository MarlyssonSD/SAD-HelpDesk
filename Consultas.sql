USE db_sad;


-- Chamados abertos por mês
SELECT 
    dt.Ano,
    dt.Mes,
    dt.nomeMes,
    SUM(fc.quantidade) as total_chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
GROUP BY 
    dt.Ano, dt.Mes, dt.nomeMes
ORDER BY 
    dt.Ano, dt.Mes;