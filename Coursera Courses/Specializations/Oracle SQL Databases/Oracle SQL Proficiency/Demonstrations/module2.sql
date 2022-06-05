-- CREATE and ALTER (DDL)

-- Generate full name column from first name and last name

CREATE TABLE Customers
(
  custID number generated by default AS identity, 
  custName varchar2(20), 
  contact_fname varchar2(20), 
  contact_lname varchar2(20), 
  contact_full_name varchar2(51) generated always AS (contact_fname || ' ' || contact_lname),
  PRIMARY KEY (custID)
);

-- Timestamps

ALTER TABLE Customers
  ADD 
  (
  registered_at TIMESTAMP WITH TIME ZONE NOT NULL, 
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL
  );
  
INSERT INTO Customers (custName, contact_fname, contact_full_name, registered_at, updated_at)
  VALUES ('abc corp', 'Jack', 'Sparrow', current_timestamp, current_timestamp);
  
-- Setup

CREATE TABLE Employees
(
  empID number generated by default AS identity, 
  last_name varchar2(20) NOT NULL, 
  first_name varchar2(20) NOT NULL, 
  email varchar2(20)
);

-- Insert some employees with only first and last name (no email)

-- Update email column in ALL rows

UPDATE Employees 
  SET email = LOWER(last_name || ' ' || first_name || '@company.com');
  
  
  


