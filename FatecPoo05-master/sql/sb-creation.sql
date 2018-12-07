Insert into USUARIO(CPF_USUARIO, NM_USUARIO, NM_TELEFONE,NM_LOGIN,NM_SENHA,TIPO_USUARIO) values ('12345678911','Sidney','35678899', 'Sidney18','123456','user');
Insert into USUARIO(CPF_USUARIO, NM_USUARIO, NM_TELEFONE,NM_LOGIN,NM_SENHA,TIPO_USUARIO) values ('11111111111','Weslley','35678899', 'Wes18','123456','user');
Insert into USUARIO(CPF_USUARIO, NM_USUARIO, NM_TELEFONE,NM_LOGIN,NM_SENHA,TIPO_USUARIO) values ('22222222222','Júlio','35678899', 'Julio18','123456','user');
Insert into USUARIO(CPF_USUARIO, NM_USUARIO, NM_TELEFONE,NM_LOGIN,NM_SENHA,TIPO_USUARIO) values ('33333333333','Jeferson','35678899', 'Jeff18','123456','user');
Insert into USUARIO(CPF_USUARIO, NM_USUARIO, NM_TELEFONE,NM_LOGIN,NM_SENHA,TIPO_USUARIO) values ('44444444444','Maria','35678899', 'Maria18','123456','user');
Insert into USUARIO(CPF_USUARIO, NM_USUARIO, NM_TELEFONE,NM_LOGIN,NM_SENHA,TIPO_USUARIO) values ('98765432100','Admin','35612245', 'Admin','admin','adm');
Insert into Bike(ID_BIKE,VL_PRECOHORA,NM_MODELO,DSC_STATUS) values (1, 7, '21 Marchas','Disponível'),
    (2, 9,'18 Marchas','Disponível'),
    (3, 13,'Trilha','Disponível'),
    (4, 15,'Corrida','Disponível'),
    (5, 21,'Urbana','Disponível');

Insert into ALUGUEL(FK_ID_BIKE,VL_TOTAL,TP_PAGAMENTO,FK_NM_LOGIN,HR_RETIRADO,HR_DEVOLUCAO) values (1,17,'Dinheiro','Sidney18','14:00:00','15:00:00'),
    (1,49,'Dinheiro','Wes18','11:00:00','18:00:00'),
    (1,84,'Dinheiro','Sidney18','08:00:00','20:00:00'),
    (1,28,'Crédito','Wes18','17:00:00','21:00:00'),
    (1,14,'Crédito','Wes18','12:00:00','14:00:00'),
    (2,18,'Débito','Julio18','8:00:00','10:00:00'),
    (2,9,'Dinheiro','Wes18','14:00:00','15:00:00'),
    (3,52,'Crédito','Jeff18','12:00:00','16:00:00'),
    (3,13,'Dinheiro','Sidney18','14:00:00','15:00:00'),
    (4,90,'Dinheiro','Julio18','12:00:00','18:00:00'),
    (5,189,'Crédito','Julio18','10:00:00','19:00:00');
