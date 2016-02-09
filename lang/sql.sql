/* get the nth row of a select query */
select * from (
  select
    row_number() over (order by AVD_ID ASC) AS rownumber,
    avd.AVD_ID,
    avd.AVD_NM_AVALIADOR,
    avd.AVD_NM_AVALIANDO
  from
    AVD_AVALIACAO_DESEMP avd)
AS a where rownumber = 3;

/* PEGAR OS N PRIMEIROS REGISTROS DE UM SELECT: */
/* just append the following clause to the query */
FETCH FIRST 1 ROWS ONLY
