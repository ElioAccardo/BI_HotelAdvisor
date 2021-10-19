
CREATE TABLE dim_data (
                sk_data INTEGER NOT NULL,
                nk_data DATE NOT NULL,
                dia INTEGER NOT NULL,
                mes INTEGER NOT NULL,
                ano INTEGER NOT NULL,
                CONSTRAINT sk_data PRIMARY KEY (sk_data)
);

CREATE SEQUENCE dim_usuario_sk_usuario_seq;

CREATE TABLE dim_usuario (
                sk_usuario INTEGER NOT NULL DEFAULT nextval('dim_usuario_sk_usuario_seq'),
                nk_id_usuario INTEGER NOT NULL,
                nome_usuario VARCHAR(50) NOT NULL,
                cidade VARCHAR(100) NULL,
                provincia VARCHAR(100) NULL,
                pais VARCHAR(50) NULL,
                CONSTRAINT sk_usuario PRIMARY KEY (sk_usuario)
);


ALTER SEQUENCE dim_usuario_sk_usuario_seq OWNED BY dim_usuario.sk_usuario;

CREATE SEQUENCE dim_hotel_sk_hotel_seq;

CREATE TABLE dim_hotel (
                sk_hotel INTEGER NOT NULL DEFAULT nextval('dim_hotel_sk_hotel_seq'),
                nk_id_hotel INTEGER NOT NULL,
                latitude REAL NOT NULL,
                longitude REAL NOT NULL,
                endereco VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                CEP VARCHAR(20) NOT NULL,
                cidade VARCHAR(100) NOT NULL,
                provincia VARCHAR(100) NOT NULL,
                pais VARCHAR(50) NOT NULL,
                site_hotel TEXT NOT NULL,
                valor_medio REAL NOT NULL,
                CONSTRAINT sk_hotel PRIMARY KEY (sk_hotel)
);


ALTER SEQUENCE dim_hotel_sk_hotel_seq OWNED BY dim_hotel.sk_hotel;

CREATE TABLE ft_avaliacao (
                sk_usuario INTEGER NOT NULL,
                sk_hotel INTEGER NOT NULL,
                sk_data INTEGER NOT NULL,
                titulo VARCHAR(150) NOT NULL,
                texto TEXT NOT NULL,
                pontuacao INTEGER NOT NULL,
                qtd_visualizacoes INTEGER NOT NULL,
                site_avaliacao VARCHAR(255) NOT NULL,
                data_avaliacao DATE NOT NULL
);


ALTER TABLE ft_avaliacao ADD CONSTRAINT dim_data_ft_avaliacao_fk
FOREIGN KEY (sk_data)
REFERENCES dim_data (sk_data)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_avaliacao ADD CONSTRAINT dim_usuario_ft_avaliacao_fk
FOREIGN KEY (sk_usuario)
REFERENCES dim_usuario (sk_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ft_avaliacao ADD CONSTRAINT dim_hotel_ft_avaliacao_fk
FOREIGN KEY (sk_hotel)
REFERENCES dim_hotel (sk_hotel)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;