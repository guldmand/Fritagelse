delimiter //
create procedure step2b()
begin
  declare i int;
  declare j int;
  declare k int;
  delete from t13;
  delete from t14;
  set i = 10;
  set k = 1000;
  while i < 15 do
        insert into t13 (dist, repno, repname)
		values (i, i, concat('distrikt', i));
    set j = 0;
        while j < 10000 do
	call p_3(i, @bool);
	set @b =(select @bool);
	if @b = 1 then
          insert into t14 (cust, custname, district, revenue)
                  values (k, concat('Navn', k), i, rand() * 1000000);
          end if;
	      set j = j + 1;
          set k = k + 1;
        end while;
        set i = i + 1;
  end while;
end;
//
