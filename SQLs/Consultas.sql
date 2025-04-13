USE db_sad;

--- A)
-- Chamados abertos por mês
SELECT 
    dt.Ano,
    dt.Mes,
    dt.nomeMes,
    SUM(fc.quantidade) AS total_chamados_abertos
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Status ds ON fc.ID_Status_ = ds.ID_Status_
WHERE 
    ds.Descricao_Status_ = 'Aberto'
GROUP BY 
    dt.Ano, dt.Mes, dt.nomeMes
ORDER BY 
    dt.Ano, dt.Mes;

    
--- B)
-- Chamados abertos por mês
SELECT 
    dt.Ano,
    dt.Mes,
    dt.nomeMes,
    SUM(fc.quantidade) AS total_chamados_fechados
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


--- C)
-- Chamados abertos por mês
SELECT 
    dt.Ano,
    dt.Mes,
    dt.nomeMes,
    SUM(fc.quantidade) AS total_chamados_Em_andamento
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Status ds ON fc.ID_Status_ = ds.ID_Status_
WHERE 
    ds.Descricao_Status_ = 'Em andamento'
GROUP BY 
    dt.Ano, dt.Mes, dt.nomeMes
ORDER BY 
    dt.Ano, dt.Mes;

    
    
--- D)
-- Por dia
SELECT 
    dt.Data_ AS Dia,
    SUM(fc.quantidade) AS Total_Fechados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Status ds ON fc.ID_Status_ = ds.ID_Status_
WHERE 
    ds.Descricao_Status_ = 'Fechado'
GROUP BY 
    dt.Data_
ORDER BY 
    dt.Data_;

-- Por mes
SELECT 
    dt.Ano,
    dt.Mes,
    dt.nomeMes,
    SUM(fc.quantidade) AS Total_Fechados
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
    SUM(fc.quantidade) AS Total_Fechados
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

--- E)

SELECT 
    dd.ID_Departamento_,
    dd.Nome_Departamento_,
    dd.Setor_,
    dt.Data_ AS Dia,
    dt.Mes,
    dt.nomeMes,
    dt.Ano,
    dt.Semestre_,
    dt.NomeSemestre,
    SUM(fc.quantidade) AS Total_Chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Departamento dd ON fc.ID_Departamento_ = dd.ID_Departamento_
GROUP BY 
    dd.ID_Departamento_, dd.Nome_Departamento_, dd.Setor_,
    dt.Data_, dt.Mes, dt.nomeMes, dt.Ano, dt.Semestre_, dt.NomeSemestre
ORDER BY 
    dd.Nome_Departamento_, dt.Data_;


--- F)
SELECT 
    dca.ID_Canal,
    dca.Cod_Canal_,
    dca.descricao_canal,
    dt.Data_ AS Dia,
    dt.Mes,
    dt.nomeMes,
    dt.Ano,
    dt.Semestre_,
    dt.NomeSemestre,
    SUM(fc.quantidade) AS Total_Chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_CanalAtendimento dca ON fc.ID_Canal = dca.ID_Canal
GROUP BY 
    dca.ID_Canal, dca.Cod_Canal_, dca.descricao_canal,
    dt.Data_, dt.Mes, dt.nomeMes, dt.Ano, dt.Semestre_, dt.NomeSemestre
ORDER BY 
    dca.descricao_canal, dt.Data_;

--- G)
SELECT 
    dts.ID_Servico_,
    dts.cod_servico,
    dts.descricao_servico,
    dt.Data_ AS Dia,
    dt.Mes,
    dt.nomeMes,
    dt.Ano,
    dt.Semestre_,
    dt.NomeSemestre,
    SUM(fc.quantidade) AS Total_Chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_TipoServico dts ON fc.ID_Servico_ = dts.ID_Servico_
GROUP BY 
    dts.ID_Servico_, dts.cod_servico, dts.descricao_servico,
    dt.Data_, dt.Mes, dt.nomeMes, dt.Ano, dt.Semestre_, dt.NomeSemestre
ORDER BY 
    dts.descricao_servico, dt.Data_;


--- H)
SELECT 
    dp.ID_Prioridade_,
    dp.Nivel_Prioridade_,
    dp.cod_prioridade,
    dt.Data_ AS Dia,
    dt.Mes,
    dt.nomeMes,
    dt.Ano,
    dt.Semestre_,
    dt.NomeSemestre,
    SUM(fc.quantidade) AS Total_Chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Prioridade dp ON fc.ID_Prioridade_ = dp.ID_Prioridade_
GROUP BY 
    dp.ID_Prioridade_, dp.Nivel_Prioridade_, dp.cod_prioridade,
    dt.Data_, dt.Mes, dt.nomeMes, dt.Ano, dt.Semestre_, dt.NomeSemestre
ORDER BY 
    dp.Nivel_Prioridade_, dt.Data_;

    
--- I)





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
    
    
    
    
    SELECT 
    t.Ano,
    t.Mes,
    t.nomeMes,
    COUNT(*) AS total_chamados_abertos
FROM Fato_Chamados f
JOIN Dim_Tempo t ON f.ID_Tempo = t.ID_Tempo
GROUP BY t.Ano, t.Mes, t.nomeMes
ORDER BY t.Ano, t.Mes;
