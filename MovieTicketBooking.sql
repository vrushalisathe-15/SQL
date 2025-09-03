CREATE DATABASE MovieTicketBooking;
USE MovieTicketBooking;
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    duration_minutes INT,
    language VARCHAR(50),
    release_date DATE
);

-- Theaters Table
CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

-- Screens Table
CREATE TABLE Screens (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theater_id INT,
    screen_number INT,
    total_seats INT,
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);

-- Shows Table
CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    screen_id INT,
    show_time DATETIME,
    price DECIMAL(8,2),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT,
    customer_name VARCHAR(100),
    seats_booked INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(8,2),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Movies
INSERT INTO Movies (title, genre, duration_minutes, language, release_date)
VALUES 
('Inception', 'Sci-Fi', 148, 'English', '2010-07-16'),
('Pathaan', 'Action', 146, 'Hindi', '2023-01-25'),
('RRR', 'Action/Drama', 182, 'Telugu', '2022-03-25');

-- Theaters
INSERT INTO Theaters (name, location)
VALUES 
('Connplex cinemas', 'Ahilyanagar'),
('INOX', 'Pune');

-- Screens
INSERT INTO Screens (theater_id, screen_number, total_seats)
VALUES 
(1, 1, 100),
(1, 2, 120),
(2, 1, 150);

-- Shows
INSERT INTO Shows (movie_id, screen_id, show_time, price)
VALUES 
(1, 1, '2025-08-05 18:00:00', 250.00),
(2, 2, '2025-08-05 21:00:00', 300.00),
(3, 3, '2025-08-05 20:00:00', 200.00);

-- 1. View All Shows Today
SELECT s.show_id, m.title, t.name AS theater, s.show_time, s.price
FROM Shows s
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Screens sc ON s.screen_id = sc.screen_id
JOIN Theaters t ON sc.theater_id = t.theater_id
WHERE DATE(s.show_time) = CURDATE();

-- 2. Book Tickets
INSERT INTO Bookings (show_id, customer_name, seats_booked, total_amount)
VALUES (1, 'Vrushali Sathe', 2, 500.00);

-- 3. Add Payment
INSERT INTO Payments (booking_id, payment_method, payment_status)
VALUES (1, 'UPI', 'Success');

-- 4. View All Bookings with Payment Status
SELECT b.booking_id, m.title, b.customer_name, b.seats_booked, b.total_amount, p.payment_status
FROM Bookings b
JOIN Shows s ON b.show_id = s.show_id
JOIN Movies m ON s.movie_id = m.movie_id
JOIN Payments p ON b.booking_id = p.booking_id;