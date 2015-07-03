SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS USER_ROLE;
DROP TABLE IF EXISTS ROLE;
DROP TABLE IF EXISTS USER;




/* Create Tables */

CREATE TABLE ROLE
(
	ID_ROLE int NOT NULL,
	NM_ROLE varchar(250) NOT NULL,
	PRIMARY KEY (ID_ROLE)
);


CREATE TABLE USER
(
	ID_USER varchar(50) NOT NULL,
	NM_USER varchar(255) NOT NULL,
	PASSWORD varchar(15) NOT NULL,
	PASSWORD_TYP varchar(4) NOT NULL,
	USER_STATUS varchar(20) NOT NULL,
	CREATED_BY varchar(50) NOT NULL,
	CREATION_DT datetime NOT NULL,
	LAST_LOGIN datetime NOT NULL,
	UPDATED_BY varchar(50) NOT NULL,
	UPDATE_DT datetime NOT NULL,
	PRIMARY KEY (ID_USER)
);


CREATE TABLE USER_ROLE
(
	CREATION_DT datetime,
	UPDATE_DT datetime,
	ID_USER varchar(50) NOT NULL,
	ID_ROLE int NOT NULL,
	CREATED_BY varchar(50) NOT NULL,
	UPDATED_BY varchar(50) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE USER_ROLE
	ADD FOREIGN KEY (ID_ROLE)
	REFERENCES ROLE (ID_ROLE)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USER_ROLE
	ADD FOREIGN KEY (ID_USER)
	REFERENCES USER (ID_USER)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USER_ROLE
	ADD FOREIGN KEY (UPDATED_BY)
	REFERENCES USER (ID_USER)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE USER_ROLE
	ADD FOREIGN KEY (CREATED_BY)
	REFERENCES USER (ID_USER)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



