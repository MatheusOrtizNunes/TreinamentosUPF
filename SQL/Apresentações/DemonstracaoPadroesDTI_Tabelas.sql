-- Exemplo de cria��o de tabela
/*-----------------------------------------------------------------------------*
 *                                                                             *
 * Esquema..: ADDESENV                                                         *
 *                                                                             *
 * Objeto...: padfornec                                                        *
 *                                                                             *
 * Descri��o: Padr�es Fornecedor                                               *
 *                                                                             *
 * Hist�rico:                                                                  *
 * Data       Autor      Descri��o                                             *
 * ---------- ---------- ----------------------------------------------------- *
 * 09/01/2020 MARROS  Cria��o                                                  *
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

COMMENT ON TABLE ADDESENV.padfornec IS 'Demonstra��o dos padr�es DTI - Fornecedor';

COMMENT ON COLUMN ADDESENV.padfornec.codfornec IS 'C�digo do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.razaosoc is 'Raz�o social do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.email is 'E-mail do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.cpfcnpj is 'CPF/CNPJ do fornecedor';
COMMENT ON COLUMN ADDESENV.padfornec.tppessoa is 'Tipo de pessoa. F - F�sica, J - Jur�dica (default)';

GRANT ALL PRIVILEGES ON ADDESENV.padfornec TO GAMPERT WITH GRANT OPTION;

-- Exemplo de cria��o de Sequence
/*-----------------------------------------------------------------------------*
 *                                                                             *
 * Esquema..: SYS                                                         *
 *                                                                             *
 * Objeto...: seq_padfornec_codfornec                              *
 *                                                                             *
 * Descri��o: Gera��o da PK para tabela PADFORNEC  *
 *                                                                             *
 * Hist�rico:                                                                  *
 * Data       Autor      Descri��o                                             *
 * ---------- ---------- ----------------------------------------------------- *
 * 13/01/2020 MARROS  Cria��o                                               *
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


-- Exemplo de cria��o de trigger

CREATE OR REPLACE TRIGGER ADDESENV.trg_padfornec
   /*-----------------------------------------------------------------------------*
    *                                                                             *
    * Esquema..: ADDESENV                                                         *
    *                                                                             *
    * Objeto...: TRG_padfornec                                                    *
    *                                                                             *
    * Descri��o: Gerar n�mero sequencial para PK da tabela PADFORNEC              *
    *                                                                             *
    * Hist�rico:                                                                  *
    * Data       Autor      Descri��o                                             *
    * ---------- ---------- ----------------------------------------------------- *
    * 10/01/2020 MARROS  Cria��o                                                  *
    *                                                                             *
    *-----------------------------------------------------------------------------*/
    BEFORE INSERT ON ADDESENV.padfornec
    FOR EACH ROW
DECLARE
    /* Vari�vel de contexto para depura��o */
    --v_ctx dlog.plogparam.log_ctx := dlog.fun_getctx(dlog.plog.init(), sys.fun_whoami);
    /* Vari�veis locais aqui */
BEGIN
    :new.codfornec := seq_padfornec_codfornec.nextval;
END trg_padfornec;


-- Exemplo de cria��o de tabela com chave estrangeira FK
/*-----------------------------------------------------------------------------*
 *                                                                             *
 * Esquema..: ADDESENV                                                         *
 *                                                                             *
 * Objeto...: padenderfornec                                                   *
 *                                                                             *
 * Descri��o: Padr�es Endere�os do Fornecedor                                  *
 *                                                                             *
 * Hist�rico:                                                                  *
 * Data       Autor      Descri��o                                             *
 * ---------- ---------- ----------------------------------------------------- *
 * 09/01/2020 MARROS  Cria��o                                                  *
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

COMMENT ON TABLE ADDESENV.padenderfornec IS 'Demonstra��o dos padr�es DTI - Endere�os do Fornecedor';

COMMENT ON COLUMN ADDESENV.padenderfornec.codfornec IS 'C�digo do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.seq is 'N�mero sequencial do endere�o do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.codcid is 'C�digo da cidade do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.codbai is 'C�digo do bairro do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.logradouro is 'Logradouro (rua, avenida, travessa, etc:) do endere�o do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.numero is 'N�mero do endere�o do fornecedor';
COMMENT ON COLUMN ADDESENV.padenderfornec.complemento is 'Compelemento do endere�o do fornecedor';


GRANT ALL PRIVILEGES ON ADDESENV.padenderfornec TO GAMPERT WITH GRANT OPTION;

-- Exemplo de cria��o de chaves estrangeiras (FK)
 /*-----------------------------------------------------------------------------*
  *                                                                             *
  * Esquema..: ADDESENV                                                         *
  *                                                                             *
  * Objeto...: fk_padenderfornec_padfornec                                      *
  *                                                                             *
  * Descri��o: Chaves estrangeiras da tabela padenderfornec                     *
  *                                                                             *
  * Hist�rico:                                                                  *
  * Data       Autor      Descri��o                                             *
  * ---------- ---------- ----------------------------------------------------- *
  * 10/01/2020 MARROS  Cria��o                                                  *
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
 
 /* Cria��o de �ndice para chave estrangeira 
    Como a FK para a tabela BAIRROCIDADE n�o faz parte da chave prim�ria da tabela PADENDERFORNEC,
    � necess�rio criar um �ndice de FK para evitar problemas de desempenho na aplica��o */
 CREATE  INDEX ADDESENV.idx_padendfornec_bairrocidade
 ON ADDESENV.padenderfornec (codcid, codbai)
   PCTFREE 10 INITRANS 2 TABLESPACE IDX00064;
   
   
