INSERT INTO dim_data
SELECT TO_NUMBER(TO_CHAR(datum,'yyyymmdd'), '99999999') AS sk_data,
datum AS nk_data,
EXTRACT(DAY FROM datum) AS nr_dia,
EXTRACT(MONTH FROM datum) AS nr_mes,
EXTRACT (YEAR FROM datum) AS nr_ano
FROM (
---Data de início do script 01/01/2003, criamos 16 anos de datas:
SELECT '2003-01-01'::DATE + SEQUENCE DAY AS datum
FROM GENERATE_SERIES(0,6208) AS SEQUENCE(DAY)
GROUP BY SEQUENCE.DAY
) dq
ORDER BY 1;