/* Exemplo de formatação de data */
select to_char(sysdate, 'fmday, dd "de" month "de" yyyy, hh24 "horas e" mi "minutos"') from dual;

/* Ano em números romanos */
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

/* Data e século */
select to_char(sysdate, 'dd/mm/yyyy "século" cc') from dual;

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

/* Nome do mês */
select to_char(sysdate, 'MONTH'), to_char(sysdate, 'Month'), to_char(sysdate, 'month') from dual;

/* Nome do mês abreviado */
select to_char(sysdate, 'MON'), to_char(sysdate, 'Mon'), to_char(sysdate, 'mon') from dual;

/* Semana do mês */
select to_char(sysdate, 'W') from dual;

/* Semana do ano */
select to_char(sysdate, 'WW') from dual;

/* Trimestre */
select to_char(sysdate, 'Q') from dual;

/* Retira horário da data */
select trunc(sysdate) from dual;

/* Primeiro dia do mês */
select trunc(sysdate, 'mm') from dual;

/* Primeiro dia do ano */
select trunc(sysdate, 'yyyy') from dual;



-- Como obter o primeiro e último dia da semana, mês, trimestre e ano em Oracle

-- Primeiro dia da semana corrente (domingo)
select TRUNC(SYSDATE, 'Day') from dual;
-- Primeiro dia da semana seguinte (domingo)
select TRUNC(SYSDATE+7 , 'Day') from dual;
-- Primeiro dia da semana anterior (domingo)
select TRUNC(SYSDATE-7 , 'Day') from dual;
-- Primeiro dia do mês corrente
select TRUNC(SYSDATE , 'Month') from dual;
-- Primeiro dia do mês anterior
select TRUNC(TRUNC(SYSDATE , 'Month')-1 , 'Month') from dual;
-- Primeiro dia do mês seguinte
select TRUNC(LAST_DAY(SYSDATE)+1 , 'Month') from dual;
-- Primeiro dia do ano corrente
select TRUNC(SYSDATE , 'Year') from dual;
-- Primeiro dia do ano anterior
select TRUNC(TRUNC(SYSDATE , 'Year')-1 , 'Year') from dual;
-- Primeiro dia do próximo ano
select ADD_MONTHS(TRUNC(SYSDATE , 'Year'),12) from dual;
-- Primeiro dia do trimestre corrente
select TRUNC(SYSDATE , 'Q') from dual;
--  Primeiro dia do trimestre anterior
select ADD_MONTHS(TRUNC(SYSDATE , 'Q'),-3) from dual;
--  Primeiro dia do próximo trimestre
select ADD_MONTHS(TRUNC(SYSDATE , 'Q'),3) from dual;

-- Último dia da semana corrente (sábado)
select TRUNC(SYSDATE, 'Day')+6 from dual;
-- Último dia da próxima semana (sábado)
select TRUNC(SYSDATE+7 , 'Day')+6 from dual;
-- Último dia da semana anterior (sábado)
select TRUNC(SYSDATE-7 , 'Day')+6 from dual;
-- Último dia do mês corrente
select LAST_DAY(TRUNC(SYSDATE , 'Month')) from dual;
-- Último dia do mês anterior
select LAST_DAY(TRUNC(TRUNC(SYSDATE , 'Month')-1 , 'Month')) from dual;
-- Último dia do próximo mês 
select LAST_DAY(TRUNC(LAST_DAY(SYSDATE)+1 , 'Month')) from dual;
-- Último dia do ano corrente
select LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE , 'Year'),11)) from dual;
-- Último dia do ano anterior
select LAST_DAY(ADD_MONTHS(TRUNC(TRUNC(SYSDATE , 'Year')-1 , 'Year'),11)) from dual;
-- Último dia do próximo ano 
select LAST_DAY(ADD_MONTHS(ADD_MONTHS(TRUNC(SYSDATE, 'Year'),12), 11)) from dual;
-- Último dia do trimestre corrente
select LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE , 'Q'),2)) from dual;
-- Último dia do trimestre anterior
select TRUNC(SYSDATE , 'Q')-1 from dual;
-- Último dia do próximo trimestre
select LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE , 'Q'),5)) from dual;
