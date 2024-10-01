CREATE TABLE Theatre (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Sample entry
INSERT INTO Theatre (theatre_name, location) 
VALUES ('PVR: Nexus', 'Forum Mall');

CREATE TABLE Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(255) NOT NULL,
    language VARCHAR(50),
    format VARCHAR(10),
    certification VARCHAR(10)
);

-- Sample entries
INSERT INTO Movie (movie_name, language, format, certification) 
VALUES ('Dasara', 'Telugu', '2D', 'UA'),
       ('Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', '2D', 'UA'),
       ('Avatar: The Way of Water', 'English', '3D', 'UA');

CREATE TABLE Show (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    theatre_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    screen_type VARCHAR(50),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id)
);

-- Sample entries
INSERT INTO Show (movie_id, theatre_id, show_date, show_time, screen_type) 
VALUES (1, 1, '2024-04-25', '12:15:00', '4K Dolby'),
       (2, 1, '2024-04-25', '19:10:00', '4K ATMOS'),
       (3, 1, '2024-04-25', '17:20:00', 'Playhouse');

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT NOT NULL,
    user_id INT NOT NULL,
    num_tickets INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (show_id) REFERENCES Show(show_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Sample entry
INSERT INTO Booking (show_id, user_id, num_tickets) 
VALUES (1, 1, 2);

CREATE TABLE User (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255),
    email VARCHAR(255)
);

-- Sample entry
INSERT INTO User (user_name, email) 
VALUES ('John Doe', 'john@example.com');
