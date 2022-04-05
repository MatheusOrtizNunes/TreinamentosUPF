/* Exemplo de formata��o de data */
select to_char(sysdate, 'fmday, dd "de" month "de" yyyy, hh24 "horas e" mi "minutos"') from dual;

/* Ano em n�meros romanos */
select to_char(extract(year from sysdate), 'rn'), to_char(extract(year from sysdate), 'fmrn'), to_char(extract(year from sysdate), 'fmRN') from dual;

/* Extraindo partes da data */
select extract(year from sysdate), extract(month from sysdate), extract(day from sysdate) from dual;
select extract(year from localtimestamp), extract(month from localtimestamp), extract(day from localtimestamp),
       extract(hour from localtimestamp), extract(minute from localtimestamp), extract(second from localtimestamp)  from dual;

/* Data formatada */
select to_char(sysdate, 'dd/mm/yyyy') data from dual;

/* Data e hora formato 24 horas */
select to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') from dual;

/* Data e hora formato 12 horas */
select to_char(sysdate, 'dd/mm/yyyy hh:mi:ss "da" am') from dual;

/* Data, hora e segundos fracionados formato 24 horas */
select to_char(localtimestamp, 'dd/mm/yyyy hh24:mi:ss.ff') from dual;

/* Data, hora e segundos fracionados formato 12 horas */
select to_char(localtimestamp, 'dd/mm/yyyy hh:mi:ss.ff "da" am') from dual;

/* Data e Anno Domini */
select to_char(sysdate, 'dd/mm/yyyy ad') from dual;

/* Data e s�culo */
select to_char(sysdate, 'dd/mm/yyyy "s�culo" cc') from dual;

/* Dia da semana */
select to_char(sysdate, 'd') from dual;

/* Nome do dia da semana */
select to_char(sysdate, 'day'), to_char(sysdate, 'Day'), to_char(sysdate, 'DAY') from dual;

/* Nome abreviado do dia da semana */
select to_char(sysdate, 'dy'), to_char(sysdate, 'Dy'), to_char(sysdate, 'DY') from dual;

/* Dia do ano */
select to_char(sysdate, 'ddd') from dual;

/* Dia no formato longo */
select to_char(sysdate, 'dl') from dual;

/* Dia no formato curto */
select to_char(sysdate, 'ds') from dual;

/* Nome do m�s */
select to_char(sysdate, 'MONTH'), to_char(sysdate, 'Month'), to_char(sysdate, 'month') from dual;

/* Nome do m�s abreviado */
select to_char(sysdate, 'MON'), to_char(sysdate, 'Mon'), to_char(sysdate, 'mon') from dual;

/* Semana do m�s */
select to_char(sysdate, 'W') from dual;

/* Semana do ano */
select to_char(sysdate, 'WW') from dual;

/* Trimestre */
select to_char(sysdate, 'Q') from dual;

/* Retira hor�rio da data */
select trunc(sysdate) from dual;

/* Primeiro dia do m�s */
select trunc(sysdate, 'mm') from dual;

/* Primeiro dia do ano */
select trunc(sysdate, 'yyyy') from dual;



-- Como obter o primeiro e �ltimo dia da semana, m�s, trimestre e ano em Oracle

-- Primeiro dia da semana corrente (domingo)
select TRUNC(SYSDATE, 'Day') from dual;
-- Primeiro dia da semana seguinte (domingo)
select TRUNC(SYSDATE+7 , 'Day') from dual;
-- Primeiro dia da semana anterior (domingo)
select TRUNC(SYSDATE-7 , 'Day') from dual;
-- Primeiro dia do m�s corrente
select TRUNC(SYSDATE , 'Month') from dual;
-- Primeiro dia do m�s anterior
select TRUNC(TRUNC(SYSDATE , 'Month')-1 , 'Month') from dual;
-- Primeiro dia do m�s seguinte
select TRUNC(LAST_DAY(SYSDATE)+1 , 'Month') from dual;
-- Primeiro dia do ano corrente
select TRUNC(SYSDATE , 'Year') from dual;
-- Primeiro dia do ano anterior
select TRUNC(TRUNC(SYSDATE , 'Year')-1 , 'Year') from dual;
-- Primeiro dia do pr�ximo ano
select ADD_MONTHS(TRUNC(SYSDATE , 'Year'),12) from dual;
-- Primeiro dia do trimestre corrente
select TRUNC(SYSDATE , 'Q') from dual;
--  Primeiro dia do trimestre anterior
select ADD_MONTHS(TRUNC(SYSDATE , 'Q'),-3) from dual;
--  Primeiro dia do pr�ximo trimestre
select ADD_MONTHS(TRUNC(SYSDATE , 'Q'),3) from dual;

-- �ltimo dia da semana corrente (s�bado)
select TRUNC(SYSDATE, 'Day')+6 from dual;
-- �ltimo dia da pr�xima semana (s�bado)
select TRUNC(SYSDATE+7 , 'Day')+6 from dual;
-- �ltimo dia da semana anterior (s�bado)
select TRUNC(SYSDATE-7 , 'Day')+6 from dual;
-- �ltimo dia do m�s corrente
select LAST_DAY(TRUNC(SYSDATE , 'Month')) from dual;
-- �ltimo dia do m�s anterior
select LAST_DAY(TRUNC(TRUNC(SYSDATE , 'Month')-1 , 'Month')) from dual;
-- �ltimo dia do pr�ximo m�s 
select LAST_DAY(TRUNC(LAST_DAY(SYSDATE)+1 , 'Month')) from dual;
-- �ltimo dia do ano corrente
select LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE , 'Year'),11)) from dual;
-- �ltimo dia do ano anterior
select LAST_DAY(ADD_MONTHS(TRUNC(TRUNC(SYSDATE , 'Year')-1 , 'Year'),11)) from dual;
-- �ltimo dia do pr�ximo ano 
select LAST_DAY(ADD_MONTHS(ADD_MONTHS(TRUNC(SYSDATE, 'Year'),12), 11)) from dual;
-- �ltimo dia do trimestre corrente
select LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE , 'Q'),2)) from dual;
-- �ltimo dia do trimestre anterior
select TRUNC(SYSDATE , 'Q')-1 from dual;
-- �ltimo dia do pr�ximo trimestre
select LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE , 'Q'),5)) from dual;
