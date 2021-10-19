--Gera SQLs:

select concat('insert into ft_avaliacao (sk_usuario, sk_hotel, sk_data, titulo, texto, pontuacao, qtd_visualizacoes, site_avaliacao, data_avaliacao) values (', sk_usuario, ', ', sk_hotel, ', ', sk_data, ', ''', titulo, ''', ''', texto, ''', ', pontuacao, ', ', qtd_visualizacoes, ', ''', site_avaliacao, ''', ''', date(data_avaliacao), ''');')
from ft_avaliacao
order by 1;

select concat('insert into dim_data (sk_data, nk_data, dia, mes, ano) values (', sk_data, ', ''', date(nk_data), ''', ', dia, ', ', mes, ', ', ano, ');')
from dim_data
order by sk_data;

select concat('insert into dim_usuario (sk_usuario, nk_id_usuario, nome_usuario, cidade, provincia, pais) values (', sk_usuario, ', ', nk_id_usuario, ', ''', replace(nome_usuario, chr(39), chr(39) || chr(39)), ''', ''', replace(cidade, chr(39), chr(39) || chr(39)), ''', ''', provincia, ''', ''', pais, ''');')
from dim_usuario
order by sk_usuario;

select concat('insert into dim_hotel (sk_hotel, nk_id_hotel, latitude, longitude, endereco, nome, cep, cidade, provincia, pais, site_hotel, valor_medio) values (', sk_hotel, ', ', nk_id_hotel, ', ', latitude, ', ', longitude, ', ''', replace(endereco, chr(39), chr(39) || chr(39)), ''', ''', replace(nome, chr(39), chr(39) || chr(39)), ''', ''', cep, ''', ''', replace(cidade, chr(39), chr(39) || chr(39)), ''', ''', provincia, ''', ''', pais, ''', ''', site_hotel, ''', ', valor_medio, ');')
from dim_hotel
order by sk_hotel;