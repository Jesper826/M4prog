ALTER TABLE huisdieren DROP COLUMN eigenaar;
ALTER TABLE huisdieren ADD eigenaarid INT NOT NULL;

update huisdieren set eigenaarid = 3 where id = 1;

