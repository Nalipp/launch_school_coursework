CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount decimal(13, 2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL
);

ALTER TABLE expenses ADD CHECK(amount > 0);
