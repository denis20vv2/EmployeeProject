     CREATE TABLE position (
        id bigint NOT NULL,
        position VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE SEQUENCE position_seq
       START WITH 1
       INCREMENT BY 1;

     CREATE TABLE department (
        id bigint NOT NULL,
        department VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE SEQUENCE department_seq
       START WITH 1
       INCREMENT BY 1;

    CREATE TABLE rule (
        id bigint NOT NULL,
        rule VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE SEQUENCE rule_seq
       START WITH 1
       INCREMENT BY 1;

    CREATE TABLE grade_level (
        id bigint NOT NULL,
        grade_level VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE SEQUENCE grade_level_seq
       START WITH 1
       INCREMENT BY 1;

    CREATE TABLE project (
        id bigint NOT NULL,
        project VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE SEQUENCE project_seq
       START WITH 1
       INCREMENT BY 1;

    CREATE TABLE direction (
        id bigint NOT NULL,
        direction VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE SEQUENCE direction_seq
       START WITH 1
       INCREMENT BY 1;

    CREATE TABLE briefcase (
        id bigint NOT NULL,
        briefcase VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

    CREATE SEQUENCE briefcase_seq
       START WITH 1
       INCREMENT BY 1;

-- таблица сотрудника
    CREATE TABLE employee (
    id bigint  NOT NULL,
    position_id bigint NOT NULL,
    rule_id bigint NOT NULL,
    grade_level_id bigint NOT NULL,
    salary bigint NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_position FOREIGN KEY (position_id) REFERENCES position (id) ON DELETE CASCADE,
    CONSTRAINT fk_rule FOREIGN KEY (rule_id) REFERENCES rule (id) ON DELETE CASCADE,
    CONSTRAINT fk_grade_level FOREIGN KEY (grade_level_id) REFERENCES grade_level (id) ON DELETE CASCADE
);

    CREATE SEQUENCE employee_seq
       START WITH 1
       INCREMENT BY 1;

-- таблица связности сотрудника и отдела(ManyToMany)
    CREATE TABLE employee_department (
       employee_id bigint  NOT NULL,
       department_id bigint NOT NULL,
       PRIMARY KEY (employee_id, department_id),
       CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employee (id) ON DELETE CASCADE,
       CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department (id) ON DELETE CASCADE
    );

-- таблица связности сотрудника и проекта(ManyToMany)
    CREATE TABLE employee_project (
        employee_id bigint  NOT NULL,
        project_id bigint NOT NULL,
        PRIMARY KEY (employee_id, project_id),
        CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employee (id) ON DELETE CASCADE,
        CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES project (id) ON DELETE CASCADE
    );

-- таблица связности сотрудника и направления(ManyToMany)
    CREATE TABLE employee_direction (
        employee_id bigint  NOT NULL,
        direction_id bigint NOT NULL,
        PRIMARY KEY (employee_id, direction_id),
        CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employee (id) ON DELETE CASCADE,
        CONSTRAINT fk_direction FOREIGN KEY (direction_id) REFERENCES direction (id) ON DELETE CASCADE
    );

-- таблица связности сотрудника и портфеля(ManyToMany)
    CREATE TABLE employee_briefcase (
        employee_id bigint  NOT NULL,
        briefcase_id bigint NOT NULL,
        PRIMARY KEY (employee_id, briefcase_id),
        CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employee (id) ON DELETE CASCADE,
        CONSTRAINT fk_briefcase FOREIGN KEY (briefcase_id) REFERENCES briefcase (id) ON DELETE CASCADE
    );

 CREATE TABLE history_change_position (
    id bigint NOT NULL,
    position_id bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_position FOREIGN KEY (position_id) REFERENCES position (id) ON DELETE CASCADE
 );

CREATE SEQUENCE history_change_position_seq
       START WITH 1
       INCREMENT BY 1;

CREATE TABLE history_change_rule (
    id bigint NOT NULL,
    rule_id bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_rule FOREIGN KEY (rule_id) REFERENCES rule (id) ON DELETE CASCADE
 );

CREATE SEQUENCE history_change_rule_seq
       START WITH 1
       INCREMENT BY 1;

CREATE TABLE history_change_grade_level (
    id bigint NOT NULL,
    grade_level_id bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_grade_level FOREIGN KEY (grade_level_id) REFERENCES grade_level (id) ON DELETE CASCADE
 );

 CREATE SEQUENCE history_change_grade_level_seq
        START WITH 1
        INCREMENT BY 1;

CREATE TABLE history_change_salary (
    id bigint NOT NULL,
    salary bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id)
 );

 CREATE SEQUENCE history_change_salary_seq
         START WITH 1
         INCREMENT BY 1;

-------
  CREATE TABLE history_change_department (
    id bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id)
 );

  CREATE TABLE history_change_project (
    id bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id)
 );

  CREATE TABLE history_change_direction (
    id bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id)
 );

   CREATE TABLE history_change_briefcase (
    id bigint NOT NULL,
    actual_id bigint NOT NULL,
    date_change date NOT NULL,
    PRIMARY KEY (id)
 );
---------------
-- таблица связности сотрудника и отдела(ManyToMany)
    CREATE TABLE history_change_department_connectivity (
       history_change_department_id bigint  NOT NULL,
       department_id bigint NOT NULL,
       PRIMARY KEY (history_change_department_id, department_id),
       CONSTRAINT fk_history_change FOREIGN KEY (history_change_department_id) REFERENCES history_change_department (id) ON DELETE CASCADE,
       CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department (id) ON DELETE CASCADE
    );

-- таблица связности сотрудника и проекта(ManyToMany)
    CREATE TABLE history_change_project_connectivity (
        history_change_project_id bigint  NOT NULL,
        project_id bigint NOT NULL,
        PRIMARY KEY (history_change_project_id, project_id),
        CONSTRAINT fk_history_change FOREIGN KEY (history_change_project_id) REFERENCES history_change_project (id) ON DELETE CASCADE,
        CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES project (id) ON DELETE CASCADE
    );

-- таблица связности сотрудника и направления(ManyToMany)
    CREATE TABLE history_change_direction_connectivity (
        history_change_direction_id bigint  NOT NULL,
        direction_id bigint NOT NULL,
        PRIMARY KEY (history_change_direction_id, direction_id),
        CONSTRAINT fk_history_change FOREIGN KEY (history_change_direction_id) REFERENCES history_change_direction (id) ON DELETE CASCADE,
        CONSTRAINT fk_direction FOREIGN KEY (direction_id) REFERENCES direction (id) ON DELETE CASCADE
    );

-- таблица связности сотрудника и портфеля(ManyToMany)
    CREATE TABLE history_change_briefcase_connectivity (
        history_change_briefcase_id bigint  NOT NULL,
        briefcase_id bigint NOT NULL,
        PRIMARY KEY (history_change_briefcase_id, briefcase_id),
        CONSTRAINT fk_history_change FOREIGN KEY (history_change_briefcase_id) REFERENCES history_change_briefcase (id) ON DELETE CASCADE,
        CONSTRAINT fk_briefcase FOREIGN KEY (briefcase_id) REFERENCES briefcase (id) ON DELETE CASCADE
    );


  -- select * from employee;
  -- select * from history_change;
  -- select * from position;
  -- select * from department;
  -- select * from rule;
  -- select * from grade_level;
  -- select * from project;
  -- select * from direction;
  -- select * from briefcase;
