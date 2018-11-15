INSERT INTO users
(uuid, first_name, last_name, profile_picture, primary_address, secondary_address, contact_number, email, password)
VALUES
('user-1', 'hasan', 'sujon', 'https://none.com', 'add-1', 'add-1', '+8801234567890', 'sujon@email.com', 'NoPassword');


INSERT INTO address
(uuid, street_address, thana, district_code, geo_hash, victim_location, user_ref)
VALUES
('add-1', '37 khilgoan', 'azimpur', 'DHK', 'xyzxyzxy', 0, 'user-1');

INSERT INTO reports
(uuid, reported_by, name, details, picture_url, last_location, missing_since, contact_number)
VALUES
('rep-1', 'user-1', 'masud',
  '{    "age": 10,
        "height": 5.5,
        "weight" : 30,
        "description" : "red shirt, black pant, blond hair"
  }', '["image1.jpg"]', 'xyzxyzxy', '2018-11-11 10:30', '+8801234567890');
