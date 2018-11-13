-- create user 'cfbd'@'localhost' identified by '1234';	# password will be changed on production 
-- 
-- grant all privileges on *.* to 'cfbd'@'localhost';
 
create database if not exists missing_person;

use missing_person;

-- sql_mode by default 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,
-- NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'
-- where NO_ZERO_IN_DATE,NO_ZERO_DATE will return a Invalid default value for any timestamp column. 
-- thats why first set sql_mode without NO_ZERO_IN_DATE,NO_ZERO_DATE

SET sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

DROP TABLE IF EXISTS users;

CREATE TABLE users (							# key specification must with a key length
	uuid 				VARCHAR(30) not null,	# thats why text changed to varchar 
	first_name 			text not null,		
	last_name 			text,
	profile_picture 	text,
    primary_address 	text not null,
    secondary_address 	text,
    contact_number 		text not null,
	email 				text not null,
    password 			text not null,
    created_at 			timestamp,
    updated_at 			timestamp,
    deleted_at 			timestamp,
    primary key (uuid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS reports;

CREATE TABLE reports (			
	report_id 		int not null,
	uuid 			VARCHAR(30) not null,
	reported_by 	text not null,
    name 			text not null,
    details 		json not null,
    picture_url 	json,			# null or not null?
    last_location 	text not null,
    missing_since 	timestamp not null,
    contact_number 	text not null,
    found 			boolean not null,
	created_at 		timestamp,
    updated_at 		timestamp,
    deleted_at 		timestamp,
    primary key (report_id),
    constraint report_fk foreign key (uuid) 
    references users (uuid) 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
    
DROP TABLE IF EXISTS address;

CREATE TABLE address (		
	report_id 			int not null,
	uuid 				VARCHAR(30) not null,
	street_address 		text,
    thana 				text,
    district_code 		text,	# is this district code or postal code? if its district code then how it will be counted ?
    latitude 			decimal(9,6) not null,
    longitude 			decimal(9,6) not null,
    victim_location 	boolean not null,
    user_ref 			text not null,
    created_at 			timestamp,
    updated_at 			timestamp,
    deleted_at 			timestamp,
    primary key (report_id, uuid),
	foreign key (report_id) references reports(report_id),
	foreign key(uuid) references users(uuid)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


# test insert into users
insert into users (
		uuid, first_name, last_name, profile_picture, 
        primary_address, secondary_address,
		contact_number, email, password,
		created_at,	updated_at, deleted_at 
    )values (
		1, 'masud', 'rana', 'masud.jpg',
		'azimpur, dhaka', 'khilgoan, taltola',
		'01789030303', 'masud@gmail.com', '123456',
		 CURDATE()-1, CURDATE(), null
    );
    
# dummy insert into reports
insert into reports (
		report_id, uuid, reported_by, name,
		details,
		picture_url, last_location, missing_since, 
        contact_number, found,
		created_at, updated_at, deleted_at
    )values (
		1, 	1, 	'masud', 'mahadi', 
		'{	"age": 10, 
			"height": 5.5, 
            "weight" : 30, 
            "description" : "red shirt, black pant, blond hair"
		}',
		null, 'new market',	CURDATE(),
		'01789030303', false,
		CURDATE()-1,	CURDATE(), null
    );
    
# dummy insert into address
insert into address (
		report_id, uuid, street_address, thana, district_code ,
		latitude ,	longitude,	victim_location, user_ref,
        created_at, updated_at, deleted_at
    )values (
		1, 1, 'nilkhet', 'lalbag', 'dhaka',
		23.810331, 90.412521, true, 'masud',
		CURDATE()-1, CURDATE(), null
    );

