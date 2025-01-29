create table tabelaclientes(
  ID_Cliente int primary key,
  Nome_Cliente varchar (250),
  Informacoes_de_Contato varchar (250)
);

ALTER TABLE tabelaclientes ADD Endereco_Clientes VARCHAR (250);

create table tabelacategorias(
  ID_Categoria int primary key,
  Nome_Categoria varchar (250),
  Descricao_Categoria text
);

create table tabelaprodutos (
  ID_Produto int PRIMARY key,
  Nome_Produto varchar (250),
  Descricao text,
  Categoria int,
  Preco_de_Compra decimal (10,2),
  Unidade varchar (50),
  Fornecedor int,
  Data_de_inclusao date,
  FOREIGN key (Categoria) references tabelacategorias (id_categoria)
  FOREIGN key (Fornecedor) references tabelafornecedores (id)
);

insert into tabelaclientes
(id_cliente,
 nome_cliente,
 informacoes_de_contato,
 endereco_clientes)
 values
 ('1', 'Ana Silva', 'ana.silva@gmail.com', 'rua flores - casa 1');
 
 insert into tabelaclientes
 (id_cliente,
 nome_cliente,
 informacoes_de_contato,
 endereco_clientes)
 VALUES
 ('2','João Santos', 'joao.santos@provedor.com', 'rua dos pinheiros, 25'),
 ('3','Maria Fernandes', 'maria.fernandes@provedor.com', 'rua santo antonio, 18'),
 ('4','Carlos Pereira', 'carlos.pereira@provedor.com', 'avenida rios, 67');
 
 INSERT INTO tabelaclientes
(id_cliente,
 nome_cliente,
 informacoes_de_contato,
 endereco_clientes)
 VALUES
(5,'Patrícia Lima','patricia.lima@email.com','Rua das Flores, 123'),
(6,'Rodrigo Almeida','rodrigo.almeida@email.com','Avenida Central, 456');

INSERT INTO tabelaprodutos (
  ID_Produto,
  Nome_Produto,
  Descricao,
  Categoria,
  Preco_de_Compra,
  Unidade,
  Fornecedor,
  Data_de_inclusao)
VALUES
(1, 'Smartphone X', 'Smartphone de última geração', 1, 699.99, 'Unidade', 1, '2023-08-01'),
(2, 'Notebook Pro', 'Notebook poderoso com tela HD', 2, 1199.99, 'Unidade', 2, '2023-08-02'),
(3, 'Tablet Lite', 'Tablet compacto e leve', 3, 299.99, 'Unidade', 3, '2023-08-03');
 
 create table tabelapedidosgold(
  ID_pedido_gold int primary key,
  Data_do_pedido_gold date,
  Status_gold varchar (50),
  Total_do_pedido_gold decimal(10,2),
  Cliente_gold int,
  Data_de_envio_estimada_gold date,
  FOREIGN key (cliente_gold) references tabelaclientes(id_cliente)
);

insert into tabelapedidosgold
(ID_pedido_gold,
 Data_do_pedido_gold,
 Status_gold,
 Total_do_pedido_gold,
 Cliente_gold,
 Data_de_envio_estimada_gold)
 select
 id,
 data_do_pedido,
 status,
 total_do_pedido,
 cliente,
 data_de_envio_estimada 
 from tabelapedidos 
 where total_do_pedido >= 400;
 
 create table tabelafuncionarios(
  ID_Funcionario varchar (250) primary key,
  Nome_Funcionario varchar (250),
  Cargo_Funcionario varchar (250),
  Departamento varchar (250),
  Data_de_contratacao date,
  Salario decimal(10,2)
);

INSERT INTO tabelafuncionarios
(ID_Funcionario,
 Nome_Funcionario,
 Cargo_Funcionario,
 Departamento,
 Data_de_contratacao,
 Salario)
 VALUES
('32D','João Silva','Desenvolvedor de Software','TI','2023-10-24','6000.00');

SELECT * from tabelapedidos where data_de_envio_estimada BETWEEN '2023-08-01' and '2023-09-01';

select * from tabelapedidos where not status = 'Pendente';

select * from tabelaprodutos where preco_de_compra BETWEEN 200 and 600 order by nome_produto DESC;

SELECT informacoes_de_contato as email_cliente from tabelaclientes;

UPDATE tabelapedidos set status = 'Enviado' where status = 'Processando';

update tabelaclientes set informacoes_de_contato = 'j.santos@email.com', 
endereco_clientes = 'Rua dos paralelepípedos, 30' where id_cliente = 2;

DELETE from tabelafornecedores where país_de_origem = 'Turquia';

PRAGMA foreign_keys = ON;

CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    Descricao VARCHAR(100),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID) ON DELETE CASCADE
);