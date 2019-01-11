SET AUTOCOMMIT ON;

DROP TABLE Booked;
DROP Table Payment;
DROP TABLE Tickets;
DROP TABLE Trains;
DROP TABLE Stations;

CREATE TABLE Stations(S_id varchar(4) primary key,
					  S_name varchar(30));

CREATE TABLE Trains(Train_no char(5) primary key,
					from_id varchar(4),
					to_id varchar(4),
					num_seats number(4) check (num_seats > 0),
					type1 char(3) check (type1 IN ('PAS', 'EXP', 'STB', 'RJD', 'MAL')),
					runs_on char(7),
					duration number(2),
					fare numeric(6,2) check(fare > 0),
					foreign key (from_id) references Stations(S_id),
					foreign key (to_id) references Stations(S_id));

CREATE TABLE Tickets(Ticket_no varchar(10) primary key,
					 Train_no char(5),
					 passenger_name varchar(50) not null,
					 sex char(1) check (sex in ('M', 'F')),
					 age number(3) check (age > 5),
					 aadhar_no char(12) check (aadhar_no > 99999999999),
					 mobile_no char(10) not null,
					 book_date date,
					 foreign key (Train_no) references Trains(Train_no));

CREATE TABLE Booked(Train_no char(5),
					book_date date,
					seats_left number(4),
					primary key (Train_no, book_date),
					foreign key (Train_no) references Trains(Train_no));

CREATE TABLE Payment(Payment_no varchar(10) primary key,
					 Ticket_no varchar(10),
					 acc_no varchar(20));

INSERT INTO Stations VALUES ('RNC', 'Ranchi');
INSERT INTO Stations VALUES ('DEL', 'Delhi');
INSERT INTO Stations VALUES ('BOM', 'Bombay');
INSERT INTO Stations VALUES ('KOL', 'Kolkata');
INSERT INTO Stations VALUES ('SRI', 'Srinagar');
INSERT INTO Stations VALUES ('UDP', 'Udupi');
INSERT INTO Stations VALUES ('MNG', 'Mangalore');
INSERT INTO Stations VALUES ('BLR', 'Bangalore');
INSERT INTO Stations VALUES ('PUN', 'Pune');
INSERT INTO Stations VALUES ('PAT', 'Patna');
INSERT INTO Stations VALUES ('GUH', 'Guwhati');
INSERT INTO Stations VALUES ('ROU', 'Rourkela');
INSERT INTO Stations VALUES ('PUR', 'Puri');
INSERT INTO Stations VALUES ('KER', 'Kerela');
INSERT INTO Stations VALUES ('JAI', 'Jaipur');
INSERT INTO Stations VALUES ('BHO', 'Bhopal');
INSERT INTO Stations VALUES ('MAN', 'Manipur');
INSERT INTO Stations VALUES ('JAM', 'Jamnagar');
INSERT INTO Stations VALUES ('CHE', 'Chennai');

