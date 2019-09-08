/*
 Create Schema.
*/

CREATE SCHEMA IF NOT EXISTS movierating;

/*
 Create Table.
*/

CREATE TABLE movierating.movierating 
(
  movie varchar(100) NOT NULL,
  person1 int NULL,
  person2 int NULL,
  person3 int NULL,
  person4 int NULL,
  person5 int NULL
);

/*
- I provovid two ways to insert values into the table as shown in below.  
- One way is to use the INSERT INTO function. 
- Another way is to import the CSV file.
- In order to make the code more reproducible, I choose to INSERT INTO function method.
- I'll also upload the CSV file to Github and provided the link in the submission in case you'll need it verify the Load Data Infile codes below.
*/

/*
 Insert values into the table created in above step.
*/

INSERT INTO movierating.movierating (movie, person1, person2, person3, person4, person5)
VALUES ('Angel HAS FALLEN',4,1,4,3,2),
	   ('Good Boys',3,3,2,1,2),
	   ('The Lion King',2,4,3,NULL,5),
       ('47 Meters Down',NULL,3,2,3,3),
       ('Brittany Runs A Marathon',3,1,1,5,5),
       ('Bennett''s War',5,1,NULL,3,1);

/*
 -- Import Movie Rating CSV file into table created in above Step.

SELECT * FROM movierating;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/MovieRating.csv' 
INTO TABLE movierating
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'

(movie, @person1, @person2, @person3, @person4, @person5)
SET
person1 = IF(CHAR_LENGTH(TRIM(@person1)) = 0, NULL, @person1),
person2 = IF(CHAR_LENGTH(TRIM(@person2)) = 0, NULL, @person2),
person3 = IF(CHAR_LENGTH(TRIM(@person3)) = 0, NULL, @person3),
person4 = IF(CHAR_LENGTH(TRIM(@person4)) = 0, NULL, @person4),
person5 = IF(CHAR_LENGTH(TRIM(@person5)) = 0, NULL, @person5)
;
*/

/*
 Verify if data being stored correctly.
*/
SELECT * FROM movierating.movierating

/*
 When installing the MySQL, by default it configures the Authentication Method using the Use Strong Password Encryption for Authentication option.
 In order for my RStudio to connect to MySQL, I will need to switch to use the USe Legacy Authentication Method option.
 To do that, I need to run below script to change the Authentication Method to Legacy.
*/

-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '******';