USE db_sad;

--- A)
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
    
--- D)
-- Por mês
SELECT 
    dt.Ano,
    dt.Mes,
    dt.nomeMes,
    SUM(fc.quantidade) as chamados_fechados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Status ds ON fc.ID_Status_ = ds.ID_Status_
WHERE 
    ds.Descricao_Status_ = 'Fechado'
GROUP BY 
    dt.Ano, dt.Mes, dt.nomeMes
ORDER BY 
    dt.Ano, dt.Mes;

-- Por semestre
SELECT 
    dt.Ano,
    dt.Semestre_,
    dt.NomeSemestre,
    SUM(fc.quantidade) as chamados_fechados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Status ds ON fc.ID_Status_ = ds.ID_Status_
WHERE 
    ds.Descricao_Status_ = 'Fechado'
GROUP BY 
    dt.Ano, dt.Semestre_, dt.NomeSemestre
ORDER BY 
    dt.Ano, dt.Semestre_;

--- H)
SELECT 
    dt.Ano,
    dt.nomeMes,
    dp.Nivel_Prioridade_,
    SUM(fc.quantidade) as total_chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Prioridade dp ON fc.ID_Prioridade_ = dp.ID_Prioridade_
GROUP BY 
    dt.Ano, dt.nomeMes, dp.Nivel_Prioridade_
ORDER BY 
    dt.Ano, dt.Mes, dp.cod_prioridade;
    
--- O)
    SELECT 
    dt.Ano,
    AVG(fc.tempo_abertura_fechamento/60.0/24.0) as media_dias_atendimento
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
GROUP BY 
    dt.Ano
ORDER BY 
    dt.Ano;
    
--- P)
SELECT 
    dt.Ano,
    COUNT(*) as chamados_atrasados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
WHERE 
    fc.tempo_abertura_fechamento > fc.Tempo_Esperado_Atendimento_
GROUP BY 
    dt.Ano
ORDER BY 
    dt.Ano;
--- Q)
SELECT 
    dt.Ano,
    ds.Nivel_Satisfacao,
    SUM(fc.quantidade) as total_chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Satisfacao ds ON fc.ID_Satisfacao_ = ds.ID_Satisfacao_
GROUP BY 
    dt.Ano, ds.Nivel_Satisfacao
ORDER BY 
    dt.Ano, ds.Cod_Satisfacao;