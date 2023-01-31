CREATE TABLE t_ssp_bairro (
    cd_bairro           NUMBER NOT NULL,
    t_ssp_cidade_cd_cid NUMBER NOT NULL,
    nm_bairro           VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN t_ssp_bairro.cd_bairro IS
    'ID de identificacao do bairro';

COMMENT ON COLUMN t_ssp_bairro.nm_bairro IS
    'Nome do bairro';

ALTER TABLE t_ssp_bairro ADD CONSTRAINT t_ssp_bairro_pk PRIMARY KEY ( cd_bairro );

CREATE TABLE t_ssp_camera (
    cd_camera NUMBER NOT NULL,
    nm_camera VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN t_ssp_camera.cd_camera IS
    'ID de identificacao da camera';

COMMENT ON COLUMN t_ssp_camera.nm_camera IS
    'Nome complementar para identificacao da camera';

ALTER TABLE t_ssp_camera ADD CONSTRAINT t_ssp_camera_pk PRIMARY KEY ( cd_camera );

ALTER TABLE t_ssp_camera ADD CONSTRAINT t_ssp_camera_nm_camera_un UNIQUE ( nm_camera );

CREATE TABLE t_ssp_cat_vaga (
    cd_categoria_vaga    NUMBER NOT NULL,
    nr_largura_vaga      NUMBER(5) NOT NULL,
    nr_comprimento_vaga  NUMBER(5) NOT NULL,
    vl_hora_inicial      NUMBER(6, 2) NOT NULL,
    vl_hora_complementar NUMBER(5, 2),
    st_preferencial      CHAR(1) NOT NULL
);

ALTER TABLE t_ssp_cat_vaga
    ADD CHECK ( st_preferencial IN ( 'N', 'S' ) );

COMMENT ON COLUMN t_ssp_cat_vaga.cd_categoria_vaga IS
    'ID de identificacao da categoria da vaga';

COMMENT ON COLUMN t_ssp_cat_vaga.nr_largura_vaga IS
    'Largura em centimetros da vaga';

COMMENT ON COLUMN t_ssp_cat_vaga.nr_comprimento_vaga IS
    'comprimento em centímetros da vaga';

COMMENT ON COLUMN t_ssp_cat_vaga.vl_hora_inicial IS
    'Valor da hora inicial de custo da vaga';

COMMENT ON COLUMN t_ssp_cat_vaga.vl_hora_complementar IS
    'Valor complementar para cada hora adicional a vaga';

COMMENT ON COLUMN t_ssp_cat_vaga.st_preferencial IS
    'Situação de categoria de vaga preferencial: (S)im ou (N)ao';

ALTER TABLE t_ssp_cat_vaga ADD CONSTRAINT t_ssp_cat_vaga_pk PRIMARY KEY ( cd_categoria_vaga );

CREATE TABLE t_ssp_cidade (
    cd_cidade           NUMBER NOT NULL,
    t_ssp_estado_sg_est CHAR(2) NOT NULL,
    nm_cidade           VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN t_ssp_cidade.cd_cidade IS
    'ID de identificacao da cidade';

COMMENT ON COLUMN t_ssp_cidade.nm_cidade IS
    'Nome da cidade';

ALTER TABLE t_ssp_cidade ADD CONSTRAINT t_ssp_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE t_ssp_cli_fisico (
    cd_cli_fisico            NUMBER NOT NULL,
    t_ssp_cliente_cd_cliente NUMBER NOT NULL,
    nr_cpf                   VARCHAR2(14) NOT NULL,
    fl_sexo_biologico        CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_ssp_cli_fisico.cd_cli_fisico IS
    'ID do cliente fisico';

COMMENT ON COLUMN t_ssp_cli_fisico.nr_cpf IS
    'Campo que deve conter o número do CPF em formato de txt 
999. 999.999-99';

COMMENT ON COLUMN t_ssp_cli_fisico.fl_sexo_biologico IS
    'Campo deve conter o sexo biologico do cliente : (F)eminino ou (M)asculino';

CREATE UNIQUE INDEX t_ssp_cli_fisico__idx ON
    t_ssp_cli_fisico (
        t_ssp_cliente_cd_cliente
    ASC );

ALTER TABLE t_ssp_cli_fisico ADD CONSTRAINT t_ssp_cli_fisico_pk PRIMARY KEY ( cd_cli_fisico );

ALTER TABLE t_ssp_cli_fisico ADD CONSTRAINT t_ssp_cli_fisico_nr_cpf_un UNIQUE ( nr_cpf );

CREATE TABLE t_ssp_cli_juridico (
    cd_cli_juridico          NUMBER NOT NULL,
    t_ssp_cliente_cd_cliente NUMBER NOT NULL,
    nr_cnpj                  VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN t_ssp_cli_juridico.cd_cli_juridico IS
    'ID do cliente juridico';

COMMENT ON COLUMN t_ssp_cli_juridico.nr_cnpj IS
    'Campo que deve ser preenchido com o CNPJ do cliente
99.999.999/9999-99';

CREATE UNIQUE INDEX t_ssp_cli_juridico__idx ON
    t_ssp_cli_juridico (
        t_ssp_cliente_cd_cliente
    ASC );

ALTER TABLE t_ssp_cli_juridico ADD CONSTRAINT t_ssp_cli_juridico_pk PRIMARY KEY ( cd_cli_juridico );

ALTER TABLE t_ssp_cli_juridico ADD CONSTRAINT t_ssp_cli_juridico_nr_cnpj_un UNIQUE ( nr_cnpj );

CREATE TABLE t_ssp_cliente (
    cd_cliente  NUMBER NOT NULL,
    nm_cliente  VARCHAR2(50) NOT NULL,
    st_cliente  CHAR(1) NOT NULL,
    ds_email    VARCHAR2(50) NOT NULL,
    nr_telefone VARCHAR2(20),
    nm_login    VARCHAR2(100) NOT NULL,
    ds_senha    VARCHAR2(40) NOT NULL
);

ALTER TABLE t_ssp_cliente
    ADD CHECK ( st_cliente IN ( 'A', 'I' ) );


COMMENT ON COLUMN t_ssp_cliente.cd_cliente IS
    'ID de identificacao do cliente';

COMMENT ON COLUMN t_ssp_cliente.nm_cliente IS
    'Nome do cliente';

COMMENT ON COLUMN t_ssp_cliente.st_cliente IS
    'Status do usuário
(A)tivo ou (I)nativo';

COMMENT ON COLUMN t_ssp_cliente.ds_email IS
    'campo que deve conter o email do cliente';

COMMENT ON COLUMN t_ssp_cliente.nr_telefone IS
    'Campo que deve conter o numero do telefone do usuario
(99)99999-9999';

COMMENT ON COLUMN t_ssp_cliente.nm_login IS
    'Campo que deve conter o login de acesso a ferramenta do cliente cadastrado';

COMMENT ON COLUMN t_ssp_cliente.ds_senha IS
    'Campo que deve armazenar a senha de acesso do cliente';

ALTER TABLE t_ssp_cliente ADD CONSTRAINT t_ssp_cliente_pk PRIMARY KEY ( cd_cliente );

ALTER TABLE t_ssp_cliente ADD CONSTRAINT t_ssp_cliente_nm_login_un UNIQUE ( nm_login );

ALTER TABLE t_ssp_cliente ADD CONSTRAINT t_ssp_cliente_nr_telefone_un UNIQUE ( nr_telefone );

CREATE TABLE t_ssp_cor_veiculo (
    cd_cor NUMBER NOT NULL,
    nm_cor VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_ssp_cor_veiculo.cd_cor IS
    'ID de identificacao de cor do veiculo';

COMMENT ON COLUMN t_ssp_cor_veiculo.nm_cor IS
    'Campo com nome da cor do veículo';

ALTER TABLE t_ssp_cor_veiculo ADD CONSTRAINT t_ssp_cor_veiculo_pk PRIMARY KEY ( cd_cor );

CREATE TABLE t_ssp_dados_financeiros (
    cd_dados_financeiros     NUMBER NOT NULL,
    t_ssp_cliente_cd_cliente NUMBER NOT NULL,
    nr_cartao                NUMBER(16) NOT NULL,
    nr_digito_cartao         NUMBER(3) NOT NULL,
    dt_vencimento_cartao     DATE NOT NULL
);

COMMENT ON COLUMN t_ssp_dados_financeiros.cd_dados_financeiros IS
    'ID de identificacao dos dados financeiros do cliente';

COMMENT ON COLUMN t_ssp_dados_financeiros.nr_cartao IS
    'Número do cartao do cliente';

COMMENT ON COLUMN t_ssp_dados_financeiros.nr_digito_cartao IS
    'Número do dígito do cartao do cliente';

COMMENT ON COLUMN t_ssp_dados_financeiros.dt_vencimento_cartao IS
    'Data de vencimento do cartao do cliente';

ALTER TABLE t_ssp_dados_financeiros ADD CONSTRAINT t_ssp_dados_financeiros_pk PRIMARY KEY ( cd_dados_financeiros );

CREATE TABLE t_ssp_estado (
    sg_estado CHAR(2) NOT NULL,
    nm_estado VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN t_ssp_estado.sg_estado IS
    'Sigla de identificacao do estado - PK';

COMMENT ON COLUMN t_ssp_estado.nm_estado IS
    'Nome do estado';

ALTER TABLE t_ssp_estado ADD CONSTRAINT t_ssp_estado_pk PRIMARY KEY ( sg_estado );

ALTER TABLE t_ssp_estado ADD CONSTRAINT t_ssp_estado_nm_estado_un UNIQUE ( nm_estado );

CREATE TABLE t_ssp_fabricante_veiculo (
    cd_fabricante NUMBER NOT NULL,
    nm_fabricante VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN t_ssp_fabricante_veiculo.cd_fabricante IS
    'ID de identificacao do fabricante';

COMMENT ON COLUMN t_ssp_fabricante_veiculo.nm_fabricante IS
    'Nome do fabricante';

ALTER TABLE t_ssp_fabricante_veiculo ADD CONSTRAINT t_ssp_fabricante_veiculo_pk PRIMARY KEY ( cd_fabricante );

CREATE TABLE t_ssp_fiscal (
    cd_fiscal         NUMBER(5) NOT NULL,
    nm_fiscal         VARCHAR2(100) NOT NULL,
    ds_interno_fiscal VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN t_ssp_fiscal.cd_fiscal IS
    'ID de identificacao do fiscal';

COMMENT ON COLUMN t_ssp_fiscal.nm_fiscal IS
    'Nome do fiscal';

COMMENT ON COLUMN t_ssp_fiscal.ds_interno_fiscal IS
    'Campo destinado ao código/numeração interna de cadastro do fiscal';

ALTER TABLE t_ssp_fiscal ADD CONSTRAINT t_ssp_fiscal_pk PRIMARY KEY ( cd_fiscal );

ALTER TABLE t_ssp_fiscal ADD CONSTRAINT t_ssp_fiscal_ds_intr_fiscal_un UNIQUE ( ds_interno_fiscal );

CREATE TABLE t_ssp_log_cli (
    cd_log_cli               NUMBER NOT NULL,
    t_ssp_logr_cd_logr       NUMBER(5) NOT NULL,
    t_ssp_cliente_cd_cliente NUMBER NOT NULL,
    nr_numero_logradouro     INTEGER NOT NULL,
    ds_complemento_log       VARCHAR2(100)
);

COMMENT ON COLUMN t_ssp_log_cli.cd_log_cli IS
    'ID de identificacao da associacao cliente - logradouro';

COMMENT ON COLUMN t_ssp_log_cli.nr_numero_logradouro IS
    'Número do logradouro do cliente';

COMMENT ON COLUMN t_ssp_log_cli.ds_complemento_log IS
    'Complemento das informacoes do logradouro';

ALTER TABLE t_ssp_log_cli ADD CONSTRAINT t_ssp_log_cli_pk PRIMARY KEY ( cd_log_cli );

CREATE TABLE t_ssp_log_fisc (
    cd_log_fiscal          NUMBER(5) NOT NULL,
    t_ssp_fiscal_cd_fiscal NUMBER(5) NOT NULL,
    t_ssp_logr_cd_logr     NUMBER(5) NOT NULL,
    st_log_fiscal          CHAR(1) NOT NULL
);

COMMENT ON COLUMN t_ssp_log_fisc.cd_log_fiscal IS
    'ID de identificacao da ligacao logradouro x fiscal';

COMMENT ON COLUMN t_ssp_log_fisc.st_log_fiscal IS
    'Campo que determina se o fiscal está ativo para monitorar logradouro:
(A)tivo ou (I)nativo
';

ALTER TABLE t_ssp_log_fisc
    ADD CONSTRAINT t_ssp_log_fisc_pk PRIMARY KEY ( cd_log_fiscal,
                                                   t_ssp_fiscal_cd_fiscal,
                                                   t_ssp_logr_cd_logr );

CREATE TABLE t_ssp_log_vaga (
    cd_log_vaga        NUMBER NOT NULL,
    t_ssp_logr_cd_logr NUMBER(5) NOT NULL,
    t_ssp_vaga_cd_vaga NUMBER NOT NULL
);

COMMENT ON COLUMN t_ssp_log_vaga.cd_log_vaga IS
    'Id da associacao vaga - logradouro';

ALTER TABLE t_ssp_log_vaga ADD CONSTRAINT t_ssp_log_vaga_pk PRIMARY KEY ( cd_log_vaga );

CREATE TABLE t_ssp_logradouro (
    cd_logradouro      NUMBER(5) NOT NULL,
    t_ssp_bair_cd_bair NUMBER NOT NULL,
    nm_logradouro      VARCHAR2(100) NOT NULL,
    nr_cep             VARCHAR2(8) NOT NULL
);

COMMENT ON COLUMN t_ssp_logradouro.cd_logradouro IS
    'Id de identifdifacao do logradouro';

COMMENT ON COLUMN t_ssp_logradouro.nm_logradouro IS
    'Nome do logradouro';

COMMENT ON COLUMN t_ssp_logradouro.nr_cep IS
    'Número de CEP armazenado em VARCHAR para validacao e permitir 0 a esquerda';

ALTER TABLE t_ssp_logradouro ADD CONSTRAINT t_ssp_logradouro_pk PRIMARY KEY ( cd_logradouro );

ALTER TABLE t_ssp_logradouro ADD CONSTRAINT t_ssp_logradouro_nr_cep_un UNIQUE ( nr_cep );

CREATE TABLE t_ssp_modelo_veiculo (
    cd_modelo_veiculo      NUMBER NOT NULL,
    nm_modelo_veiculo      VARCHAR2(40) NOT NULL,
    nr_largura_veiculo     NUMBER(5) NOT NULL,
    nr_comprimento_veiculo NUMBER(5) NOT NULL
);

COMMENT ON COLUMN t_ssp_modelo_veiculo.cd_modelo_veiculo IS
    'ID de identificacao modelo do veiculo';

COMMENT ON COLUMN t_ssp_modelo_veiculo.nm_modelo_veiculo IS
    'nome da modelo do veiculo';

COMMENT ON COLUMN t_ssp_modelo_veiculo.nr_largura_veiculo IS
    'largura em centimetros do veículo';

COMMENT ON COLUMN t_ssp_modelo_veiculo.nr_comprimento_veiculo IS
    'comprimento em centimetros do veiculo';

ALTER TABLE t_ssp_modelo_veiculo ADD CONSTRAINT t_ssp_modelo_veiculo_pk PRIMARY KEY ( cd_modelo_veiculo );

CREATE TABLE t_ssp_ocorrencia (
    cd_ocorrencia            NUMBER NOT NULL,
    t_ssp_vaga_cd_vaga       NUMBER NOT NULL,
    t_ssp_veiculo_cd_veiculo NUMBER,
    dt_inicio_ocorrencia     DATE NOT NULL,
    hr_inicial_ocorrencia    VARCHAR2(20) NOT NULL,
    dt_fim_ocorrencia        DATE,
    hr_fim_ocorrencia        VARCHAR2(20),
    t_ssp_fiscal_cd_fiscal   NUMBER(5),
    dc_ocorrencia            VARCHAR2(4000)
);

COMMENT ON COLUMN t_ssp_ocorrencia.cd_ocorrencia IS
    'Id de identificacao da ocorrencia';

COMMENT ON COLUMN t_ssp_ocorrencia.dt_inicio_ocorrencia IS
    'Data da ocorrência a ser registrada na primeira ação de estacionar o veículo';

COMMENT ON COLUMN t_ssp_ocorrencia.hr_inicial_ocorrencia IS
    'Hora do início da ocorrencia';

COMMENT ON COLUMN t_ssp_ocorrencia.dt_fim_ocorrencia IS
    'data do fim da ocorrencia a ser armazenada quando veículo sair da vaga';

COMMENT ON COLUMN t_ssp_ocorrencia.hr_fim_ocorrencia IS
    'Data do fim da ocorrência';

COMMENT ON COLUMN t_ssp_ocorrencia.dc_ocorrencia IS
    'Esse campo está destinado a possíveis observações da ocorrência';

ALTER TABLE t_ssp_ocorrencia ADD CONSTRAINT t_ssp_ocorrencia_pk PRIMARY KEY ( cd_ocorrencia );

CREATE TABLE t_ssp_sensor (
    cd_sensor NUMBER NOT NULL,
    st_sensor CHAR(1)
);

ALTER TABLE t_ssp_sensor
    ADD CHECK ( st_sensor IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_ssp_sensor.cd_sensor IS
    'ID de identificacao do sensor da vaga';

COMMENT ON COLUMN t_ssp_sensor.st_sensor IS
    'Campo para status do sensor: (A)tivo e (I)nativo';

ALTER TABLE t_ssp_sensor ADD CONSTRAINT t_ssp_sensor_pk PRIMARY KEY ( cd_sensor );

CREATE TABLE t_ssp_vaga (
    cd_vaga                    NUMBER NOT NULL,
    t_ssp_cat_vaga_cd_cat_vaga NUMBER NOT NULL,
    t_ssp_camera_cd_cam        NUMBER NOT NULL,
    t_ssp_sensor_cd_sen        NUMBER NOT NULL,
    nm_vaga                    VARCHAR2(10) NOT NULL,
    st_vaga                    CHAR(1) NOT NULL
);

ALTER TABLE t_ssp_vaga
    ADD CHECK ( st_vaga IN ( 'L', 'O' ) );

COMMENT ON COLUMN t_ssp_vaga.cd_vaga IS
    'ID de identificação da vaga';

COMMENT ON COLUMN t_ssp_vaga.nm_vaga IS
    'Nome da vaga';

COMMENT ON COLUMN t_ssp_vaga.st_vaga IS
    'Status da vaga - (L)ivre ou (O)cupada';

ALTER TABLE t_ssp_vaga ADD CONSTRAINT t_ssp_vaga_pk PRIMARY KEY ( cd_vaga );

ALTER TABLE t_ssp_vaga ADD CONSTRAINT t_ssp_vaga_nm_vaga_un UNIQUE ( nm_vaga );

CREATE TABLE t_ssp_veiculo (
    cd_veiculo                 NUMBER NOT NULL,
    t_ssp_mod_veic_cd_mod_veic NUMBER NOT NULL,
    t_ssp_cliente_cd_cliente   NUMBER NOT NULL,
    nr_placa                   VARCHAR2(8) NOT NULL,
    st_veiculo                 CHAR(1) NOT NULL,
    t_ssp_fabr_veic_cd_fabr    NUMBER NOT NULL,
    t_ssp_cor_veic_cd_cor      NUMBER NOT NULL
);

ALTER TABLE t_ssp_veiculo
    ADD CHECK ( st_veiculo IN ( 'A', 'I' ) );

COMMENT ON COLUMN t_ssp_veiculo.cd_veiculo IS
    'ID de identificacao do veiculo';

COMMENT ON COLUMN t_ssp_veiculo.nr_placa IS
    'Identificacao da placa do carro';

COMMENT ON COLUMN t_ssp_veiculo.st_veiculo IS
    'Status do veiculo (A)ativo ou (I)nativo';

ALTER TABLE t_ssp_veiculo ADD CONSTRAINT t_ssp_veiculo_pk PRIMARY KEY ( cd_veiculo );

ALTER TABLE t_ssp_bairro
    ADD CONSTRAINT t_ssp_bairro_t_ssp_cidade_fk FOREIGN KEY ( t_ssp_cidade_cd_cid )
        REFERENCES t_ssp_cidade ( cd_cidade );

ALTER TABLE t_ssp_cidade
    ADD CONSTRAINT t_ssp_cidade_t_ssp_estado_fk FOREIGN KEY ( t_ssp_estado_sg_est )
        REFERENCES t_ssp_estado ( sg_estado );

ALTER TABLE t_ssp_cli_fisico
    ADD CONSTRAINT t_ssp_cli_fis_t_ssp_cli_fk FOREIGN KEY ( t_ssp_cliente_cd_cliente )
        REFERENCES t_ssp_cliente ( cd_cliente );

ALTER TABLE t_ssp_cli_juridico
    ADD CONSTRAINT t_ssp_cli_jur_t_ssp_cli_fk FOREIGN KEY ( t_ssp_cliente_cd_cliente )
        REFERENCES t_ssp_cliente ( cd_cliente );

ALTER TABLE t_ssp_dados_financeiros
    ADD CONSTRAINT t_ssp_dados_finan_t_ssp_cli_fk FOREIGN KEY ( t_ssp_cliente_cd_cliente )
        REFERENCES t_ssp_cliente ( cd_cliente );

ALTER TABLE t_ssp_log_cli
    ADD CONSTRAINT t_ssp_log_cli_t_ssp_cli_fk FOREIGN KEY ( t_ssp_cliente_cd_cliente )
        REFERENCES t_ssp_cliente ( cd_cliente );

ALTER TABLE t_ssp_log_cli
    ADD CONSTRAINT t_ssp_log_cli_t_ssp_logr_fk FOREIGN KEY ( t_ssp_logr_cd_logr )
        REFERENCES t_ssp_logradouro ( cd_logradouro );

ALTER TABLE t_ssp_log_fisc
    ADD CONSTRAINT t_ssp_log_fisc_t_ssp_fiscal_fk FOREIGN KEY ( t_ssp_fiscal_cd_fiscal )
        REFERENCES t_ssp_fiscal ( cd_fiscal );

ALTER TABLE t_ssp_log_fisc
    ADD CONSTRAINT t_ssp_log_fisc_t_ssp_logr_fk FOREIGN KEY ( t_ssp_logr_cd_logr )
        REFERENCES t_ssp_logradouro ( cd_logradouro );

ALTER TABLE t_ssp_log_vaga
    ADD CONSTRAINT t_ssp_log_vaga_t_ssp_logr_fk FOREIGN KEY ( t_ssp_logr_cd_logr )
        REFERENCES t_ssp_logradouro ( cd_logradouro );

ALTER TABLE t_ssp_log_vaga
    ADD CONSTRAINT t_ssp_log_vaga_t_ssp_vaga_fk FOREIGN KEY ( t_ssp_vaga_cd_vaga )
        REFERENCES t_ssp_vaga ( cd_vaga );

ALTER TABLE t_ssp_logradouro
    ADD CONSTRAINT t_ssp_logr_t_ssp_bairro_fk FOREIGN KEY ( t_ssp_bair_cd_bair )
        REFERENCES t_ssp_bairro ( cd_bairro );

ALTER TABLE t_ssp_ocorrencia
    ADD CONSTRAINT t_ssp_ocor_t_ssp_fiscal_fk FOREIGN KEY ( t_ssp_fiscal_cd_fiscal )
        REFERENCES t_ssp_fiscal ( cd_fiscal );

ALTER TABLE t_ssp_ocorrencia
    ADD CONSTRAINT t_ssp_ocor_t_ssp_vaga_fk FOREIGN KEY ( t_ssp_vaga_cd_vaga )
        REFERENCES t_ssp_vaga ( cd_vaga );

ALTER TABLE t_ssp_ocorrencia
    ADD CONSTRAINT t_ssp_ocor_t_ssp_veiculo_fk FOREIGN KEY ( t_ssp_veiculo_cd_veiculo )
        REFERENCES t_ssp_veiculo ( cd_veiculo );

ALTER TABLE t_ssp_vaga
    ADD CONSTRAINT t_ssp_vaga_t_ssp_camera_fk FOREIGN KEY ( t_ssp_camera_cd_cam )
        REFERENCES t_ssp_camera ( cd_camera );

ALTER TABLE t_ssp_vaga
    ADD CONSTRAINT t_ssp_vaga_t_ssp_cat_vaga_fk FOREIGN KEY ( t_ssp_cat_vaga_cd_cat_vaga )
        REFERENCES t_ssp_cat_vaga ( cd_categoria_vaga );

ALTER TABLE t_ssp_vaga
    ADD CONSTRAINT t_ssp_vaga_t_ssp_sensor_fk FOREIGN KEY ( t_ssp_sensor_cd_sen )
        REFERENCES t_ssp_sensor ( cd_sensor );

ALTER TABLE t_ssp_veiculo
    ADD CONSTRAINT t_ssp_veic_t_ssp_cor_veic_fk FOREIGN KEY ( t_ssp_cor_veic_cd_cor )
        REFERENCES t_ssp_cor_veiculo ( cd_cor );

ALTER TABLE t_ssp_veiculo
    ADD CONSTRAINT t_ssp_veic_t_ssp_fabr_veic_fk FOREIGN KEY ( t_ssp_fabr_veic_cd_fabr )
        REFERENCES t_ssp_fabricante_veiculo ( cd_fabricante );

ALTER TABLE t_ssp_veiculo
    ADD CONSTRAINT t_ssp_veic_t_ssp_mod_veic_fk FOREIGN KEY ( t_ssp_mod_veic_cd_mod_veic )
        REFERENCES t_ssp_modelo_veiculo ( cd_modelo_veiculo );

ALTER TABLE t_ssp_veiculo
    ADD CONSTRAINT t_ssp_veiculo_t_ssp_cli_fk FOREIGN KEY ( t_ssp_cliente_cd_cliente )
        REFERENCES t_ssp_cliente ( cd_cliente );

CREATE OR REPLACE TRIGGER fkntm_t_ssp_cli_juridico BEFORE
    UPDATE OF t_ssp_cliente_cd_cliente ON t_ssp_cli_juridico
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table T_SSP_CLI_JURIDICO is violated');
END;
/

CREATE OR REPLACE TRIGGER arc_arc_cli_t_ssp_cli_juridico BEFORE
    INSERT OR UPDATE OF t_ssp_cliente_cd_cliente ON t_ssp_cli_juridico
    FOR EACH ROW
DECLARE
    d NUMBER;
BEGIN
    SELECT
        a.cd_cliente
    INTO d
    FROM
        t_ssp_cliente a
    WHERE
        a.cd_cliente = :new.t_ssp_cliente_cd_cliente;

    IF ( d IS NULL OR d <> :new.t_ssp_cliente_cd_cliente ) THEN
        raise_application_error(-20223, 'FK T_SSP_CLI_JUR_T_SSP_CLI_FK in Table T_SSP_CLI_JURIDICO violates Arc constraint on Table T_SSP_CLIENTE - discriminator column cd_cliente doesn''t have value T_SSP_CLIENTE_cd_cliente'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_arc_cli_f_t_ssp_cli_fisico BEFORE
    INSERT OR UPDATE OF t_ssp_cliente_cd_cliente ON t_ssp_cli_fisico
    FOR EACH ROW
DECLARE
    d NUMBER;
BEGIN
    SELECT
        a.cd_cliente
    INTO d
    FROM
        t_ssp_cliente a
    WHERE
        a.cd_cliente = :new.t_ssp_cliente_cd_cliente;

    IF ( d IS NULL OR d <> :new.t_ssp_cliente_cd_cliente ) THEN
        raise_application_error(-20223, 'FK T_SSP_CLI_FIS_T_SSP_CLI_FK in Table T_SSP_CLI_FISICO violates Arc constraint on Table T_SSP_CLIENTE - discriminator column cd_cliente doesn''t have value T_SSP_CLIENTE_cd_cliente'
        );
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

/*-- Sequencia e trigger para tabela T_SSP_OCORRENCIA --*/
create sequence seq_t_ssp_ocorrencia
start with 1
increment by 1
maxvalue 10000
minvalue 0
nocache
cycle;

create or replace trigger tr_t_ssp_ocorrencia_new
before insert on t_ssp_ocorrencia
for each row
begin
 select seq_t_ssp_ocorrencia.nextval into :new.cd_ocorrencia from dual;
end;
/


/*Funcao para validar CNPJ*/
CREATE OR REPLACE FUNCTION FN_VALIDA_CNPJ (V_DO_CNPJ VARCHAR2)
RETURN VARCHAR2 IS
 
V_CNJP VARCHAR2 (15):= V_DO_CNPJ;
V_CNPJ_VALIDO VARCHAR2(15);
V_POSICAO NUMBER :=6;
V_POSICAO2 NUMBER :=9;
V_POSICAO3 NUMBER :=7;
V_POSICAO4 NUMBER :=9;
V_CALCULO NUMBER :=0;
V_CALCULO2 NUMBER :=0;
V_CALCULO3 NUMBER :=0;
V_CALCULO4 NUMBER :=0;
V_CALCULO5 NUMBER :=0;
V_CALCULO6 NUMBER :=0;
V_CALCULO7 NUMBER :=0;
v_digito_total NUMBER :=0;
V_DIG1 VARCHAR2 (1);
V_DIG2 VARCHAR2 (10);
BEGIN
    IF V_CNJP =0 THEN
        RETURN('O número do CNPJ indicado é zero! Corrija e tente novamente! ');
        ELSE
        V_CNPJ_VALIDO := LPAD(V_CNJP,15,'0');
    
    FOR X IN 1..15
    LOOP
        IF UPPER(SUBSTR(V_CNPJ_VALIDO,X,1)) NOT IN ('0','1','2','3','4','5','6','7','8','9') THEN
         DBMS_OUTPUT.PUT_LINE('Digite apenas números ');
        END IF; 
    END LOOP;
    --CALCULO 1
    FOR Y IN 1..5
    LOOP
    V_CALCULO := V_CALCULO + (TO_NUMBER(SUBSTR(V_CNPJ_VALIDO,Y,1)) * V_POSICAO);
    V_POSICAO := V_POSICAO - 1;
    END LOOP;
 
    FOR Z IN 6..13
    LOOP
    V_CALCULO2 := V_CALCULO2 + (TO_NUMBER(SUBSTR(V_CNPJ_VALIDO,Z,1)) * V_POSICAO2);
    V_POSICAO2 := V_POSICAO2 - 1;
    V_CALCULO3 := V_CALCULO + V_CALCULO2;
    END LOOP;
    
    IF MOD(V_CALCULO3,11)<2 THEN
        V_DIG1 :=0;
    ELSE
        V_DIG1 := 11-MOD(V_CALCULO3,11);
    END IF;    
           
         --CALCULO 2
          FOR A IN 1..6
    LOOP
    V_CALCULO4 := V_CALCULO4 + (TO_NUMBER(SUBSTR(V_CNPJ_VALIDO,A,1)) * V_POSICAO3);
    V_POSICAO3 := V_POSICAO3 - 1;
    END LOOP;
    
              FOR B IN 7..13
    LOOP
    V_CALCULO5 := V_CALCULO5 + (TO_NUMBER(SUBSTR(V_CNPJ_VALIDO,B,1)) * V_POSICAO4);
    V_POSICAO4 := V_POSICAO4 - 1;
    V_CALCULO6 :=V_CALCULO4 + V_CALCULO5;
    V_CALCULO7:=V_CALCULO6+(V_DIG1*2);
    END LOOP;

    IF MOD(V_CALCULO7,11)<2 THEN
        V_DIG2 :=0;
		v_digito_total:=V_DIG1||V_DIG2;
    ELSE
        V_DIG2 := 11-MOD(V_CALCULO7,11);
        v_digito_total:=V_DIG1||V_DIG2;
    END IF;  
    
    IF TO_NUMBER(SUBSTR(V_CNPJ_VALIDO,14,2))=v_digito_total THEN
    RETURN('VALIDO');
    ELSE
    RETURN('INVALIDO');
    END IF;
END IF;
END FN_VALIDA_CNPJ;
/


/*Trigger para validar CNPJ*/
CREATE OR REPLACE TRIGGER tr_t_ssp_cli_juridico  
BEFORE INSERT OR UPDATE ON t_ssp_cli_juridico 

FOR EACH ROW 
BEGIN 

    CASE
    WHEN INSERTING THEN
        IF  FN_VALIDA_CNPJ(:new.NR_CNPJ)='VALIDO' then dbms_output.put_line('Inserindo registro de CNPJ: '||:New.NR_CNPJ);
        ELSIF FN_VALIDA_CNPJ(:new.NR_CNPJ)= 'INVALIDO' then RAISE_APPLICATION_ERROR(-20001,'CNPJ INVALIDO') ;     
        ELSE RAISE_APPLICATION_ERROR(-20002,'ERRO DESCONHECIDO');
        END IF;
    WHEN UPDATING THEN
        IF  FN_VALIDA_CNPJ(:new.NR_CNPJ)='VALIDO' then dbms_output.put_line('Atualizando registro de CNPJ: '||:New.NR_CNPJ);
        ELSIF FN_VALIDA_CNPJ(:new.NR_CNPJ)= 'INVALIDO' then RAISE_APPLICATION_ERROR(-20001,'CNPJ INVALIDO') ;     
        ELSE RAISE_APPLICATION_ERROR(-20002,'ERRO DESCONHECIDO');
        END IF;
    END CASE;
END; 
/

/*Funcao valida CPF*/

CREATE OR REPLACE FUNCTION FN_VALIDA_CPF (V_DO_CPF VARCHAR2)
RETURN VARCHAR2 IS
 
V_CPF VARCHAR2 (11):= V_DO_CPF;
V_CPF_VALIDO VARCHAR2(11);
V_POSICAO NUMBER :=10;
V_POSICAO2 NUMBER :=10;
V_CALCULO NUMBER :=0;
V_CALCULO2 NUMBER :=0;
V_CALCULO3 NUMBER :=0;
v_digito_total NUMBER :=0;
V_DIG1 VARCHAR2 (1);
V_DIG2 VARCHAR2 (10);
BEGIN
    IF V_CPF =0 THEN
        RETURN('O número do CPF indicado é zero! Corrija e tente novamente! ');
        ELSE
        V_CPF_VALIDO := LPAD(V_CPF,11,'0');
    
    FOR X IN 1..9
    LOOP
        IF UPPER(SUBSTR(V_CPF_VALIDO,X,1)) NOT IN ('0','1','2','3','4','5','6','7','8','9') THEN
         DBMS_OUTPUT.PUT_LINE('Digite apenas números ');
        END IF; 
    END LOOP;
    --CALCULO 1
    FOR Y IN 1..9
    LOOP
    V_CALCULO := V_CALCULO + (TO_NUMBER(SUBSTR(V_CPF_VALIDO,Y,1)) * V_POSICAO);
    V_POSICAO := V_POSICAO - 1;
    END LOOP;

    IF MOD(V_CALCULO,11)<2 THEN
        V_DIG1 :=0;
    ELSE
        V_DIG1 := 11-MOD(V_CALCULO,11);
    END IF;    
           
         --CALCULO 2
          FOR Z IN 2..9
    LOOP
    V_CALCULO2 := V_CALCULO2 + (TO_NUMBER(SUBSTR(V_CPF_VALIDO,Z,1)) * V_POSICAO2);
    V_POSICAO2 := V_POSICAO2 - 1;
    V_CALCULO3:=V_CALCULO2+(V_DIG1*2);
    END LOOP;

    IF MOD(V_CALCULO3,11)<2 THEN
        V_DIG2 :=0;
		v_digito_total:=V_DIG1||V_DIG2;
    ELSE
        V_DIG2 := 11-MOD(V_CALCULO3,11);
        v_digito_total:=V_DIG1||V_DIG2;
    END IF;  
    
    IF TO_NUMBER(SUBSTR(V_CPF_VALIDO,10,2))=v_digito_total THEN
    RETURN('VALIDO');
    ELSE
    RETURN('INVALIDO');
    END IF;
END IF;
END FN_VALIDA_CPF;
/

/*Trigger para inserir CPF*/

CREATE OR REPLACE TRIGGER tr_t_ssp_cli_fisico  
BEFORE INSERT OR UPDATE ON t_ssp_cli_fisico 

FOR EACH ROW 
BEGIN 

    CASE
    WHEN INSERTING THEN
        IF  FN_VALIDA_CPF(:new.NR_CPF)='VALIDO' then dbms_output.put_line('Inserindo registro de CPF: '||:New.NR_CPF);
        ELSIF FN_VALIDA_CPF(:new.NR_CPF)= 'INVALIDO' then RAISE_APPLICATION_ERROR(-20001,'CPF INVALIDO') ;     
        ELSE RAISE_APPLICATION_ERROR(-20002,'ERRO DESCONHECIDO');
        END IF;
    WHEN UPDATING THEN
        IF  FN_VALIDA_CPF(:new.NR_CPF)='VALIDO' then dbms_output.put_line('Atualizando registro de CPF: '||:New.NR_CPF);
        ELSIF FN_VALIDA_CPF(:new.NR_CPF)= 'INVALIDO' then RAISE_APPLICATION_ERROR(-20001,'CPF INVALIDO') ;     
        ELSE RAISE_APPLICATION_ERROR(-20002,'ERRO DESCONHECIDO');
        END IF;
    END CASE;
END; 
/

/*Exemplo de acionamento das procedures e funções*/
--exec sp_insert_T_SSP_OCORRENCIA(1,1,'GJH-7413') -- veiculo que existe no registro estacionando
--exec sp_insert_T_SSP_OCORRENCIA(1,0,'GJH-7413') -- veiculo que existe no registro saindo da vaga
--exec sp_insert_T_SSP_OCORRENCIA(1,1,'GJH-1000') -- veiculo que não existe no registro estacionando
--exec sp_insert_T_SSP_OCORRENCIA(1,0,'GJH-1000') -- veiculo que não existe no registro saindo da vaga

/*-- Funcao que valida se a placa informada tem cadastrou ou nao -- */
create or replace function fn_valida_placa (placa_1 IN VARCHAR2)

RETURN VARCHAR2 is
valida_placa VARCHAR(20);
begin

  SELECT count(nr_placa)into valida_placa FROM T_SSP_VEICULO where upper(placa_1) = upper(nr_placa);
    IF  valida_placa = '0' then RETURN 'SEM CADASTRO';
    ELSE RETURN 'CADASTRADO';
    END IF;
     
end fn_valida_placa;
/

/*-- Função que atualiza ocorrencia e vaga de carro com cadastro saindo da vaga estacionada --*/
CREATE OR REPLACE PROCEDURE sp_insert_T_SSP_OCORRENCIA_com_cadastro_saindo (v_cd_sensor in number, v_nr_placa in varchar) is

v_vaga number(5);
v_placa number (5);

begin
    SELECT vag.cd_vaga  INTO v_vaga
    FROM    T_SSP_SENSOR sen
    INNER JOIN T_SSP_VAGA vag
    on sen.cd_sensor = vag.t_ssp_sensor_cd_sen
    WHERE sen.cd_sensor = v_cd_sensor;

    select veic.cd_veiculo INTO v_placa
    from T_SSP_VEICULO veic
    where nr_placa = v_nr_placa;
    
            
    update t_ssp_ocorrencia set dt_fim_ocorrencia = to_date(sysdate,'DD-MM-YYYY'), hr_fim_ocorrencia = to_char(sysdate,'HH24:MI:SS') where t_ssp_veiculo_cd_veiculo = v_placa;
    update t_ssp_vaga     set st_vaga = 'L'     where cd_vaga = v_vaga;
end;


/*-- Função que atualiza ocorrencia e vaga de carro sem cadastro saindo da vaga estacionada --*/
CREATE OR REPLACE PROCEDURE sp_insert_T_SSP_OCORRENCIA_sem_cadastro_saindo (v_cd_sensor in number, v_nr_placa in varchar) is

v_vaga number(5);

begin
    SELECT vag.cd_vaga  INTO v_vaga
    FROM    T_SSP_SENSOR sen
    INNER JOIN T_SSP_VAGA vag
    on sen.cd_sensor = vag.t_ssp_sensor_cd_sen
    WHERE sen.cd_sensor = v_cd_sensor;      
    
    update t_ssp_ocorrencia set dt_fim_ocorrencia = to_date(sysdate,'DD-MM-YYYY'), hr_fim_ocorrencia = to_char(sysdate,'HH24:MI:SS') where dc_ocorrencia like '%'||v_nr_placa||'%';
    update t_ssp_vaga     set st_vaga = 'L'     where cd_vaga = v_vaga;
end;
/


/*-- Função que cria ocorrencia e atualiza vaga de carro sem cadastro estacionando na vaga --*/
create or replace PROCEDURE sp_insert_T_SSP_OCORRENCIA_sem_cadastro_estacionando (v_cd_sensor in number, v_nr_placa in varchar) is

v_vaga number(5);
v_fiscal number (5);
v_fiscal_nome varchar(30);
v_data date;
v_hora varchar(20);


begin
   SELECT vag.cd_vaga  INTO v_vaga
    FROM    T_SSP_SENSOR sen
    INNER JOIN T_SSP_VAGA vag
    on sen.cd_sensor = vag.t_ssp_sensor_cd_sen
    WHERE sen.cd_sensor = v_cd_sensor;  

    select fiscal.cd_fiscal,fiscal.ds_interno_fiscal , to_date(sysdate,'DD-MM-YYYY'),to_char(sysdate,'HH24:MI:SS') INTO v_fiscal,v_fiscal_nome ,v_data,v_hora
    from T_SSP_FISCAL fiscal
    inner join t_ssp_log_fisc logr_fisc
    on fiscal.cd_fiscal = logr_fisc.t_ssp_fiscal_cd_fiscal

    inner join t_ssp_logradouro logr
    on logr.cd_logradouro = logr_fisc.t_ssp_logr_cd_logr

    inner join t_ssp_log_vaga logr_vaga
    on logr_vaga.t_ssp_logr_cd_logr = logr.cd_logradouro

    inner join t_ssp_vaga vaga
    on vaga.cd_vaga = logr_vaga.t_ssp_vaga_cd_vaga
    where  cd_vaga = v_vaga;


    insert into T_SSP_OCORRENCIA( T_SSP_VAGA_cd_vaga,dt_inicio_ocorrencia ,hr_inicial_ocorrencia, t_SSP_FISCAL_cd_fiscal, DC_OCORRENCIA ) values (v_vaga, v_data,v_hora, v_fiscal,'Carro estacionado não possui cadastro. O Fiscal: '||v_fiscal_nome|| ' Irá notificar o carro '||v_nr_placa||' sobre o valor do estacionamento'  );
    update t_ssp_vaga     set st_vaga = 'O'     where cd_vaga = v_vaga;
end;
/

/*-- Função que cria ocorrencia e atualiza vaga de carro com cadastro estacionando na vaga --*/
CREATE OR REPLACE PROCEDURE sp_insert_T_SSP_OCORRENCIA_com_cadastro_estacionando (v_cd_sensor in number, v_nr_placa in varchar) is

v_vaga number(5);
v_placa number (5);
v_data date;
v_hora varchar(20);


begin
    SELECT vag.cd_vaga  INTO v_vaga
    FROM    T_SSP_SENSOR sen
    INNER JOIN T_SSP_VAGA vag
    on sen.cd_sensor = vag.t_ssp_sensor_cd_sen
    WHERE sen.cd_sensor = v_cd_sensor;  
    
    select veic.cd_veiculo , to_date(sysdate,'DD-MM-YYYY'), to_char(sysdate,'HH24:MI:SS')  INTO v_placa, v_data,v_hora
    from T_SSP_VEICULO veic
    where nr_placa = v_nr_placa;
    
            
    insert into T_SSP_OCORRENCIA( T_SSP_VAGA_cd_vaga, T_SSP_VEICULO_cd_veiculo, dt_inicio_ocorrencia ,hr_inicial_ocorrencia) values (v_vaga,  v_placa, v_data, v_hora );
    update t_ssp_vaga     set st_vaga = 'O'     where cd_vaga = v_vaga;
end;
/


/*-- Função principal que recebe dados do sensor e da camera para iniciar as tratativas de ocorrencia --*/

CREATE OR REPLACE PROCEDURE sp_insert_T_SSP_OCORRENCIA (cd_sensor in number, inf_sensor in number, nr_placa in varchar) is
begin
    dbms_output.put_line('CHECK DADOS: ');
    dbms_output.put_line('cd_sensor: '|| cd_sensor);
    dbms_output.put_line('inf_sensor: '|| inf_sensor);
    dbms_output.put_line('Placa: '||  nr_placa);
    dbms_output.put_line('');
   
   CASE
	when fn_valida_placa(nr_placa) = 'CADASTRADO' and inf_sensor = 1 then
		dbms_output.put_line('Estacionando com cadastro');
		sp_insert_T_SSP_OCORRENCIA_com_cadastro_estacionando(cd_sensor, nr_placa);
   
    when  fn_valida_placa(nr_placa) = 'SEM CADASTRO' and inf_sensor = 1 then
        dbms_output.put_line('Estacionando sem cadastro');
        sp_insert_T_SSP_OCORRENCIA_sem_cadastro_estacionando(cd_sensor, nr_placa);
    when  fn_valida_placa(nr_placa) = 'CADASTRADO' and inf_sensor = 0 then
		dbms_output.put_line('saindo da vaga carro com cadastro');
		sp_insert_T_SSP_OCORRENCIA_com_cadastro_saindo(cd_sensor, nr_placa);
       
    when  fn_valida_placa(nr_placa) = 'SEM CADASTRO' and inf_sensor = 0 then
		dbms_output.put_line('saindo da vaga carro sem cadastro');
		sp_insert_T_SSP_OCORRENCIA_sem_cadastro_saindo(cd_sensor, nr_placa);
    end case;
   
   
end;
/
