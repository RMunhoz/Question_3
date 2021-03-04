/*EXECUÇÃO DA FUNÇÃO ConcatERemove*/

SET SERVEROUTPUT ON
SET VERIFY OFF
BEGIN
  DECLARE
  v_teste VARCHAR2(10) := NULL;
    BEGIN
      v_teste := ConcatERemove(s => 'blablablabla'
                              ,t => 'blablabcde'
                              ,k => 8);
      dbms_output.put_line(v_teste);                      
    END;
END;
