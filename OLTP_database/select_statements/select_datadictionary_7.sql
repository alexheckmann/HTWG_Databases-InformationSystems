@output.sql;

SELECT CT_COL.TABLE_NAME,
       CT_COL.CONSTRAINT_NAME,
       CT_CON.CONSTRAINT_TYPE,
       CT_COL.COLUMN_NAME,
       CT_COL.POSITION,
       CT_CON.SEARCH_CONDITION,
       CT_CON.DELETE_RULE,
       CT_CON.DEFERRABLE,
       CT_CON.DEFERRED,
       CT_CON.STATUS,
       PT_COL.TABLE_NAME "PARENT TABLE_NAME",
       PT_COL.CONSTRAINT_NAME "PARENT PK CONSTRAINT",
       PT_COL.COLUMN_NAME "PARENT COLUMN_NAME",
       PT_COL.POSITION "PARENT COL POSITION"
FROM USER_CONS_COLUMNS CT_COL, USER_CONSTRAINTS CT_CON
    LEFT OUTER JOIN USER_CONS_COLUMNS PT_COL ON CT_CON.R_CONSTRAINT_NAME = PT_COL.CONSTRAINT_NAME
WHERE CT_CON.CONSTRAINT_TYPE IN ('R', 'C', 'P', 'U') AND
      CT_COL.CONSTRAINT_NAME = CT_CON.CONSTRAINT_NAME AND
      CT_COL.TABLE_NAME = 'FERIENWOHNUNG'
ORDER BY CT_CON.CONSTRAINT_TYPE, CT_COL.POSITION;
