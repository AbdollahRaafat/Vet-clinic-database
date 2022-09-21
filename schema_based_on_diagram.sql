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
