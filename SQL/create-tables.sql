-- -----------------------------------------------------
-- Schema ADS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS ADS;

-- -----------------------------------------------------
-- Table ADS.Status
-- -----------------------------------------------------
CREATE TABLE ADS.Status (
  Id SERIAL PRIMARY KEY,
  Status VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table ADS.Patient
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Patient (
  Id SERIAL PRIMARY KEY,
  FName VARCHAR(45) NOT NULL,
  LName VARCHAR(45) NOT NULL,
  MI VARCHAR(45) NULL,
  Floor INT NOT NULL,
  p_Group INT NULL,
  Status INT NULL,
  CONSTRAINT Status
    FOREIGN KEY (Status)
    REFERENCES ADS.Status (Id)
);

-- -----------------------------------------------------
-- Table ADS.Doctor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Doctor (
  Id SERIAL PRIMARY KEY,
  FName VARCHAR(45) NOT NULL,
  LName VARCHAR(45) NOT NULL,
  MI VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table ADS.Medication
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Medication (
  Id SERIAL PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Expiration DATE NOT NULL
);

-- -----------------------------------------------------
-- Table ADS.Order
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Order (
  Id SERIAL PRIMARY KEY,
  Patient INT NULL,
  Doctor INT NULL,
  Medication INT NULL,
  Status VARCHAR(45) NULL,
  CONSTRAINT Patient
    FOREIGN KEY (Patient)
    REFERENCES ADS.Patient (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Doctor
    FOREIGN KEY (Doctor)
    REFERENCES ADS.Doctor (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Medication
    FOREIGN KEY (Medication)
    REFERENCES ADS.Medication (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table ADS.Machine
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Machine (
  Id SERIAL PRIMARY KEY,
  Floor INT NULL,
  Num_Drawers INT NULL
  );

-- -----------------------------------------------------
-- Table ADS.Role
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Role (
  Id SERIAL PRIMARY KEY,
  Type VARCHAR(45) NOT NULL)
;

-- -----------------------------------------------------
-- Table ADS.User
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.User (
  Id SERIAL PRIMARY KEY,
  Username VARCHAR(45) NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Role INT NULL,
  FName VARCHAR(45) NULL,
  LName VARCHAR(45) NULL,
  MI VARCHAR(10) NULL,
  CONSTRAINT Role
    FOREIGN KEY (Role)
    REFERENCES ADS.Role (Id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- -----------------------------------------------------
-- Table ADS.Inventory
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Inventory (
  Drawer INT NOT NULL,
  Machine INT NOT NULL,
  Medication INT NULL,
  Qty INT NULL,
  Active BOOLEAN NULL,
  Audit_Date DATE NULL,
  Last_Audited_By INT NULL,
  Min_qty INT NULL,
  Max_qty INT NULL,
  PRIMARY KEY (Drawer, Machine),
  CONSTRAINT Machine
    FOREIGN KEY (Machine)
    REFERENCES ADS.Machine (Id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Last_Audited_By
    FOREIGN KEY (Last_Audited_By)
    REFERENCES ADS.User (Id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT Medication
    FOREIGN KEY (Medication)
    REFERENCES ADS.Medication (Id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- -----------------------------------------------------
-- Table ADS.Nurse
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ADS.Nurse (
  Id SERIAL PRIMARY KEY,
  Shift VARCHAR(45) NULL,
  CONSTRAINT Id
    FOREIGN KEY (Id)
    REFERENCES ADS.User (Id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	)
;