CREATE DATABASE MarinkeP2;
USE MarinkeP2;

-- Criando as tabelas
CREATE TABLE if NOT EXISTS Cliente (
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Funcionario (
	id_funcionario INT PRIMARY KEY,
	nome VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Produto (
  id_produto INT PRIMARY KEY,
  preco_unitario DOUBLE,
  quantidade_estoque INT,
  quantidade_minima INT,
  marca VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Pedido (
  id_pedido INT PRIMARY KEY,
  data_hora DATETIME
);

CREATE TABLE if NOT EXISTS Mesa (
  id_mesa INT PRIMARY KEY,
  status VARCHAR(45),
  id_pedido INT,
  FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

CREATE TABLE if NOT EXISTS Mesa_Cliente (
	id_mesa_cliente INT PRIMARY KEY,
	id_mesa INT,
	id_cliente INT,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
	FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa)
);

CREATE TABLE if NOT EXISTS Mesa_Funcionario (
	id_mesa_funcionario INT PRIMARY KEY,
	id_funcionario INT,
	id_mesa INT,
	FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
	FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa)
);

CREATE TABLE if NOT EXISTS Item_Pedido (
  id_item_pedido INT PRIMARY KEY,
  id_pedido INT,
  id_produto INT,
  quantidade INT,
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE if NOT EXISTS Forma_Pagamento (
  id_forma_pagamento INT PRIMARY KEY,
  descricao VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Fechamento (
  id_fechamento INT PRIMARY KEY,
  id_pedido INT,
  valor_total DOUBLE,
  id_forma_pagamento INT,
  data_hora DATETIME,
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
  FOREIGN KEY (id_forma_pagamento) REFERENCES Forma_Pagamento(id_forma_pagamento)
);