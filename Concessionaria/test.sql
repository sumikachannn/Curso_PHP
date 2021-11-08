SELECT p. p_id, p.cus_id, p.p_name, c1.name1, c2.name2
FROM product AS p
LEFT JOIN customer1 AS c1
ON p.cus_id=c1.cus_id
LEFT JOIN customer2 AS c2
ON p.cus_id = c2.cus_id

SELECT p. p_id, p.cus_id, p.p_name, c1.name1, c2.name2
FROM product AS p
LEFT JOIN customer1 AS c1
ON p.cus_id=c1.cus_id
LEFT JOIN customer2 AS c2
ON p.cus_id = c2.cus_id


SELECT * FROM tb_usuario
SELECT * FROM tb_endereco
SELECT * FROM tb_telefone
SELECT * FROM tb_documentos_usuario
LEFT JOIN tb_usuario, tb_endereco, tb_telefone, tb_documentos_usuario
ON tb_usuario.cod_usuario = tb_endereco.cod_usuario AND tb_usuario.cod_usuario = tb_telefone.cod_usuario AND tb_usuario.cod_usuario = tb_documentos_usuario.cod_usuario