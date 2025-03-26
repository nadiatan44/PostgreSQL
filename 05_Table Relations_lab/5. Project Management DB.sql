CREATE TABLE clients(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
    name VARCHAR(100)
);

CREATE TABLE employees(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INTEGER
);

CREATE TABLE projects(
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    client_id INTEGER,
    project_lead_id INTEGER,
    CONSTRAINT fk_projects_clients
        FOREIGN KEY (client_id)
            REFERENCES clients(id),
    CONSTRAINT fk_projects_employees
        FOREIGN KEY (project_lead_id)
            REFERENCES employees(id)
);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_projects
    FOREIGN KEY (project_id)
        REFERENCES projects(id)
