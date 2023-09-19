create database ecommerce;
use ecommerce;

create table cliente(
	id_cliente int auto_increment primary key,
    nome varchar(15),
    sobrenome varchar(15),
    cpf char(11) not null,
    endereço varchar (30),
    constraint unique_cpf unique (cpf)
    );
    
create table produto(
	id_produto int auto_increment primary key,
    descrição varchar(20),
    classificação enum('Eletronico', 'Acessorios', 'vestuario','digital')
    );
    
    
create table pedidos(
	id_pedido int auto_increment primary key,
    produtos int,
    comprador int,
    status_pedido enum('Separando', 'Separado', 'Em entrega', 'Entregue'),
    foreign key (produtos) references produto(id_produto),
    foreign key (comprador) references cliente(id_cliente)
	);
    
create table estoque(
	id_estoque int auto_increment primary key,
    produto_estoque int,
    quandidade int,
    foreign key (produto_estoque) references produto(id_produto)
	);
    
create table fornecedor(
	id_fornecedor int auto_increment primary key,
    cnpj char(14) not null,
    endereço varchar(30),
    produto_fornecedor int,
    constraint unique_cnpj unique (cnpj),
    foreign key (produto_fornecedor) references produto(id_produto)
	);
    
create table delivery(
	id_delivery int auto_increment primary key,
    pedido_para_entregar int
	);