insert into dim_data
select to_number(to_char(datum,'yyyymmdd'), '99999999') as sk_data,
datum as nk_data,
extract(day from datum) as nr_dia,
extract(month from datum) as nr_mes,
extract (year from datum) as nr_ano
from (
---incluir aqui a data de início do script, criaremos 15 anos de datas
select '2003-01-01'::date + sequence.day as datum
from generate_series(0,6208) as sequence(day)
group by sequence.day
) dq
order by 1;