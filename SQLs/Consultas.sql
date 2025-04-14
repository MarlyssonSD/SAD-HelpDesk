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

    
--- IJ)
SELECT 
    f.ID_Funcionario_,
    f.Nome,
    f.Setor,
    COUNT(fc.ID_Chamado_) AS Total_Chamados_Atendidos
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Funcionario f ON fc.ID_Funcionario_ = f.ID_Funcionario_
JOIN 
    Dim_Status s ON fc.ID_Status_ = s.ID_Status_
WHERE 
    s.Descricao_Status_ IN ('Resolvido', 'Fechado')
GROUP BY 
    f.ID_Funcionario_, f.Nome, f.Setor
ORDER BY 
    Total_Chamados_Atendidos DESC;


--- K)
SELECT 
    dpt.Nome_Departamento_,
    dt.Ano,
    dt.Mes,
    dt.Dia,
    dt.nomeMes,
    COUNT(fc.ID_Chamado_) AS Total_Chamados_Abertos
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Usuario u ON fc.ID_Usuario_ = u.ID_Usuario_
JOIN 
    Dim_Departamento dpt ON fc.ID_Departamento_ = dpt.ID_Departamento_
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
JOIN 
    Dim_Status s ON fc.ID_Status_ = s.ID_Status_
WHERE 
    s.Descricao_Status_ = 'Aberto'
GROUP BY 
    dpt.Nome_Departamento_, dt.Ano, dt.Mes, dt.Dia, dt.nomeMes
ORDER BY 
    dt.Ano, dt.Mes, dt.Dia;


--- L)
SELECT 
    ds.descricao_suporte AS Nivel_Suporte,
    COUNT(fc.ID_Chamado_) AS Total_Chamados_Fechados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Suporte ds ON fc.id_suporte = ds.id_suporte
JOIN 
    Dim_Status s ON fc.ID_Status_ = s.ID_Status_
WHERE 
    s.Descricao_Status_ IN ('Fechado', 'Resolvido')
GROUP BY 
    ds.descricao_suporte
ORDER BY 
    Total_Chamados_Fechados DESC;

--- M) N) O)
SELECT 
    -- m) Média de tempo entre abertura e atendimento (N1 + Alta prioridade)
    ROUND(AVG(CASE 
        WHEN dp.Nivel_Prioridade_ = 'Alta' AND ds.cod_suporte = 301
        THEN fc.tempo_abertura_andamento 
    END) / 60 / 24, 2) AS Media_Abertura_Atendimento_N1_Alta,

    -- n) Média de tempo entre abertura e atendimento (N1, todas prioridades)
    ROUND(AVG(CASE 
        WHEN ds.cod_suporte = 301
        THEN fc.tempo_abertura_andamento 
    END) / 60 / 24, 2) AS Media_Abertura_Atendimento_N1_Geral,

    -- o) Média de tempo entre abertura e fechamento
    ROUND(AVG(fc.tempo_abertura_fechamento) / 60 / 24, 2) AS Media_Abertura_Fechamento
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Prioridade dp ON fc.ID_Prioridade_ = dp.ID_Prioridade_
JOIN 
    Dim_Suporte ds ON fc.id_suporte = ds.id_suporte
WHERE 
    (fc.tempo_abertura_andamento IS NOT NULL OR fc.tempo_abertura_fechamento IS NOT NULL);


--- P)
SELECT
    d.Nome_Departamento_,
    COUNT(*) AS Total_Chamados_Em_Atraso
FROM
    Fato_Chamados fc
JOIN
    Dim_Departamento d ON fc.ID_Departamento_ = d.ID_Departamento_
WHERE
    fc.tempo_abertura_fechamento > fc.Tempo_Esperado_Atendimento_
GROUP BY
    d.Nome_Departamento_
ORDER BY
    Total_Chamados_Em_Atraso DESC;


--- Q)
SELECT 
    s.Nivel_Satisfacao,
    COUNT(fc.ID_Chamado_) AS Numero_de_Chamados
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Satisfacao s ON fc.ID_Satisfacao_ = s.ID_Satisfacao_
GROUP BY 
    s.Nivel_Satisfacao, s.Cod_Satisfacao
ORDER BY 
    s.Cod_Satisfacao;


--- =================================================

--- Medias de atendimentos p/ANO
SELECT 
    dt.Ano,
    ROUND(AVG(fc.tempo_abertura_fechamento / 60.0 / 24.0), 2) AS media_dias_atendimento
FROM 
    Fato_Chamados fc
JOIN 
    Dim_Tempo dt ON fc.ID_Tempo = dt.ID_Tempo
WHERE 
    fc.tempo_abertura_fechamento IS NOT NULL
GROUP BY 
    dt.Ano
ORDER BY 
    dt.Ano;


--- Chamados Atrasados
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
    
    
