-- -----------------------------------------------------
-- Schema ads
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS ads;

-- -----------------------------------------------------
-- Table ads.Status
-- -----------------------------------------------------
CREATE TABLE ads.status (
  id SERIAL PRIMARY KEY,
  status VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table ads.Patient
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.patient (
  id SERIAL PRIMARY KEY,
  fname VARCHAR(45) NOT NULL,
  lname VARCHAR(45) NOT NULL,
  mi VARCHAR(45) NULL,
  building_floor INT NULL,
  status INT NULL 
    CHECK (status = 3 OR status = 4 OR status =5),
  bed INT NULL,
  CONSTRAINT status
    FOREIGN KEY (status)
    REFERENCES ads.status (id)
);

-- -----------------------------------------------------
-- Table ads.Doctor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.doctor (
  id SERIAL PRIMARY KEY,
  fname VARCHAR(45) NOT NULL,
  lname VARCHAR(45) NOT NULL,
  mi VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table ads.Medication
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.medication (
  id SERIAL PRIMARY KEY,
  name VARCHAR(45) NOT NULL,
  strength varchar(10) NOT NULL,
  expiration DATE NOT NULL
);

-- -----------------------------------------------------
-- Table ads.Order
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.order (
  id SERIAL PRIMARY KEY,
  patient INT NOT NULL,
  doctor INT NOT NULL,
  medication INT NOT NULL,
  dosage varchar(255) NOT NULL,
  status INT NOT NULL CHECK (status = 1 OR status = 2),
  CONSTRAINT patient
    FOREIGN KEY (patient)
    REFERENCES ads.patient (id),
  CONSTRAINT doctor
    FOREIGN KEY (doctor)
    REFERENCES ads.doctor (id),
  CONSTRAINT medication
    FOREIGN KEY (medication)
    REFERENCES ads.medication (id),
  CONSTRAINT status
    FOREIGN KEY (status)
    REFERENCES ads.status (id)
);

-- -----------------------------------------------------
-- Table ads.Machine
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.machine (
  id SERIAL PRIMARY KEY,
  building_floor INT NULL,
  num_drawers INT NULL
  );

-- -----------------------------------------------------
-- Table ads.Role
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.role (
  id SERIAL PRIMARY KEY,
  type VARCHAR(45) NOT NULL
  );

-- -----------------------------------------------------
-- Table ads.User
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.user (
  id SERIAL PRIMARY KEY,
  username VARCHAR(45) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role INT NULL,
  fname VARCHAR(45) NOT NULL,
  lname VARCHAR(45) NOT NULL,
  mi VARCHAR(10) NULL,
  CONSTRAINT role
    FOREIGN KEY (role)
    REFERENCES ads.role (id)
);

-- -----------------------------------------------------
-- Table ads.Inventory
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.inventory (
  drawer INT NOT NULL,
  machine INT NOT NULL,
  medication INT NOT NULL,
  qty INT NOT NULL,
  active BOOLEAN NULL,
  audit_date DATE NULL,
  last_audited_by INT NULL,
  min_qty INT NOT NULL,
  max_qty INT NOT NULL,
  PRIMARY KEY (drawer, machine),
  CONSTRAINT machine
    FOREIGN KEY (machine)
    REFERENCES ads.machine (id),
  CONSTRAINT last_audited_by
    FOREIGN KEY (last_audited_by)
    REFERENCES ads.user (id),
  CONSTRAINT medication
    FOREIGN KEY (medication)
    REFERENCES ads.medication (id)
);

-- -----------------------------------------------------
-- Table ads.Nurse
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ads.nurse (
  id SERIAL PRIMARY KEY,
  shift VARCHAR(45) NULL,
  CONSTRAINT id
    FOREIGN KEY (id)
    REFERENCES ads.user (id)
);