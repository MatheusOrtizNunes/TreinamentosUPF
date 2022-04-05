-- Exemplo de criação de tabela
/*-----------------------------------------------------------------------------*
 *                                                                             *
 * Esquema..: ADDESENV                                                         *
 *                                                                             *
 * Objeto...: padfornec                                                        *
 *                                                                             *
 * Descrição: Padrões Fornecedor                                               *
 *                                                                             *
 * Histórico:                                                                  *
 * Data       Autor      Descrição                                             *
 * ---------- ---------- ----------------------------------------------------- *
 * 09/01/2020 MARROS  Criação                                                  *
 *                                                                             *
 *-----------------------------------------------------------------------------*/

CREATE TABLE ADDESENV.padfornec
  (codfornec   NUMBER(7,0)   CONSTRAINT nn_padfornec_codfornec NOT NULL,
   razaosoc    VARCHAR2(100) CONSTRAINT nn_padfornec_razaosoc NOT NULL,
   email       VARCHAR2(100),
   cpfcnpj     VARCHAR2(14) CONSTRAINT nn_padfornec_CPFCNPJ NOT NULL,
   tppessoa    CHAR(1) DEFAULT 'J' CONSTRAINT nn_padfornec_tppessoa NOT NULL
   CONSTRAINT ck_padfornec_tppessoa
    CHECK (tppessoa IN ('F', 'J')))
  TABLESPACE DAT00064;

ALTER TABLE ADDESENV.padfornec ADD CONSTRAINT pk_padfornec
  PRIMARY KEY (codfornec)
  USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE IDX00064;

COMMENT ON TABLE ADDESENV.padfornec IS 'Demonstração dos padrões DTI - Fornecedor';

COMMENT ON COLUMN ADDESENV.padfornec.codfornec IS 'Código do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.razaosoc is 'Razão social do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.email is 'E-mail do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.cpfcnpj is 'CPF/CNPJ do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.tppessoa is 'Tipo de pessoa. F - Física, J - Jurídica (default)';

GRANT ALL PRIVILEGES ON ADDESENV.padfornec TO GAMPERT WITH GRANT OPTION;

-- Exemplo de criação de Sequence
/*-----------------------------------------------------------------------------*
 *                                                                             *
 * Esquema..: SYS                                                         *
 *                                                                             *
 * Objeto...: seq_padfornec_codfornec                              *
 *                                                                             *
 * Descrição: Geração da PK para tabela PADFORNEC  *
 *                                                                             *
 * Histórico:                                                                  *
 * Data       Autor      Descrição                                             *
 * ---------- ---------- ----------------------------------------------------- *
 * 13/01/2020 MARROS  Criação                                               *
 *                                                                             *
 *-----------------------------------------------------------------------------*/

CREATE SEQUENCE ADDESENV.seq_padfornec_codfornec
 	INCREMENT BY 1
	START WITH 1
	MAXVALUE 9999999
	MINVALUE 1
	NOCYCLE
	NOCACHE
    ORDER;


-- Exemplo de criação de trigger

CREATE OR REPLACE TRIGGER ADDESENV.trg_padfornec
   /*-----------------------------------------------------------------------------*
    *                                                                             *
    * Esquema..: ADDESENV                                                         *
    *                                                                             *
    * Objeto...: TRG_padfornec                                                    *
    *                                                                             *
    * Descrição: Gerar número sequencial para PK da tabela PADFORNEC              *
    *                                                                             *
    * Histórico:                                                                  *
    * Data       Autor      Descrição                                             *
    * ---------- ---------- ----------------------------------------------------- *
    * 10/01/2020 MARROS  Criação                                                  *
    *                                                                             *
    *-----------------------------------------------------------------------------*/
    BEFORE INSERT ON ADDESENV.padfornec
    FOR EACH ROW
DECLARE
    /* Variável de contexto para depuração */
    --v_ctx dlog.plogparam.log_ctx := dlog.fun_getctx(dlog.plog.init(), sys.fun_whoami);
    /* Variáveis locais aqui */
BEGIN
    :new.codfornec := seq_padfornec_codfornec.nextval;
END trg_padfornec;


