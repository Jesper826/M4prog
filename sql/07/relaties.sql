
insert into ingredient (id,naam) values 
(1,'pindas');

insert into voedselProduct (hoofdIngredientId,naam) values 
(1,'pindakaas');



 ALTER TABLE voedselProduct
 ADD CONSTRAINT FK_voedselProduct_ingredient
 FOREIGN KEY (hoofdIngredientId) REFERENCES  
 TABEL2(id);

 insert into voedselProduct (hoofdIngredientId,naam) values 
(2,'honing');

insert into voedselProduct (hoofdIngredientId,naam) values 
(3,'bosbessenkwark');

insert into ingredient (id,naam) values 
(3,'bosbessen');



SELECT 
    k.naam AS kitten_naam,
    mama.naam AS mama_naam,
    papa.naam AS papa_naam
FROM 
    kitten k    
JOIN kat mama ON k.mamaId = mama.id
JOIN kat papa ON k.papaId = papa.id;
    