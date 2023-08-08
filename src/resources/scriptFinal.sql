
DROP DATABASE IF EXISTS get_that_auto;

CREATE DATABASE IF NOT EXISTS get_that_auto;
-- Usa o banco de dados get_that_auto
USE get_that_auto;


-- -----------------------------------------------------
-- Table .`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `login` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(45) NOT NULL, 
  `senha` VARCHAR(255) NOT NULL, 
  `tipo_usuario` ENUM('vendedor', 'master') NOT NULL, 
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario` (`cpf`)
);


-- -----------------------------------------------------
-- Table .`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` INT NOT NULL AUTO_INCREMENT,
  `razaosocial` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  `nomefantasia` VARCHAR(100) NOT NULL,
  `porteEmpresa` ENUM('pequena', 'média', 'grande') NOT NULL,
  PRIMARY KEY (`idempresa`)
);




-- -----------------------------------------------------
-- Table .`vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendedores` (
  `idvendedores` INT NOT NULL,
  `salario` DOUBLE NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvendedores`)
);

-- -----------------------------------------------------
-- Table .`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enderecos` (
  `cep` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table .`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locador` (
  `pessoas_cpf` INT NOT NULL,
  `telContato` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `enderecos_id` INT NOT NULL,
  PRIMARY KEY (`pessoas_cpf`),
  FOREIGN KEY (`enderecos_id`) REFERENCES `enderecos` (`id`)
);

-- -----------------------------------------------------
-- Table .`vendaRegistros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluguelRegistros` (
  `idvenda` INT NOT NULL,
  `formaPagamento` VARCHAR(45) NOT NULL,
  `data` DATETIME NOT NULL,
  `valor` DOUBLE NOT NULL,
  `carrinho` VARCHAR(45) NOT NULL,
  `vendedores_idvendedores` INT NOT NULL,
  `locador_pessoas_cpf` INT NOT NULL,
  PRIMARY KEY (
    `idvenda`,
    `vendedores_idvendedores`,
    `locador_pessoas_cpf`
  ),
  FOREIGN KEY (`vendedores_idvendedores`) REFERENCES `vendedores` (`idvendedores`),
  FOREIGN KEY (`locador_pessoas_cpf`) REFERENCES `locador` (`pessoas_cpf`)
);

-- -----------------------------------------------------
-- Table .`fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fornecedores` (
  `cnpj` INT NOT NULL,
  `enderecos_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` INT NOT NULL,
  PRIMARY KEY (`cnpj`),
  FOREIGN KEY (`enderecos_id`) REFERENCES `enderecos` (`id`)
);
-- -----------------------------------------------------
-- Table .`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categorias` (
  `idcategorias` INT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias`)
);

-- -----------------------------------------------------
-- Table .`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veiculo`(
  `idVeiculo` INT NOT NULL,
  `quantAssento` INT NOT NULL,
  `tipoCambio` VARCHAR(45) NOT NULL,
  `quantPortas` INT NOT NULL,
  `espacoPortaMalas` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `ano` INT NOT NULL,
  `notaAvaliacao` INT NOT NULL,
  `precoPorDia` INT NOT NULL,
  `imgBase64` VARCHAR(100) NOT NULL DEFAULT "",
  `unidadeEmEstoque` INT NOT NULL,
  `categorias_idcategorias` INT NOT NULL,
  `fornecedores_cnpj` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `fornecedores_cnpj`),
  FOREIGN KEY (`categorias_idcategorias`) REFERENCES `categorias` (`idcategorias`),
  FOREIGN KEY (`fornecedores_cnpj`) REFERENCES `fornecedores` (`cnpj`)
);



-- inserts patricia
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('95560', '1', 'PO Box 26708', '9th Floor', 'PO Box 59776', '7th Floor');
 insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('95590', '2', 'PO Box 74593', 'Suite 85', 'Apt 359', 'Room 630');
insert into enderecos (cep, id, rua, bairro, cidade, estado) values ('9899', '3', 'Apt 1550', 'Apt 1844', 'Suite 82', 'Suite 87');




insert into categorias (idcategorias, categoria) values ('1', 'felis');
insert into categorias (idcategorias, categoria) values ('2', 'justo');
insert into categorias (idcategorias, categoria) values ('23', 'in lectus');
insert into categorias (idcategorias, categoria) values ('24', 'sapien ');
insert into categorias (idcategorias, categoria) values ('25', 'semper');

-- inserts emily alves -- corrigidos


 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (82, 1, 'João',  34244624); 
 insert into fornecedores (cnpj,  enderecos_id, nome, telefone) values (83, 2, 'Bruno',  25152528); 


 
 ----- CRIAR INSERTS PARA  CRIACAO DE VEICULO NO SISTEMA 
 
 
 
-- inserts andri
 insert into vendedores (idVendedores, salario, nome, sobrenome) values (1, 2574.89, 'Garreth', 'Espinoy'  );
insert into vendedores (idVendedores, salario, nome, sobrenome) values (2, 1883.12, 'Jess', 'McMichan' );
 insert into vendedores (idVendedores, salario, nome, sobrenome  ) values (3,1883.16,'José','carols');

 insert into vendedores (idVendedores, salario, nome, sobrenome ) values (4, 1844.79, 'Brigg', 'McNeill');
 insert into vendedores (idVendedores, salario, nome, sobrenome) values (7, 1386.02, 'Sol', 'Winspur');
insert into vendedores (idVendedores, salario, nome, sobrenome ) values (8, 2896.38, 'Caressa', 'Clair');



 insert into locador (pessoas_cpf, telContato, nome,  sobrenome, enderecos_id) values ('212213454', '47988', 'Joanna', 'oldey',  1);
 insert into locador (pessoas_cpf,telContato, nome, sobrenome, enderecos_id) values ('768541784', '4798688', 'Miguela', 'Gettens', 3);
 insert into locador (pessoas_cpf,telContato, nome, sobrenome, enderecos_id) values ('103966036', '47984273', 'Olivia', 'Benedito', 2);