-- Exemplo de criação de tabela com chave estrangeira FK
/*-----------------------------------------------------------------------------*
 *                                                                             *
 * Esquema..: ADDESENV                                                         *
 *                                                                             *
 * Objeto...: padenderfornec                                                   *
 *                                                                             *
 * Descrição: Padrões Endereços do Fornecedor                                  *
 *                                                                             *
 * Histórico:                                                                  *
 * Data       Autor      Descrição                                             *
 * ---------- ---------- ----------------------------------------------------- *
 * 09/01/2020 MARROS  Criação                                                  *
 *                                                                             *
 *-----------------------------------------------------------------------------*/

CREATE TABLE ADDESENV.padenderfornec
  (codfornec   NUMBER(7,0) CONSTRAINT nn_padendfornec_codfornec NOT NULL,
   seq         NUMBER(3,0) CONSTRAINT nn_padendfornec_seq NOT NULL,
   codcid      NUMBER(4,0) CONSTRAINT nn_padendfornec_codcid NOT NULL,
   codbai      NUMBER(6,0) CONSTRAINT nn_padendfornec_codbai NOT NULL,
   logradouro  VARCHAR2(200) CONSTRAINT nn_padendfornec_logradouro NOT NULL,
   numero      VARCHAR2(50) CONSTRAINT nn_padendfornec_numero NOT NULL,
   complemento VARCHAR2(200))
  TABLESPACE DAT00064;

ALTER TABLE ADDESENV.padenderfornec ADD CONSTRAINT pk_padenderfornec
  PRIMARY KEY (codfornec, seq)
  USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE IDX00064;

COMMENT ON TABLE ADDESENV.padenderfornec IS 'Demonstração dos padrões DTI - Endereços do Fornecedor';

COMMENT ON COLUMN ADDESENV.padenderfornec.codfornec IS 'Código do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.seq is 'Número sequencial do endereço do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.codcid is 'Código da cidade do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.codbai is 'Código do bairro do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.logradouro is 'Logradouro (rua, avenida, travessa, etc:) do endereço do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.numero is 'Número do endereço do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.complemento is 'Compelemento do endereço do fornecedor';


GRANT ALL PRIVILEGES ON ADDESENV.padenderfornec TO GAMPERT WITH GRANT OPTION;

-- Exemplo de criação de chaves estrangeiras (FK)
 /*-----------------------------------------------------------------------------*
  *                                                                             *
  * Esquema..: ADDESENV                                                         *
  *                                                                             *
  * Objeto...: fk_padenderfornec_padfornec                                      *
  *                                                                             *
  * Descrição: Chaves estrangeiras da tabela padenderfornec                     *
  *                                                                             *
  * Histórico:                                                                  *
  * Data       Autor      Descrição                                             *
  * ---------- ---------- ----------------------------------------------------- *
  * 10/01/2020 MARROS  Criação                                                  *
  *                                                                             *
  *-----------------------------------------------------------------------------*/

 /* FK para padfornec */
 ALTER TABLE ADDESENV.padenderfornec ADD CONSTRAINT fk_padenderfornec_padfornec
   FOREIGN KEY (codfornec)
   REFERENCES ADDESENV.padfornec (codfornec)
   INITIALLY IMMEDIATE
   ENABLE VALIDATE;

 /* FK para bairrocidade */
 ALTER TABLE ADDESENV.padenderfornec ADD CONSTRAINT fk_padenderfornec_bairrocid
   FOREIGN KEY (codcid, codbai)
   REFERENCES ADDESENV.bairrocidade (codcidade, codbairro)
   INITIALLY IMMEDIATE
   ENABLE VALIDATE;
 
 /* Criação de índice para chave estrangeira 
    Como a FK para a tabela BAIRROCIDADE não faz parte da chave primária da tabela PADENDERFORNEC,
    é necessário criar um índice de FK para evitar problemas de desempenho na aplicação */
 CREATE  INDEX ADDESENV.idx_padendfornec_bairrocidade
 ON ADDESENV.padenderfornec (codcid, codbai)
   PCTFREE 10 INITRANS 2 TABLESPACE IDX00064;
   
   
