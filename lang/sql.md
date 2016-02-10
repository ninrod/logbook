# SQL Tricks

* get the `nth` row of a select query:

```sql
select * from (
  select
    row_number() over (order by AVD_ID ASC) AS rownumber,
    avd.AVD_ID,
    avd.AVD_NM_AVALIADOR,
    avd.AVD_NM_AVALIANDO
  from
    AVD_AVALIACAO_DESEMP avd)
AS a where rownumber = 3;
```

* get the first `n` rows of a select:

```sql
/* just append the following clause to the query */
FETCH FIRST 1 ROWS ONLY
```
