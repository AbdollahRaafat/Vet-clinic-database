create table patients(
id INT PRIMARY KEY,
name VARCHAR,
date_of_birth date);


create table medical_histories(
id INT PRIMARY KEY,
admitted_at DATE,
patient_id INT,
status VARCHAR,
FOREIGN KEY(patient_id) references patients(id));

 create table treatments (
id INT PRIMARY KEY,
type varchar,
name varchar,
foreign key(id) references  medical_histories(id));

create table invoices( id INT PRIMARY KEY, total_amount DEC, generated_at date, payed_at date, medical_history_id INT, FOREIGN KEY (medical_history_id) REFERENCES MEDICAL_HISTORIES(ID)); 

create table invoice_items( id INT, unit_price DEC, quantity INT, total_price DEC, invoice_id INT, treatment_id int, FOREIGN KEY (invoice_id) REFERENCES invoices(ID), FOREIGN KEY (treatment_id) REFERENCES treatments(ID)); 
