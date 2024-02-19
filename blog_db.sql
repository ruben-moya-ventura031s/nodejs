CREATE TABLE users (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO users (id, first_name, last_name, email)
VALUES
    (1, 'Robin', 'Arias', 'robin.arias@academlo.com'),
    (2, 'Isabelle', 'Rodriguez', 'isa.rdguez@academlo.com'),
    (3, 'Angel', 'de Leon', 'angel.leon@academlo.com');

CREATE TABLE posts (
    id INT PRIMARY KEY,
    creator_id INT,
    title VARCHAR(255),
    text TEXT,
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

INSERT INTO posts (id, creator_id, title, text)
VALUES
    (1, 1, 'Post 1', 'Lorem ipsum dolor sit amet.'),
    (2, 2, 'Post 2', 'Consectetur adipiscing elit.'),
    (3, 3, 'Post 3', 'Sed do eiusmod tempor.'),
    (4, 1, 'Post 4', 'Incididunt ut labore et dolore.'),
    (5, 2, 'Post 5', 'Magna aliqua. Ut enim ad minim veniam.');

CREATE TABLE likes (
    id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

INSERT INTO likes (id, user_id, post_id)
VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 4),
    (4, 1, 5),
    (5, 2, 3);

SELECT posts.id, posts.title, posts.text, users.first_name, users.last_name, users.email
FROM posts
JOIN users ON posts.creator_id = users.id;


SELECT posts.id, posts.title, posts.text, users.first_name, users.last_name, users.email
FROM posts
JOIN likes ON posts.id = likes.post_id
JOIN users ON likes.user_id = users.id;
