CREATE TABLE IF NOT EXISTS users(
  user_id SERIAL PRIMARY KEY, 
  first_name VARCHAR(50), 
  last_name VARCHAR(50), 
  email VARCHAR(355) UNIQUE NOT NULL, 
  password VARCHAR(100),
  security_question VARCHAR(100),
  security_answer VARCHAR(100),
  status VARCHAR(100),
  created_on TIMESTAMP DEFAULT NOW()
);
  
CREATE TABLE IF NOT EXISTS role(
 role_id SERIAL PRIMARY KEY,
 role_name VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS user_role
(
  user_id INTEGER NOT NULL,
  role_id INTEGER NOT NULL,
  grant_date TIMESTAMP WITHOUT TIME ZONE,
  PRIMARY KEY (user_id, role_id),
  CONSTRAINT user_role_role_id_fkey FOREIGN KEY (role_id)
      REFERENCES role (role_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT user_role_user_id_fkey FOREIGN KEY (user_id)
      REFERENCES users (user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);