CREATE OR REPLACE FUNCTION ConcatERemove(s IN VARCHAR2
                                        ,t IN VARCHAR2
                                        ,k IN VARCHAR2)
                                        RETURN VARCHAR2 AS
                                        
  /*VARIAVEIS AUXILIARES*/
  status VARCHAR2(20);  
  aux_s VARCHAR2(20);
  aux_t VARCHAR2(20);
  igual NUMBER := 0;
  diff NUMBER := 0;
  v_count NUMBER := 0;
  resultado VARCHAR2(4) := NULL;
  
BEGIN
  /*VALIDAÇÕES*/  
  --a) 1 <= |s| <= 100
  IF (1 <= LENGTH(s)) OR LENGTH(s) <= 100 THEN 
    status := 'OK';
  END IF;  
  --b) 1 <= |t| <= 100
  IF (1 <= LENGTH(t)) OR LENGTH(t) <= 100 THEN 
    status := 'OK';
  END IF;  
  --c) 1 <= k <= 100
  IF (1 <= LENGTH(k)) OR LENGTH(k) <= 100 THEN 
    status := 'OK';
  END IF;      
  --d) s e t consiste de letras minúsculas do alfabeto português, ascii[a-z]
  IF UPPER(s) = s THEN 
    status := 'ERRO';
  ELSE
    status := 'OK';
  END IF;
  
  BEGIN
    /*TESTA CARACTER POR CARACTER*/
    IF status = 'OK' THEN 
      FOR x IN 1..Length(s) LOOP
        IF Substr(s,x,1) = Substr(t,x,1) THEN 
          igual := igual +1;
          aux_s := aux_s ||Substr(s,x,1);
        ELSE       
          diff := diff +1;    
          aux_t := aux_t||Substr(t,x,1);
        END IF;
      END LOOP;
      
      /*CONCATENAÇÃO DE STRINGS*/
      aux_s := CONCAT(aux_s,aux_t);
      
      /*CONTAGEM DE MOVIMENTOS*/
      v_count := diff + LENGTH(aux_t);
      
      /*TESTE DE MOVIMENTOS*/
      IF v_count <= K THEN
        resultado := 'sim';
      ELSE 
        resultado := 'não';  
      END IF;  
    END IF;  
  END;
  
  RETURN (resultado);

END;
