INSERT INTO Livros (titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, paginas, idioma)
VALUES ('As Crônicas de Nárnia', 'C.S. Lewis', 1950, 'disponível', 'Fantasia', '978-0064471190', 'HarperCollins', 768, 'Inglês');

INSERT INTO Livros (titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, paginas, idioma)
VALUES ('Cem Anos de Solidão', 'Gabriel Garcia Marquez', 1967, 'disponível', 'Ficção', '978-0241968581', 'Penguin Books', 422, 'Espanhol');

INSERT INTO Livros (titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, paginas, idioma)
VALUES ('Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 'disponível', 'Fantasia', '978-0439708180', 'Bloomsbury', 309, 'Inglês');

INSERT INTO Livros (titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, paginas, idioma)
VALUES ('O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 1954, 'disponível', 'Fantasia', '978-0618640157', 'HarperCollins', 423, 'Inglês');

INSERT INTO categorias (nome) VALUES ('História');
SET Categoria_id = (SELECT id FROM categorias WHERE nome = 'História');

UPDATE livros
SET disponibilidade = FALSE
WHERE ano_publicacao < 2000;

UPDATE livros
SET editora = 'Plume Books'
WHERE titulo = '1984';

UPDATE livros
SET idioma = 'Inglês'
WHERE editora = 'Penguin Books';

UPDATE livros
SET titulo = 'Harry Potter e a Pedra Filosofal (Edição Especial)'
WHERE isbn = '978-0439708180';

DELETE FROM nome_da_tabela WHERE categoria = 'Terror';

DELETE FROM livros
WHERE idioma = 'Francês' AND ano_publicacao < 1970;

DELETE FROM livros
WHERE titulo = 'As Crônicas de Nárnia';

DELETE FROM nome_da_tabela WHERE editora = 'Penguin Books';

SELECT *
FROM livros
WHERE numero_de_paginas > 500;

SELECT categoria, COUNT(*) AS total_de_livros
FROM livros
GROUP BY categoria;

SELECT * FROM nome_da_tabela ORDER BY data_de_adicao LIMIT 5;

SELECT 
    sum(paginas) AS total_paginas,
    count(*) AS total_livros,
    AVG(paginas) AS media_paginas
FROM 
    livros
WHERE 
    categoria = 'Drama';
    
    SELECT AVG(ano_publicacao) AS media_ano_publicacao FROM livros;

SELECT 
    MAX(data_publicacao) AS livro_mais_recente,
    MIN(data_publicacao) AS livro_mais_antigo
FROM
    livros;

SELECT * FROM livros
ORDER BY ano_publicacao DESC;

SELECT titulo
FROM livros
WHERE idioma = 'Inglês'

UNION

SELECT titulo
FROM livros
WHERE idioma = 'Português';

CREATE TABLE autores (
    autor_id INT PRIMARY KEY,
    nome_autor VARCHAR(100)
);

CREATE TABLE livros (
    livro_id INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

INSERT INTO autores (autor_id, nome_autor) VALUES
(1, 'George Orwell');

INSERT INTO livros (livro_id, titulo, autor_id) VALUES
(1, '1984', 1),
(2, 'Animal Farm', 1);