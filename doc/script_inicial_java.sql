

CREATE SEQUENCE consultorio.information_schema.compromisso_agenda_sq_seq;

CREATE TABLE consultorio.information_schema.compromisso (
                compromisso_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.compromisso_agenda_sq_seq'),
                data_compromisso TIMESTAMP NOT NULL,
                paciente_sq INTEGER NOT NULL,
                medico_sq INTEGER NOT NULL,
                compareceu BOOLEAN,
                data_cadastro TIMESTAMP NOT NULL,
                CONSTRAINT compromisso_pk PRIMARY KEY (compromisso_sq)
);


ALTER SEQUENCE consultorio.information_schema.compromisso_agenda_sq_seq OWNED BY consultorio.information_schema.compromisso.compromisso_sq;

CREATE SEQUENCE consultorio.information_schema.consultorio_consultorio_sq_seq;

CREATE TABLE consultorio.information_schema.consultorio (
                consultorio_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.consultorio_consultorio_sq_seq'),
                cnpj_consultorio VARCHAR(14) NOT NULL,
                razao_social_consultorio VARCHAR(255) NOT NULL,
                CONSTRAINT consultorio_pk PRIMARY KEY (consultorio_sq)
);


ALTER SEQUENCE consultorio.information_schema.consultorio_consultorio_sq_seq OWNED BY consultorio.information_schema.consultorio.consultorio_sq;

CREATE TABLE consultorio.information_schema.consultorio_pessoa (
                pessoa_sq INTEGER NOT NULL,
                consultorio_sq INTEGER NOT NULL,
                tipo_pessoa_sq INTEGER NOT NULL,
                CONSTRAINT consultorio_pessoa_pk PRIMARY KEY (pessoa_sq, consultorio_sq)
);


CREATE SEQUENCE consultorio.information_schema.endereco_endereco_sq_seq;

CREATE TABLE consultorio.information_schema.endereco (
                endereco_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.endereco_endereco_sq_seq'),
                logradouro VARCHAR(255) NOT NULL,
                cep VARCHAR(8) NOT NULL,
                numero VARCHAR(10) NOT NULL,
                complemento VARCHAR(50) NOT NULL,
                bairro VARCHAR(255) NOT NULL,
                CONSTRAINT endereco_pk PRIMARY KEY (endereco_sq)
);


ALTER SEQUENCE consultorio.information_schema.endereco_endereco_sq_seq OWNED BY consultorio.information_schema.endereco.endereco_sq;

CREATE SEQUENCE consultorio.information_schema.observacao_observacao_sq_seq;

CREATE TABLE consultorio.information_schema.observacao (
                observacao_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.observacao_observacao_sq_seq'),
                compromisso_sq INTEGER NOT NULL,
                observacao TEXT NOT NULL,
                CONSTRAINT observacao_pk PRIMARY KEY (observacao_sq)
);


ALTER SEQUENCE consultorio.information_schema.observacao_observacao_sq_seq OWNED BY consultorio.information_schema.observacao.observacao_sq;

CREATE SEQUENCE consultorio.information_schema.pessoa_pessoa_sq_seq;

CREATE TABLE consultorio.information_schema.pessoa (
                pessoa_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.pessoa_pessoa_sq_seq'),
                cpf_pessoa VARCHAR(11) NOT NULL,
                nome_pessoa VARCHAR(50) NOT NULL,
                CONSTRAINT pessoa_pk PRIMARY KEY (pessoa_sq)
);


ALTER SEQUENCE consultorio.information_schema.pessoa_pessoa_sq_seq OWNED BY consultorio.information_schema.pessoa.pessoa_sq;

CREATE TABLE consultorio.information_schema.pessoa_endereco (
                pessoa_sq INTEGER NOT NULL,
                endereco_sq INTEGER NOT NULL,
                tipo_endereco_sq INTEGER NOT NULL,
                CONSTRAINT pessoa_endereco_pk PRIMARY KEY (pessoa_sq, endereco_sq)
);


CREATE TABLE consultorio.information_schema.pessoa_telefone (
                pessoa_sq INTEGER NOT NULL,
                telefone_sq INTEGER NOT NULL,
                tipo_telefone_sq INTEGER NOT NULL,
                CONSTRAINT pessoa_telefone_pk PRIMARY KEY (pessoa_sq, telefone_sq)
);


CREATE SEQUENCE consultorio.information_schema.telefone_telefone_sq_seq;

CREATE TABLE consultorio.information_schema.telefone (
                telefone_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.telefone_telefone_sq_seq'),
                numero_telefone VARCHAR(20) NOT NULL,
                ramal_telefone VARCHAR(10) NOT NULL,
                CONSTRAINT telefone_pk PRIMARY KEY (telefone_sq)
);


ALTER SEQUENCE consultorio.information_schema.telefone_telefone_sq_seq OWNED BY consultorio.information_schema.telefone.telefone_sq;

CREATE SEQUENCE consultorio.information_schema.tipo_endereco_tipo_endereco_sq_seq;

