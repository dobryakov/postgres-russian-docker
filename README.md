# postgres-russian-docker

Postgresql 9.4 with russian dictionaries for full-text search with russian morphology

It allows to use SQL queries like:

SELECT * FROM objects WHERE to_tsvector('russian', title) @@ plainto_tsquery('russian', 'Водка матрёшка балалайка');
