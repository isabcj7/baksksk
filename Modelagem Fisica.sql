create database ModelagemFisica_db;

use ModelagemFisica_db;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    preferencias TEXT,
    INDEX idx_email (email)
);

CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL UNIQUE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    INDEX idx_id_usuario (id_usuario)
);

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    id_estoque INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    data_vencimento DATE,
    preco DECIMAL(10,2),
    FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque) ON DELETE CASCADE,
    INDEX idx_id_estoque (id_estoque),
    INDEX idx_data_vencimento (data_vencimento)
);

-- Tabela: fornecedor
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    api_endpoint VARCHAR(255),
    INDEX idx_nome (nome)
);

-- Tabela: conteudo_educativo
CREATE TABLE conteudo_educativo (
    id_conteudo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    url_video VARCHAR(255) NOT NULL,
    duracao INT,
    INDEX idx_titulo (titulo)
);

CREATE TABLE usuario_conteudo (
    id_usuario INT NOT NULL,
    id_conteudo INT NOT NULL,
    data_acesso DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario, id_conteudo),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_conteudo) REFERENCES conteudo_educativo(id_conteudo) ON DELETE CASCADE,
    INDEX idx_usuario_conteudo (id_usuario, id_conteudo)
);

CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_estoque INT NOT NULL,
    id_fornecedor INT NOT NULL,
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'pendente',
    FOREIGN KEY (id_estoque) REFERENCES estoque(id_estoque) ON DELETE CASCADE,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor) ON DELETE CASCADE,
    INDEX idx_estoque_fornecedor (id_estoque, id_fornecedor)
);

select * from usuario;

select * from produto;

select * from fornecedor;

select * from conteudo_educativo;

select * from pedido;