INSERT INTO Trains VALUES ('18513', 'RNC', 'DEL', 20, 'RJD', '0100100', 33, 2225.00);
INSERT INTO Trains VALUES ('14166', 'DEL', 'BOM', 20, 'EXP', '1001010', 29, 1850.00);
INSERT INTO Trains VALUES ('12984', 'DEL', 'BOM', 20, 'RJD', '0100100', 30, 1950.00);
INSERT INTO Trains VALUES ('13984', 'DEL', 'BOM', 20, 'PAS', '0010001', 28, 1745.00);
INSERT INTO Trains VALUES ('17832', 'PUN', 'BHO', 20, 'MAL', '1010010', 22, 1155.00);
INSERT INTO Trains VALUES ('19872', 'BLR', 'KER', 20, 'EXP', '0100100', 37, 875.00);
INSERT INTO Trains VALUES ('16024', 'JAI', 'PAT', 20, 'PAS', '0010101', 13, 1900.00);
INSERT INTO Trains VALUES ('12324', 'PUR', 'ROU', 20, 'MAL', '1000100', 40, 735.00);
INSERT INTO Trains VALUES ('19876', 'SRI', 'KER', 20, 'PAS', '0010000', 52, 4220.00);
INSERT INTO Trains VALUES ('13278', 'RNC', 'KOL', 20, 'STB', '0101010', 21, 1185.00);
INSERT INTO Trains VALUES ('15335', 'DEL', 'KOL', 20, 'RJD', '0010010', 27, 2500.00);
INSERT INTO Trains VALUES ('14393', 'DEL', 'KOL', 20, 'STB', '1001000', 28, 2775.00);
INSERT INTO Trains VALUES ('15938', 'DEL', 'KOL', 20, 'EXP', '0100010', 28, 2400.00);
INSERT INTO Trains VALUES ('13673', 'KOL', 'BOM', 20, 'STB', '1000100', 29, 2375.00);
INSERT INTO Trains VALUES ('17048', 'CHE', 'DEL', 20, 'EXP', '1001000', 28, 3150.00);
INSERT INTO Trains VALUES ('18976', 'CHE', 'KOL', 20, 'EXP', '0001000', 42, 2225.00);
INSERT INTO Trains VALUES ('12345', 'RNC', 'BLR', 20, 'EXP', '0100100', 34, 1975.00);
INSERT INTO Trains VALUES ('17654', 'UDP', 'BOM', 20, 'PAS', '1010100', 13, 675.00);
INSERT INTO Trains VALUES ('13930', 'MNG', 'UDP', 20, 'MAL', '1111111', 3, 300.00);
INSERT INTO Trains VALUES ('14296', 'BLR', 'DEL', 20, 'RJD', '1001000', 25, 1675.00);
INSERT INTO Trains VALUES ('13020', 'KOL', 'BLR', 20, 'STB', '0100100', 34, 2145.00);
INSERT INTO Trains VALUES ('18743', 'BLR', 'BOM', 20, 'EXP', '1010100', 12, 1365.00);
INSERT INTO Trains VALUES ('19732', 'PAT', 'BLR', 20, 'PAS', '0010010', 32, 2465.00);
INSERT INTO Trains VALUES ('19898', 'DEL', 'GUH', 20, 'RJD', '0001000', 27, 2425.00);
INSERT INTO Trains VALUES ('13567', 'BOM', 'BHO', 20, 'EXP', '1000100', 19, 1965.00);
INSERT INTO Trains VALUES ('19712', 'SRI', 'DEL', 20, 'EXP', '0010000', 39, 3395.00);
INSERT INTO Trains VALUES ('17564', 'MAN', 'DEL', 20, 'RJD', '0100100', 37, 2995.00);
INSERT INTO Trains VALUES ('19345', 'JAM', 'DEL', 20, 'EXP', '0010010', 15, 1455.00);
INSERT INTO Trains VALUES ('19855', 'MNG', 'DEL', 20, 'EXP', '1000100', 26, 2335.00);

INSERT INTO Tickets VALUES ('1234567890', '18513', 'Krishna Birla', 'M', 21, '653409860706', '8674916754', '05-APR-18');
INSERT INTO Tickets VALUES ('1234567891', '19855', 'Shilpi Birla', 'F', 24, '653409860707', '9835720835', '07-APR-18');
INSERT INTO Tickets VALUES ('1234567892', '18743', 'Raghav Birla', 'M', 17, '653409860708', '8252484331', '09-APR-18');

INSERT INTO Booked VALUES ('18513', '05-APR-18', 19);
INSERT INTO Booked VALUES ('19855', '07-APR-18', 19);
INSERT INTO Booked VALUES ('18743', '09-APR-18', 19);

INSERT INTO Payment VALUES ('1234567890', '1234567890', '017500345273');
INSERT INTO Payment VALUES ('1234567891', '1234567891', '524237738992');
INSERT INTO Payment VALUES ('1234567892', '1234567892', '010029876256');

-- CREATE OR REPLACE TRIGGER TicketBooking1
-- BEFORE INSERT ON Tickets
-- FOR EACH ROW
-- DECLARE
-- 	s_left Booked.seats_left%TYPE;
-- 	t_seat Trains.num_seats%TYPE;
-- 	rowCount number(10);
-- BEGIN
-- 	SELECT num_seats INTO t_seat FROM Trains WHERE Train_no = :NEW.Train_no;
-- 	SELECT seats_left, count(Train_no) INTO s_left, rowCount FROM Booked WHERE Train_no = :NEW.Train_no AND book_date = :NEW.book_date;
-- 	IF (rowCount > 0) THEN
-- 		IF (s_left > 1) THEN
-- 			s_left := s_left - 1;
-- 			UPDATE Booked SET seats_left = s_left WHERE Train_no = :NEW.Train_no AND book_date = :NEW.book_date;
-- 		END IF;
-- 	ELSE
-- 		s_left := t_seat - 1;
-- 		INSERT INTO Booked VALUES (:NEW.Train_no, :NEW.book_date, s_left);
-- 	END IF;
-- END;
-- /

-- CREATE OR REPLACE TRIGGER TicketBooking2
-- BEFORE DELETE ON Tickets
-- FOR EACH ROW
-- DECLARE
-- 	s_left Booked.seats_left%TYPE;
-- BEGIN
-- 	SELECT seats_left INTO s_left FROM Booked WHERE Train_no = :NEW.Train_no AND book_date = :NEW.book_date;
-- 	s_left := s_left + 1;
-- 	UPDATE Booked SET seats_left = s_left WHERE Train_no = :NEW.Train_no AND book_date = :NEW.book_date;
-- END;
-- /