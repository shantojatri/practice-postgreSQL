--? one to one relationship
--? An author can write only one article and an article is written by only one author
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  name TEXT
)

CREATE TABLE article (
  id SERIAL PRIMARY KEY,
  author_id INT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id)
)


--? Many to many relationship
--? An article can have multiple tags and a tag can belong to multiple articles
CREATE TABLE article (
  id SERIAL PRIMARY KEY,
  title TEXT
)

CREATE TABLE tag (
  id SERIAL PRIMARY KEY,
  tag_value TEXT
)

--? Many to many relationship via a pivot table
--? An article can have multiple tags and a tag can belong to multiple articles
CREATE TABLE article_tag (
  article_id INT
  tag_id INT
  PRIMARY KEY (article_id, tag_id)
  CONSTRAINT fk_article FOREIGN KEY(article_id) REFERENCES article(id)
  CONSTRAINT fk_tag FOREIGN KEY(tag_id) REFERENCES tag(id)
)