CREATE TABLE consultorio.information_schema.tipo_endereco (
                tipo_endereco_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.tipo_endereco_tipo_endereco_sq_seq'),
                descricao_tipo_telefone VARCHAR(50) NOT NULL,
                CONSTRAINT tipo_endereco_pk PRIMARY KEY (tipo_endereco_sq)
);


ALTER SEQUENCE consultorio.information_schema.tipo_endereco_tipo_endereco_sq_seq OWNED BY consultorio.information_schema.tipo_endereco.tipo_endereco_sq;

CREATE SEQUENCE consultorio.information_schema.tipo_dominio_tipo_endereco_sq_seq;

CREATE TABLE consultorio.information_schema.tipo_pessoa (
                tipo_pessoa_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.tipo_dominio_tipo_endereco_sq_seq'),
                descricao_tipo_pessoa VARCHAR(50) NOT NULL,
                CONSTRAINT tipo_pessoa_pk PRIMARY KEY (tipo_pessoa_sq)
);


ALTER SEQUENCE consultorio.information_schema.tipo_dominio_tipo_endereco_sq_seq OWNED BY consultorio.information_schema.tipo_pessoa.tipo_pessoa_sq;

CREATE SEQUENCE consultorio.information_schema.tipo_telefone_tipo_telefone_sq_seq;

CREATE TABLE consultorio.information_schema.tipo_telefone (
                tipo_telefone_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.tipo_telefone_tipo_telefone_sq_seq'),
                descricao_tipo_telefone VARCHAR(50) NOT NULL,
                CONSTRAINT tipo_telefone_pk PRIMARY KEY (tipo_telefone_sq)
);


ALTER SEQUENCE consultorio.information_schema.tipo_telefone_tipo_telefone_sq_seq OWNED BY consultorio.information_schema.tipo_telefone.tipo_telefone_sq;

CREATE SEQUENCE consultorio.information_schema.usuario_usuario_sq_seq;

CREATE TABLE consultorio.information_schema.usuario (
                usuario_sq INTEGER NOT NULL DEFAULT nextval('consultorio.information_schema.usuario_usuario_sq_seq'),
                pessoa_sq INTEGER NOT NULL,
                login VARCHAR(20) NOT NULL,
                senha VARCHAR(50) NOT NULL,
                CONSTRAINT usuario_pk PRIMARY KEY (usuario_sq)
);


ALTER SEQUENCE consultorio.information_schema.usuario_usuario_sq_seq OWNED BY consultorio.information_schema.usuario.usuario_sq;

ALTER TABLE consultorio.information_schema.observacao ADD CONSTRAINT compromisso_observacao_fk
FOREIGN KEY (compromisso_sq)
REFERENCES consultorio.information_schema.compromisso (compromisso_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.consultorio_pessoa ADD CONSTRAINT consultorio_consultorio_pessoa_fk
FOREIGN KEY (consultorio_sq)
REFERENCES consultorio.information_schema.consultorio (consultorio_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.pessoa_endereco ADD CONSTRAINT endereco_pessoa_endereco_fk
FOREIGN KEY (endereco_sq)
REFERENCES consultorio.information_schema.endereco (endereco_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.compromisso ADD CONSTRAINT pessoa_compromisso_fk
FOREIGN KEY (medico_sq)
REFERENCES consultorio.information_schema.pessoa (pessoa_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.compromisso ADD CONSTRAINT pessoa_agenda_fk
FOREIGN KEY (paciente_sq)
REFERENCES consultorio.information_schema.pessoa (pessoa_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.consultorio_pessoa ADD CONSTRAINT pessoa_consultorio_pessoa_fk
FOREIGN KEY (pessoa_sq)
REFERENCES consultorio.information_schema.pessoa (pessoa_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.pessoa_endereco ADD CONSTRAINT pessoa_pessoa_endereco_fk
FOREIGN KEY (pessoa_sq)
REFERENCES consultorio.information_schema.pessoa (pessoa_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.pessoa_telefone ADD CONSTRAINT pessoa_pessoa_telefone_fk
FOREIGN KEY (pessoa_sq)
REFERENCES consultorio.information_schema.pessoa (pessoa_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.usuario ADD CONSTRAINT pessoa_usuario_fk
FOREIGN KEY (pessoa_sq)
REFERENCES consultorio.information_schema.pessoa (pessoa_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.pessoa_telefone ADD CONSTRAINT telefone_pessoa_telefone_fk
FOREIGN KEY (telefone_sq)
REFERENCES consultorio.information_schema.telefone (telefone_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.pessoa_endereco ADD CONSTRAINT tipo_endereco_pessoa_endereco_fk1
FOREIGN KEY (tipo_endereco_sq)
REFERENCES consultorio.information_schema.tipo_endereco (tipo_endereco_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.consultorio_pessoa ADD CONSTRAINT tipo_dominio_consultorio_pessoa_fk
FOREIGN KEY (tipo_pessoa_sq)
REFERENCES consultorio.information_schema.tipo_pessoa (tipo_pessoa_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE consultorio.information_schema.pessoa_telefone ADD CONSTRAINT tipo_telefone_pessoa_telefone_fk
FOREIGN KEY (tipo_telefone_sq)
REFERENCES consultorio.information_schema.tipo_telefone (tipo_telefone_sq)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;