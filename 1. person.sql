-- Untuk command prompt bantuan dalam SQL Sheel \?


-- Membuat database 
CREATE DATABASE db1;

-- Masuk dulu kedalam database dengan command : \c person

-- Membuat Table dalam database
CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	job VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL,
	country_of_birth VARCHAR(50) NOT NULL
);

-- DROP Table and DATABASE
-- DROP TABLE nama_table;
-- DROP DATABASE nama_database;

-- Contoh Menginput
INSERT INTO person (
    id, 
    first_name, 
    last_name, 
    email, gender, 
    job, 
    date_of_birth, 
    country_of_birth
    ) VALUES (
        1, 
        'Vera', 
        'Simoneau', 
        'vsimoneau0@discovery.com', 
        'Female', 
        'Staff Accountant IV', 
        '10/28/1991', 
        'China'
        );


-- Penggunaan DELETE Nilai dalam Table
-- Mengdelete semua nilai dalam person;
DELETE FROM person;
-- Mengdelete dengan nilai tertentu dalam person;
DELETE FROM person WHERE gender = 'Female' AND country_of_birth = 'Nigeria';


-- Melihat keseluruhan Database dengan memanggin nama tablenya
SELECT * FROM person;

-- Untuk melihat 1 kolom saja
SELECT first_name FROM person;

-- Mengnyortir data secara Ascending / Descending
-- Default ASC ; ASC = Ascending , DESC = Descending

SELECT * FROM person ORDER BY country_of_birth;

-- Penggunaan DISTINCT
-- Menghilangkan yang double

SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth DESC;

-- Penggunaan WHERE dan AND 
-- WHERE  = Hanya melihat data yang disesuakan
-- AND = tambahanya
-- OR = Perkalian

SELECT * FROM person WHERE ( gender = 'Male' OR gender = 'Unknown') AND country_of_birth = 'Poland';

-- Hanya Menampilkan 10 / 200 baris
SELECT * FROM person LIMIT 10;
SELECT * FROM person LIMIT 200;

-- Menampilkan semua data dari baris ke 6
SELECT * FROM person OFFSET 5;

-- Hanya menampilkan 5 baris tetapi mulai dari baris ke 6
SELECT * FROM person OFFSET 5 LIMIT 5;

-- Menampilkan Dengan jumlah tertentu dari baris ke 6 contoh 1

SELECT * FROM person OFFSET 5 FETCH FIRST 2 ROW ONLY;

-- Penggunaan Syntax IN
-- Instead using this
SELECT * FROM person WHERE country_of_birth = 'Indonesia' OR country_of_birth = 'Colombia'
-- U can use this
SELECT * FROM person WHERE country_of_birth IN ('Indonesia','Colombia');

-- Penggunaan BETWEEN
-- Menampilkan nilai dari range segini sampe segini biasanya bentuknya DATE / Integer
SELECT * FROM person WHERE date_of_birth BETWEEN DATE '1991-01-01' AND '1993-01-01'; 

-- Penggunaan LIKE & iLi
-- Menampilkan nilai dengan kesamaan persis
SELECT * FROM person WHERE email LIKE '%@digg.com'
-- Bisa juga untuk menentukan berapa karakter di dalamnya
SELECT * FROM person WHERE email LIKE '______@%'
SELECT * FROM person WHERE country_of_birth LIKE 'P%';
-- ILike tidak ada case sensitif
SELECT * FROM person WHERE country_of_birth ILIKE 'p%';

-- Group By
SELECT country_of_birth FROM person GROUP BY country_of_birth;
-- Bisa menghitung jumlah country ada berapa
-- Dan melakukan sorting
SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth ORDER BY COUNT(*) DESC;

-- ORDER BY HAVING
-- Jadi kita hanya menampilkan data dengan nilai yang ditentukan di Syntax HAVING
SELECT country_of_birth,COUNT(*) FROM person GROUP BY country_of_birth HAVING MAX(COUNT(*));
-- Menampilkan Data yang hasil dari country_of_birthnya lebih dari 5
SELECT country_of_birth,COUNT(*) FROM person GROUP BY country_of_birth HAVING COUNT(*) >5;

-- Fungsi AGE() *Hanya bisa jika tipe datanya DATE
SELECT first_name, last_name, gender, date_of_birth, AGE(NOW(), date_of_birth) AS age FROM person WHERE age >;

-- Penggunaan ALTER
-- Untuk menjadikan suatu kolom primary key
ALTER TABLE person ADD PRIMARY KEY (id); 
-- Cara Mengdrop CONSTRAINT (Seperti PRIMARY KEY NOTNULL ATAU UNIQUE)
ALTER TABLE person DROP CONSTRAINT person_pkey;
-- Menambahkan email menjadi unique
ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE (email);
-- Perbedaanya ini membiarkan dinamakan dari server kita
ALTER TABLE person ADD UNIQUE (email);

-- Penggunaan Check Constraint
-- Jadinya membiarkan dia berbentuk unik dengan syarat yang berada di CHECK tersebut
ALTER TABLE person ADD CONSTRAINT gender_constraint CHECK (gender = 'Male' OR gender = 'Female' );

-- Penggunaan UPDATE
UPDATE person SET email = 'ghanesm@gmail.com' WHERE id = 1;

-- ON CONFLICT
-- Dengan ini walaupun kita memiliki primary key yang nilainya tidak boleh sama dan tidak masuk ke dalam Table kita  
INSERT INTO person (
    id, 
    first_name, 
    last_name, 
    email, gender, 
    job, 
    date_of_birth, 
    country_of_birth
    ) VALUES (
        1, 
        'Vera', 
        'Simoneau', 
        'vsimoneau0@discovery.com', 
        'Female', 
        'Staff Accountant IV', 
        '10/28/1991', 
        'China'
        ) ON CONFLICT (id) DO NOTHING;
-- Outputnya INSERT 0 0

-- Update == UPSERT
-- Digunakan untuk mengubah suatu data di dalam table jika ada pergantiin data
INSERT INTO person (
    id, 
    first_name, 
    last_name, 
    email, gender, 
    job, 
    date_of_birth, 
    country_of_birth
    ) VALUES (
        1, 
        'Vera', 
        'Simoneau', 
        'vsimoneau0@discovery.com', 
        'Female', 
        'Staff Accountant IV', 
        '10/28/1991', 
        'China'
        ) ON CONFLICT (id) DO NOTHING;