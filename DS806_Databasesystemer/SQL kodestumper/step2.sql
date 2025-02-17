create procedure step2()
begin
  declare i int;
  declare j int;
  declare k int;
  delete from t3;
  delete from t4;
  set i = 10;
  set k = 1000;
  while i < 15 do
        insert into t3 (dist, repno, repname) values (i, i, concat('distrikt', i));
    set j = 0;
        while j < 10000 do
          insert into t4 (cust, custname, district, revenue)
                  values (k, concat('Navn', k), i, rand() * 1000000);
          set j = j + 1;
          set k = k + 1;
        end while;
        set i = i + 1;
  end while;
end;