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

Insert into ALUGUEL(FK_ID_BIKE,HR_RETIRADO,VL_TOTAL,HR_DEVOLUCAO,TP_PAGAMENTO,FK_NM_LOGIN) values (1,'14:00:00',7,'15:00:00','Dinheiro','Sidney18'),
    (1,'11:00:00',49,'18:00:00','Dinheiro','Wes18'),
    (1,'08:00:00',84,'20:00:00','Dinheiro','Sidney18'),
    (1,'17:00:00',28,'21:00:00','Crédito','Wes18'),
    (1,'12:00:00',14,'14:00:00','Crédito','Wes18'),
    (2,'8:00:00',18,'10:00:00','Débito','Julio18'),
    (2,'14:00:00',9,'15:00:00','Dinheiro','Wes18'),
    (2,'16:00:00',45,'21:00:00','Crédito','Julio18'),
    (2,'7:00:00',63,'14:00:00','Débito','Jeff18'),
    (3,'12:00:00',52,'16:00:00','Crédito','Jeff18'),
    (3,'14:00:00',13,'15:00:00','Dinheiro','Sidney18'),
    (3,'12:00:00',39,'15:00:00','Débito','Jeff18'),
    (4,'10:00:00',30,'12:00:00','Débito','Sidney18'),
    (4,'12:00:00',90,'18:00:00','Dinheiro','Julio18'),
    (5,'10:00:00',189,'19:00:00','Crédito','Julio18');
