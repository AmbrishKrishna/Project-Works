/*MokeCruiseBooking*/
/*CREATE DATABASE MokeCruiseBooking
Use MokeCruiseBooking*/

---Create Tables---
/*
CREATE TABLE mcb.Passenger
(
	PgrID		smallint		not null									Primary Key,
	PgrName		varchar(50)		not null	,
	PgrEmail	varchar(100)	null	,
	PgrDOB		datetime		not null	,
	PgrGender	char(1)			check(PgrGender in ('M', 'F')) null	,
	CabinNo		char(3)			not null
)

CREATE TABLE mcb.PgrContactNo
(
	PgrID			smallint		not null	,
	PgrContactNo	Char(8)			null	,
	CONSTRAINT PK_PgrContactNo PRIMARY KEY NONCLUSTERED (PgrID),
	CONSTRAINT FK_PgrContactNo_PgrID	FOREIGN KEY(PgrID) REFERENCES
	mcb.Passenger(PgrID)
)

CREATE TABLE mcb.Booking
(
	BookingID	int		not null	,
	NoOfAdultTicket		Tinyint		null	,
	NoOfChildTicket		Tinyint		null	,
	AdultSalesPrice		smallmoney	null	,
	ChildSalesPrice		smallmoney	null	,
	BookStatus	char(30)	not null	,
	BookDateTime	datetime	not null	,
	PgrID	smallint	not null	,
	SessionNo	smallint	not null	,
	EventID	smallint	not null	,
	CONSTRAINT PK_Booking PRIMARY KEY (BookingID),
	CONSTRAINT	FK_Booking	FOREIGN KEY(SessionNo,EventID) REFERENCES
	mcb.EventSession(SessionNo,EventID),
	CONSTRAINT	FK_Booking_PgrID	FOREIGN KEY(PgrID) REFERENCES
	mcb.Passenger(PgrID)
	
)

CREATE TABLE mcb.EventSession
(
	SessionNo	smallint	not null	,
	EventDateTime	datetime	not null	,
	EventID		smallint	not null	,
	CONSTRAINT PK_EventSession PRIMARY KEY NONCLUSTERED (SessionNo,EventID),
	CONSTRAINT FK_EventSession_EventID	FOREIGN KEY(EventID) REFERENCES
	mcb.Event(EventID)
)

CREATE TABLE mcb.Event
(
	EventID		smallint	not null	Primary Key,
	EventDescr	varchar(300)	not null	,
	EventName	varchar(30)		not null	,
	ChildPrice	smallmoney	not null	,
	AdultPrice	smallmoney	not null	,
	EventDuration	char(15)	null	,
	EventCapacity	tinyint		not null	,
	MaxAge	tinyint		null	,
	MinAge	tinyint		null	,
	EventLoc	varchar(40)		not null	,
	ETID	tinyint		not null	,
	CONSTRAINT	FK_Event_ETID	FOREIGN KEY(ETID) REFERENCES
	mcb.EventType(ETID)
)

CREATE TABLE mcb.EventType
(
	ETID	tinyint		not null	Primary Key,
	ETName	varchar(30)		not null
)

CREATE TABLE mcb.Reservation
(
	ReservID	smallint	not null	Primary Key,
	ReservStatus	varchar(30)		not null	,
	RequiredDateTime	datetime	not null	,
	ReservDateTime	datetime	not null	,
	NoOfPax		tinyint		not null	,
	PgrID	smallint	not null	,
	EatyID	tinyint		not null	,
	CONSTRAINT	FK_Reservation_PgrID	FOREIGN KEY(PgrID) REFERENCES
	mcb.Passenger(PgrID),
	CONSTRAINT	FK_Reservation_EatyID	FOREIGN KEY(EatyID) REFERENCES
	mcb.Eatery(EatyID)
)

CREATE TABLE mcb.Eatery
(
	EatyID	tinyint	not null	Primary Key,
	EatyName	Varchar(30)	not null	,
	EatyLoc		varchar(10)	not null	,
	EatyCapacity	tinyint	not null	,
	EatyOpHr	time	not null	,
	EatyClHr	time	not null
)

CREATE TABLE mcb.CSOrder
(
	PgrID	smallint	not null	,
	DishID	smallint	not null	,
	OrderDateTime	datetime	not null	,
	OrderPrice	smallmoney	not null	,
	OrderQty	tinyint	not null	,
	DeliverTo	char(3)	not null	,
	DelDateTime		datetime	not null	,
	CONSTRAINT PK_CSOrder PRIMARY KEY NONCLUSTERED (PgrID, DishID),
	CONSTRAINT	FK_CSOrder_PgrID	FOREIGN KEY(PgrID) REFERENCES
	mcb.Passenger(PgrID),
	CONSTRAINT	FK_CSOrder_DishID		FOREIGN KEY(DishID) REFERENCES
	mcb.Dish(DishID)
)

CREATE TABLE mcb.CSDish
(
	DishID	smallint	not null	Primary Key,
	Price	smallmoney	not null	,
	CONSTRAINT	FK_CSDish_DishID	FOREIGN KEY(DishID) REFERENCES
	mcb.Dish(DishID)
)

CREATE TABLE mcb.Dish
(
	DishID	smallint	not null	Primary Key,
	DishName	varchar(50)	not null	,
	DishDesc	varchar(400)	not null	,
	CuisineID	smallint	not null	,
	EatyID	tinyint	not null	,
	CONSTRAINT	FK_Dish_CuisineID	FOREIGN KEY(CuisineID) REFERENCES
	mcb.Cuisine(CuisineID),
	CONSTRAINT	FK_Dish_EatyID	FOREIGN KEY(EatyID) REFERENCES
	mcb.Eatery(EatyID)
)

CREATE TABLE mcb.Contain
(
	DishID	smallint	not null	,
	IngredID	smallint	not null	,
	CONSTRAINT PK_Contain PRIMARY KEY NONCLUSTERED (DishID, IngredID),
	CONSTRAINT	FK_Contain_DishID	FOREIGN KEY(DishID) REFERENCES
	mcb.Dish(DishID),
	CONSTRAINT	FK_Contain_IngredID	FOREIGN KEY(IngredID) REFERENCES
	mcb.Ingredient(IngredID)
)

CREATE TABLE mcb.Ingredient
(
	IngredID	smallint	not null	Primary Key,
	IngredName	varchar(50)	not null
)

CREATE TABLE mcb.Cuisine
(
	CuisineID	smallint	not null	Primary Key,
	CuisineName	varchar(60)	not null
)

CREATE TABLE mcb.CategorisedIn
(
	DishID	smallint	not null	,
	FcID	smallint	not null	,
	CONSTRAINT PK_CategorisedIn PRIMARY KEY NONCLUSTERED (DishID, FcID),
	CONSTRAINT	FK_CategorisedIn_DishID		FOREIGN KEY(DishID) REFERENCES
	mcb.Dish(DishID),
	CONSTRAINT	FK_CategorisedIn_FcID	FOREIGN KEY(FcID) REFERENCES
	mcb.FoodCategory(FcID)
)

CREATE TABLE mcb.FoodCategory
(
	FcID	smallint	not null	Primary Key,
	FcName	varchar(40)	not null	,
	FcDescr	varchar(200)	not null
)
*/



---INSERT TUPLES---

--Passenger--
insert into mcb.Passenger values (1001, 'Alan Goh', 'alan_goh789@gmail.com', '1987-12-01', 'M', 'A12');
insert into mcb.Passenger values (1002, 'Bernard Goh', NULL, '2016-03-05', 'M', 'A12');
insert into mcb.Passenger values (1003, 'Danielle Goh', 'dan_gh87@yahoo.com', '1987-03-09', 'F', 'A12');
insert into mcb.Passenger values (1004, 'Evelyn Goh', NULL, '2011-05-26', 'F', 'A12');
insert into mcb.Passenger values (1005, 'Pamela Goh', NULL, '2013-11-30', 'F', 'A12');
insert into mcb.Passenger values (1006, 'Celest Tan', 'Celest_tan06@outlook.com', '1989-10-27', 'F', 'B20');
insert into mcb.Passenger values (1007, 'Andrew Tan', 'Andrew_tan@outlook.com', '1987-12-31', 'M', 'B20');
insert into mcb.Passenger values (1008, 'Brian Tan', NULL, '2015-06-25', 'M', 'B20');
insert into mcb.Passenger values (1009, 'Richelle Tan', NULL, '2012-03-21', 'F', 'B20');
insert into mcb.Passenger values (1010, 'Raj Kumar', 'raj_kum307@gmail.com', '1984-07-03', 'M', 'C19');
insert into mcb.Passenger values (1011, 'Dinesh Kumar', NULL, '2012-07-06', 'M', 'C19');
insert into mcb.Passenger values (1012, 'Priya Kumar', 'priya_kum571@gmail.com', '1985-04-05', 'F', 'C19');
insert into mcb.Passenger values (1013, 'Ryan Lee', 'Ryan_lee56@gmail.com', '1992-06-05', 'M', 'B05');
insert into mcb.Passenger values (1014, 'Christine Lee', 'Christine673@gmail.com', '1993-07-06', 'F', 'B05');
insert into mcb.Passenger values (1015, 'Mohammad Shafiq', 'Shafiq43@gmail.com', '1979-03-04', 'M', 'D15');
insert into mcb.Passenger values (1016, 'Aliah Nur', 'Aliahh56@gmail.com', '1979-05-06', 'F', 'D15');
insert into mcb.Passenger values (1017, 'Ray Ng', 'Ray_ng99@gmail.com', '1999-02-09', 'M', 'A04');
insert into mcb.Passenger values (1018, 'Melissa Ng', 'Melissa_99@gmail.com', '1999-09-17', 'F', 'A04');
insert into mcb.Passenger values (1019, 'Chris Halpert', 'Chrishalpert94@gmail.com', '1994-08-23', 'M', 'E19');
insert into mcb.Passenger values (1020, 'Deborah Halpert', 'Deborah95@gmail.com', '1995-06-06', 'F', 'E19');

--PgrContactNo--
insert into mcb.PgrContactNo values (1001, '98612981')
insert into mcb.PgrContactNo values (1002, NULL)
insert into mcb.PgrContactNo values (1003, '88922193')
insert into mcb.PgrContactNo values (1004, NULL)
insert into mcb.PgrContactNo values (1005, NULL)
insert into mcb.PgrContactNo values (1006, '92716789')
insert into mcb.PgrContactNo values (1007, '97744131')
insert into mcb.PgrContactNo values (1008, NULL)
insert into mcb.PgrContactNo values (1009, NULL)
insert into mcb.PgrContactNo values (1010, '85928573')
insert into mcb.PgrContactNo values (1011, NULL)
insert into mcb.PgrContactNo values (1012, '92933601')
insert into mcb.PgrContactNo values (1013, '91009235')
insert into mcb.PgrContactNo values (1014, '83390338')
insert into mcb.PgrContactNo values (1015, '85467675')
insert into mcb.PgrContactNo values (1016, '93452530')
insert into mcb.PgrContactNo values (1017, '84868910')
insert into mcb.PgrContactNo values (1018, '87787271')
insert into mcb.PgrContactNo values (1019, '95700097')
insert into mcb.PgrContactNo values (1020, '88624533')

--Bookings--
insert into mcb.Booking values (51600, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 09:00:25', 1001, 3, 1)
insert into mcb.Booking values (51601, NULL, 1, NULL, 7, 'Confirmed', '2022-02-02 09:00:25', 1002, 3, 1)
insert into mcb.Booking values (51602, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 09:00:25', 1003, 3, 1)
insert into mcb.Booking values (51603, NULL, 1, NULL, 7, 'Confirmed', '2022-02-02 09:00:25', 1004, 3, 1)
insert into mcb.Booking values (51604, NULL, 1, NULL, 7, 'Confirmed', '2022-02-02 09:00:25', 1005, 3, 1)
insert into mcb.Booking values (52500, 1, NULL, 10, NULL, 'Waitlist', '2022-02-02 10:15:32', 1006, 4, 5)
insert into mcb.Booking values (52501, 1, NULL, 10, NULL, 'Waitlist', '2022-02-02 10:15:32', 1007, 4, 5)
insert into mcb.Booking values (52502, NULL, 1, NULL, 7, 'Waitlist', '2022-02-02 10:15:32', 1008, 4, 5)
insert into mcb.Booking values (52503, NULL, 1, NULL, 7, 'Waitlist', '2022-02-02 10:15:32', 1009, 4, 5)
insert into mcb.Booking values (52801, 1, NULL, 10, NULL, 'Book', '2022-02-02 10:30:18', 1010, 3, 4)
insert into mcb.Booking values (52802, NULL, 1, NULL, 7, 'Book', '2022-02-02 10:30:18', 1011, 3, 4)
insert into mcb.Booking values (52803, 1, NULL, 10, NULL, 'Book', '2022-02-02 10:30:18', 1012, 3, 4)
insert into mcb.Booking values (52000, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 09:30:41', 1013, 3, 2)
insert into mcb.Booking values (52001, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 09:30:41', 1014, 3, 2)
insert into mcb.Booking values (51506, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 08:45:16', 1015, 3, 6)
insert into mcb.Booking values (51507, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 08:45:16', 1016, 3, 6)
insert into mcb.Booking values (52301, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 09:45:32', 1017, 2, 7)
insert into mcb.Booking values (52302, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 09:45:32', 1018, 2, 7)
insert into mcb.Booking values (51023, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 08:00:32', 1019, 1, 9)
insert into mcb.Booking values (51024, 1, NULL, 10, NULL, 'Confirmed', '2022-02-02 08:00:32', 1020, 1, 9)

insert into mcb.Booking values (63100, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 07:45:05', 1001, 10, 2)
insert into mcb.Booking values (63101, NULL, 1, NULL, 7, 'Confirmed', '2022-02-03 07:45:05', 1002, 10, 2)
insert into mcb.Booking values (63102, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 07:45:05', 1003, 10, 2)
insert into mcb.Booking values (63103, NULL, 1, NULL, 7, 'Confirmed', '2022-02-03 07:45:05', 1004, 10, 2)
insert into mcb.Booking values (63104, NULL, 1, NULL, 7, 'Confirmed', '2022-02-03 07:45:05', 1005, 10, 2)
insert into mcb.Booking values (63451, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 08:30:12', 1006, 40, 3)
insert into mcb.Booking values (63452, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 08:30:12', 1007, 40, 3)
insert into mcb.Booking values (63453, NULL, 1, NULL, 7, 'Confirmed', '2022-02-03 08:30:12', 1008, 40, 3)
insert into mcb.Booking values (63454, NULL, 1, NULL, 7, 'Confirmed', '2022-02-03 08:30:12', 1009, 40, 3)
insert into mcb.Booking values (63264, 1, NULL, 10, NULL, 'Waitlist', '2022-02-03 08:15:46', 1010, 40, 8)
insert into mcb.Booking values (63265, NULL, 1, NULL, 7, 'Waitlist', '2022-02-03 08:15:46', 1011, 40, 8)
insert into mcb.Booking values (63266, 1, NULL, 10, NULL, 'Waitlist', '2022-02-03 08:15:46', 1012, 40, 8)
insert into mcb.Booking values (64005, 1, NULL, 10, NULL, 'Waitlist', '2022-02-03 08:41:54', 1013, 50, 5)
insert into mcb.Booking values (64006, 1, NULL, 10, NULL, 'Waitlist', '2022-02-03 08:41:54', 1014, 50, 5)
insert into mcb.Booking values (64218, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 09:15:08', 1015, 30, 7)
insert into mcb.Booking values (64219, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 09:15:08', 1016, 30, 7)
insert into mcb.Booking values (63875, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 08:38:15', 1017, 40, 2)
insert into mcb.Booking values (63876, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 08:38:15', 1018, 40, 2)
insert into mcb.Booking values (64514, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 09:45:39', 1019, 30, 8)
insert into mcb.Booking values (64515, 1, NULL, 10, NULL, 'Confirmed', '2022-02-03 09:45:39', 1020, 30, 8)

insert into mcb.Booking values (75123, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 08:06:17', 1001, 100, 4)
insert into mcb.Booking values (75124, NULL, 1, NULL, 7, 'Confirmed', '2022-02-04 08:06:17', 1002, 100, 4)
insert into mcb.Booking values (75125, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 08:06:17', 1003, 100, 4)
insert into mcb.Booking values (75126, NULL, 1, NULL, 7, 'Confirmed', '2022-02-04 08:06:17', 1004, 100, 4)
insert into mcb.Booking values (75127, NULL, 1, NULL, 7, 'Confirmed', '2022-02-04 08:06:17', 1005, 100, 4)
insert into mcb.Booking values (75010, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 07:30:21', 1006, 100, 10)
insert into mcb.Booking values (75011, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 07:30:21', 1007, 100, 10)
insert into mcb.Booking values (75012, NULL, 1, NULL, 7, 'Confirmed', '2022-02-04 07:30:21', 1008, 100, 10)
insert into mcb.Booking values (75013, NULL, 1, NULL, 7, 'Confirmed', '2022-02-04 07:30:21', 1009, 100, 10)
insert into mcb.Booking values (75985, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 08:39:54', 1010, 100, 2)
insert into mcb.Booking values (75986, NULL, 1, NULL, 7, 'Confirmed', '2022-02-04 08:39:54', 1011, 100, 2)
insert into mcb.Booking values (75987, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 08:39:54', 1012, 100, 2)
insert into mcb.Booking values (75096, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 07:50:44', 1013, 200, 6)
insert into mcb.Booking values (75097, 1, NULL, 10, NULL, 'Confirmed', '2022-02-04 07:50:44', 1014, 200, 6)
insert into mcb.Booking values (77134, 1, NULL, 10, NULL, 'Waitlist', '2022-02-04 09:51:31', 1015, 200, 9)
insert into mcb.Booking values (77135, 1, NULL, 10, NULL, 'Waitlist', '2022-02-04 09:51:31', 1016, 200, 9)
insert into mcb.Booking values (77986, 1, NULL, 10, NULL, 'Book', '2022-02-04 10:14:45', 1017, 100, 3)
insert into mcb.Booking values (77987, 1, NULL, 10, NULL, 'Book', '2022-02-04 10:14:45', 1018, 100, 3)
insert into mcb.Booking values (76453, 1, NULL, 10, NULL, 'Waitlist', '2022-02-04 09:02:19', 1019, 200, 4)
insert into mcb.Booking values (76454, 1, NULL, 10, NULL, 'Waitlist', '2022-02-04 09:02:19', 1020, 200, 4)

--EventSession
insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 1)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 1)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 1)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 1)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 1)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 2)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 2)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 2)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 2)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 2)
insert into mcb.EventSession values (6, '2022-02-02 19:00:00', 2)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 3)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 3)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 3)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 3)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 3)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 4)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 4)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 4)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 4)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 4)
insert into mcb.EventSession values (6, '2022-02-02 19:00:00', 4)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 5)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 5)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 5)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 5)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 5)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 6)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 6)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 6)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 6)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 6)
insert into mcb.EventSession values (6, '2022-02-02 19:00:00', 6)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 7)
insert into mcb.EventSession values (2, '2022-02-02 13:00:00', 7)
insert into mcb.EventSession values (3, '2022-02-02 17:00:00', 7)
insert into mcb.EventSession values (4, '2022-02-02 21:00:00', 7)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 8)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 8)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 8)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 8)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 8)
insert into mcb.EventSession values (6, '2022-02-02 19:00:00', 8)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 9)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 9)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 9)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 9)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 9)
insert into mcb.EventSession values (6, '2022-02-02 19:00:00', 9)

insert into mcb.EventSession values (1, '2022-02-02 09:00:00', 10)
insert into mcb.EventSession values (2, '2022-02-02 11:00:00', 10)
insert into mcb.EventSession values (3, '2022-02-02 13:00:00', 10)
insert into mcb.EventSession values (4, '2022-02-02 15:00:00', 10)
insert into mcb.EventSession values (5, '2022-02-02 17:00:00', 10)
insert into mcb.EventSession values (6, '2022-02-02 19:00:00', 10)
insert into mcb.EventSession values (7, '2022-02-02 21:00:00', 10)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 1)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 1)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 1)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 1)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 1)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 2)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 2)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 2)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 2)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 2)
insert into mcb.EventSession values (60, '2022-02-03 19:00:00', 2)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 3)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 3)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 3)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 3)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 3)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 4)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 4)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 4)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 4)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 4)
insert into mcb.EventSession values (60, '2022-02-03 19:00:00', 4)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 5)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 5)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 5)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 5)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 5)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 6)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 6)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 6)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 6)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 6)
insert into mcb.EventSession values (60, '2022-02-03 19:00:00', 6)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 7)
insert into mcb.EventSession values (20, '2022-02-03 13:00:00', 7)
insert into mcb.EventSession values (30, '2022-02-03 17:00:00', 7)
insert into mcb.EventSession values (40, '2022-02-03 21:00:00', 7)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 8)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 8)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 8)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 8)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 8)
insert into mcb.EventSession values (60, '2022-02-03 19:00:00', 8)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 9)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 9)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 9)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 9)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 9)
insert into mcb.EventSession values (60, '2022-02-03 19:00:00', 9)

insert into mcb.EventSession values (10, '2022-02-03 09:00:00', 10)
insert into mcb.EventSession values (20, '2022-02-03 11:00:00', 10)
insert into mcb.EventSession values (30, '2022-02-03 13:00:00', 10)
insert into mcb.EventSession values (40, '2022-02-03 15:00:00', 10)
insert into mcb.EventSession values (50, '2022-02-03 17:00:00', 10)
insert into mcb.EventSession values (60, '2022-02-03 19:00:00', 10)
insert into mcb.EventSession values (70, '2022-02-03 21:00:00', 10)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 1)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 1)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 2)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 2)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 3)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 3)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 4)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 4)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 5)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 5)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 6)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 6)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 7)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 8)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 8)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 9)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 9)

insert into mcb.EventSession values (100, '2022-02-04 09:00:00', 10)
insert into mcb.EventSession values (200, '2022-02-04 11:00:00', 10)


---Event---
insert into mcb.Event values (1, 'Enjoy the various unique water slides available onboard the cruise', 'WetnWild', 10, 15, '2 Hours', 50, 60, 6, 'Swimming Pool', 1)
insert into mcb.Event values (2, 'Play tennis with other people or learn how to play from our coaches', 'Deuce', 7, 10, '2 Hours', 30, 60, 6, 'Tennis Court', 2)
insert into mcb.Event values (3, 'Learn how to use a bow and arrow from our coaches', 'Target', 7, 10, '2 Hours', 50, 60, 6, 'Archery Range', 3)
insert into mcb.Event values (4, 'Have an enjoyable time at the Bowling Alley', 'Strike!', 7, 10, '2 Hours', 40, 60, 6, 'Bowling Alley', 4)
insert into mcb.Event values (5, 'Get ready to Splash!', 'Splash!', 7, 10, '2 Hours', 40, 60, 6, 'Swimming Pool', 5)
insert into mcb.Event values (6, 'Learn how to make Origami and other forms of art', 'ArtsnCraft', 7, 10, '2 Hours', 40, 60, 6, 'Art Rooms', 6)
insert into mcb.Event values (7, 'Enjoy the wonderful musical showcasing many amazing talents', 'Eye of the Tiger', 10, 15, '2 Hours', 250, 60, 6, 'Hall 1', 7)
insert into mcb.Event values (8, 'Skate away on the ice rink!', 'WinterSkate', 7, 10, '2 Hours', 70, 60, 6, 'Hall 2', 8)
insert into mcb.Event values (9, 'Get ready to shake a leg by following tutorial', 'ShakeALeg', 7, 10, '2 Hours', 40, 60, 6, 'Dance Studio', 9)
insert into mcb.Event values (10, 'Relax by watching a film', 'La Cinephile', 7, 10, '2 Hours', 50, 60, 6, 'Cinema', 10)

---EventType---
insert into mcb.EventType values (1, 'WaterPark')
insert into mcb.EventType values (2, 'Tennis')
insert into mcb.EventType values (3, 'Archery')
insert into mcb.EventType values (4, 'Bowling')
insert into mcb.EventType values (5, 'Swimming')
insert into mcb.EventType values (6, 'Art')
insert into mcb.EventType values (7, 'Musical')
insert into mcb.EventType values (8, 'Ice-Skating')
insert into mcb.EventType values (9, 'Dancing')
insert into mcb.EventType values (10, 'Movie')

---Reservation---
insert into mcb.Reservation values (1053,'Confirmed','2022-02-02 15:30:00','2022-02-02 10:00:52',5,1001,1)
insert into mcb.Reservation values (1204,'Confirmed','2022-02-02 17:30:00','2022-02-02 11:30:42',4,1006,3)
insert into mcb.Reservation values (1086,'Confirmed','2022-02-02 18:00:00','2022-02-02 10:15:13',3,1010,5)
insert into mcb.Reservation values (963,'Confirmed','2022-02-02 20:00:00','2022-02-02 09:00:06',2,1014,9)
insert into mcb.Reservation values (1146,'Waitlist','2022-02-02 19:00:00','2022-02-02 11:00:34',2,1016,2)
insert into mcb.Reservation values (964,'Waitlist','2022-02-02 14:00:00','2022-02-02 09:00:27',2,1017,4)
insert into mcb.Reservation values (1095,'Confirmed','2022-02-02 19:30:00','2022-02-02 10:30:03',2,1020,6)

insert into mcb.Reservation values (2003,'Waitlist','2022-02-03 12:30:00','2022-02-03 08:00:12',5,1001,7)
insert into mcb.Reservation values (2845,'Waitlist','2022-02-03 19:15:00','2022-02-03 14:00:31',4,1006,8)
insert into mcb.Reservation values (2096,'Confirmed','2022-02-03 13:15:00','2022-02-03 09:00:08',3,1010,10)
insert into mcb.Reservation values (2186,'Confirmed','2022-02-03 18:45:00','2022-02-03 10:15:24',2,1013,1)
insert into mcb.Reservation values (2312,'Book','2022-02-03 14:20:00','2022-02-03 11:30:37',2,1016,3)
insert into mcb.Reservation values (2795,'Confirmed','2022-02-03 20:15:00','2022-02-03 13:34:49',2,1018,9)
insert into mcb.Reservation values (2963,'Waitlist','2022-02-03 19:30:00','2022-02-03 15:45:51',2,1020,5)

insert into mcb.Reservation values (3312,'Confirmed','2022-02-04 11:15:00','2022-02-04 08:10:34',5,1001,4)
insert into mcb.Reservation values (3297,'Confirmed','2022-02-04 11:30:00','2022-02-04 07:45:15',3,1010,6)
insert into mcb.Reservation values (3389,'Confirmed','2022-02-04 13:15:00','2022-02-04 08:45:52',2,1016,8)
insert into mcb.Reservation values (3498,'Confirmed','2022-02-04 13:10:00','2022-02-04 09:30:39',2,1020,7)

---Eatery---
insert into mcb.Eatery values (1, 'Maxwells', '#01-34', 30, '09:00:00', '21:45:00')
insert into mcb.Eatery values (2, 'The Taj', '#01-56', 40, '09:00:00', '21:45:00')
insert into mcb.Eatery values (3, 'Cheng Cheng', '#02-39', 30, '09:00:00', '21:45:00')
insert into mcb.Eatery values (4, 'Righteous Sushi', '#01-26', 30, '09:00:00', '21:45:00')
insert into mcb.Eatery values (5, 'Jangsu Korean House', '#02-67', 40, '09:00:00', '21:45:00')
insert into mcb.Eatery values (6, 'Di Matteo', '#02-58', 30, '09:00:00', '21:45:00')
insert into mcb.Eatery values (7, 'FatBurger', '#03-49', 50, '09:00:00', '22:30:00')
insert into mcb.Eatery values (8, 'Phat Phat Thai', '#01-78', 40, '09:00:00', '21:45:00')
insert into mcb.Eatery values (9, 'La Pioche', '#02-45', 30, '09:00:00', '21:30:00')
insert into mcb.Eatery values (10, 'Chicharito', '#03-36', 40, '09:00:00', '21:45:00')


---CSOrder---
insert into mcb.CSOrder values (1001, 3, '2022-02-02 19:40:04', 11, 5,'A12', '2022-02-02 20:10:15')
insert into mcb.CSOrder values (1006, 7, '2022-02-02 08:30:15', 12, 4,'B20', '2022-02-02 09:10:21')
insert into mcb.CSOrder values (1010, 34, '2022-02-02 08:15:21', 14, 3,'C19', '2022-02-02 09:00:16')
insert into mcb.CSOrder values (1014, 25, '2022-02-02 11:20:29', 11, 2,'B05', '2022-02-02 12:00:34')
insert into mcb.CSOrder values (1016, 21, '2022-02-02 10:50:37', 15, 2,'D15', '2022-02-02 11:30:46')
insert into mcb.CSOrder values (1017, 37, '2022-02-02 09:20:48', 12, 2,'A04', '2022-02-02 10:00:07')
insert into mcb.CSOrder values (1020, 26, '2022-02-02 11:10:54', 04, 2,'E19', '2022-02-02 12:00:53')

insert into mcb.CSOrder values (1001, 15, '2022-02-03 18:00:40', 8, 5,'A12', '2022-02-03 18:40:12')
insert into mcb.CSOrder values (1006, 18, '2022-02-03 12:00:21', 10, 4,'B20', '2022-02-03 12:35:25')
insert into mcb.CSOrder values (1010, 9, '2022-02-03 08:00:08', 8, 3,'C19', '2022-02-03 08:45:02')
insert into mcb.CSOrder values (1013, 2, '2022-02-03 10:35:16', 10, 2,'B05', '2022-02-03 11:25:34')
insert into mcb.CSOrder values (1016, 5, '2022-02-03 18:30:23', 8, 2,'D15', '2022-02-03 19:20:39')
insert into mcb.CSOrder values (1018, 29, '2022-02-03 08:35:45', 11, 2,'A04', '2022-02-03 09:15:43')
insert into mcb.CSOrder values (1020, 31, '2022-02-03 11:45:56', 7, 2,'E19', '2022-02-03 12:20:57')

insert into mcb.CSOrder values (1001, 38, '2022-02-04 07:10:16', 11, 5,'A12', '2022-02-04 07:45:35')
insert into mcb.CSOrder values (1010, 22, '2022-02-04 07:45:34', 15, 3,'C19', '2022-02-04 08:10:17')
insert into mcb.CSOrder values (1016, 20, '2022-02-04 08:45:52', 10, 2,'D15', '2022-02-04 09:15:49')
insert into mcb.CSOrder values (1020, 10, '2022-02-04 09:30:01', 10, 2,'E19', '2022-02-04 10:10:23')

---CSDish---
insert into mcb.CSDish values (1, 18)
insert into mcb.CSDish values (2, 10)
insert into mcb.CSDish values (3, 11)
insert into mcb.CSDish values (4, 18)
insert into mcb.CSDish values (5, 8)
insert into mcb.CSDish values (6, 10)
insert into mcb.CSDish values (7, 12)
insert into mcb.CSDish values (8, 8)
insert into mcb.CSDish values (9, 8)
insert into mcb.CSDish values (10, 10)
insert into mcb.CSDish values (11, 10)
insert into mcb.CSDish values (12, 18)
insert into mcb.CSDish values (13, 9)
insert into mcb.CSDish values (14, 8)
insert into mcb.CSDish values (15, 8)
insert into mcb.CSDish values (16, 7)
insert into mcb.CSDish values (17, 7)
insert into mcb.CSDish values (18, 10)
insert into mcb.CSDish values (19, 5)
insert into mcb.CSDish values (20, 10)
insert into mcb.CSDish values (21, 15)
insert into mcb.CSDish values (22, 15)
insert into mcb.CSDish values (23, 15)
insert into mcb.CSDish values (24, 22)
insert into mcb.CSDish values (25, 11)
insert into mcb.CSDish values (26, 4)
insert into mcb.CSDish values (27, 5)
insert into mcb.CSDish values (28, 8)
insert into mcb.CSDish values (29, 11)
insert into mcb.CSDish values (30, 15)
insert into mcb.CSDish values (31, 7)
insert into mcb.CSDish values (32, 8)
insert into mcb.CSDish values (33, 7)
insert into mcb.CSDish values (34, 14)
insert into mcb.CSDish values (35, 12)
insert into mcb.CSDish values (36, 12)
insert into mcb.CSDish values (37, 11)
insert into mcb.CSDish values (38, 12)
insert into mcb.CSDish values (39, 12)

---Dish---
insert into mcb.Dish values (1, 'Grilled Chicken', 'Tender chicken seasoned with spices for a mildly fiery kick, grilled to perfection', 1, 1)
insert into mcb.Dish values (2, 'Fish & Chips', 'Tender ocean fresh fish fillet fried perfectly for that crisp exterior, served with fries', 1, 1)
insert into mcb.Dish values (3, 'Chicken Cheese Baked Rice', 'Tender fried breaded chicken baked with savory rice and cheese in special white sauce', 1, 1)
insert into mcb.Dish values (4, 'Tenderloin Steak', 'The tenderloin is tastefully seasoned and grilled to bring out its remarkably rich flavors', 1, 1)

insert into mcb.Dish values (5, 'Dal Makhani', 'Whole black lentils cooked with butter and cream and simmered on low heat for that unique flavor', 2, 2)
insert into mcb.Dish values (6, 'Garlic Naan', 'A leavened, oven-baked flatbread sprinkeled with garlic', 2, 2)
insert into mcb.Dish values (7, 'Chicken Biriyani', 'Delicious savory rice dish that is loaded with spicy marinated chicken, caramelized onions, and flavorful saffron rice', 2, 2)
insert into mcb.Dish values (8, 'Paneer Butter Masala', 'Cottage cheese mixed with a spicy curry made from tomato and chilli', 2, 2)

insert into mcb.Dish values (9, 'Cantonese Dim Sum', 'Small bite sized dishes that are served in bamboo steamer baskets', 3, 3)
insert into mcb.Dish values (10, 'Ma Po Tofu', 'Tofu set in a spicy sauce, typically a thin, oily, and bright red suspension', 3, 3)
insert into mcb.Dish values (11, 'Dumplings', 'Small mass of leavened dough that is either boiled or steamed and served in soups or stews', 3, 3)
insert into mcb.Dish values (12, 'Hotpot', 'Flavorful broth traditionally served inside a large metal pot', 3, 3)

insert into mcb.Dish values (13, 'Chicken Katsu Curry Rice', 'Crunchy chicken cutlet or pork cutlet is served over rice and smothered in a creamy curry sauce', 4, 4)
insert into mcb.Dish values (14, 'Miso Ramen', 'Noodle soup made from miso, chicken, vegetables and pork', 4, 4)
insert into mcb.Dish values (15, 'Sake Sashimi', 'Thinly sliced raw fish served without rice', 4, 4)
insert into mcb.Dish values (16, 'Tanuki Udon', 'Noodle soup dish usually served in a hot dashi broth and topped with tempura bits called tenkasu', 4, 4)

insert into mcb.Dish values (17, 'Hoeddeok', 'Flour dough pancake filled with sugar syrup inside', 5, 5)
insert into mcb.Dish values (18, 'Japchae', 'Savoury and slightly sweet dish of stir-fried glass noodles and vegetables', 5, 5)
insert into mcb.Dish values (19, 'Tteokbokki', 'Hot and spicy rice cakes', 5, 5)
insert into mcb.Dish values (20, 'Bibimbap', 'rice with cooked vegetables, usually meat, and often a raw or fried egg', 5, 5)

insert into mcb.Dish values (21, 'Lasagna Bolognese', 'Layers of flat lasagna noodles baked with alternating layers of slow-cooked Bolognese sauce, bechamel, and Parmesan cheese', 6, 6)
insert into mcb.Dish values (22, 'Spaghetti Carbonara', 'Spaghetti with bacon and a creamy sauce made from eggs', 6, 6)
insert into mcb.Dish values (23, 'Fettucini Alfredo', 'Fettuccine pasta tossed with Parmesan cheese and butter', 6, 6)
insert into mcb.Dish values (24, 'Pizza Margherita', 'Pizza adorned simply in the colors of the Italian flag: green from basil, white from mozzarella, red from tomato sauce', 6, 6)

insert into mcb.Dish values (25, 'Cheeseburger', 'Hamburger topped with cheese', 7, 7)
insert into mcb.Dish values (26, 'French Fries', 'Deep-fried, very thin, salted slices of potato', 7, 7)
insert into mcb.Dish values (27, 'Potato Wedges', 'Irregular baked wedge-shaped slices', 7, 7)
insert into mcb.Dish values (28, 'Fried Chicken', 'Chicken pieces that have been deep fired and come along with sauce', 7, 7)

insert into mcb.Dish values (29, 'Tom yum Goong', 'A sour-flavoured spicy shrimp soup', 8, 8)
insert into mcb.Dish values (30, 'Pad Thai', 'Stir-fried rice noodles with eggs, vegetables and tofu in a sauce', 8, 8)
insert into mcb.Dish values (31, 'Gaeng Daeng', 'Red curry infused with milk', 8, 8)
insert into mcb.Dish values (32, 'Gaeng Keow wan kai', 'A blend of green curry paste combined with coconut cream to create a thick curry', 8, 8)

insert into mcb.Dish values (33, 'Chocolate Souffle', 'A dark chocolate ganache, deepened with the addition of unsweetened chocolate', 9, 9)
insert into mcb.Dish values (34, 'Soupe a l`oignon', 'A soup usually based on meat stock and onions', 9, 9)
insert into mcb.Dish values (35, 'Coq au vin', 'A classic French stew in which chicken is braised slowly in red wine to yield a supremely rich sauce filled with tender meat, mushrooms and onions', 9, 9)

insert into mcb.Dish values (36, 'Chilaquiles', 'Strips or pieces of corn tortillas that are fried, then saut�ed with green or red salsa, and topped with cheese', 10, 10)
insert into mcb.Dish values (37, 'Huevos Rancheros', 'Corn tortillas and fried eggs topped with plenty of warmed salsa', 10, 10)
insert into mcb.Dish values (38, 'Machaca', ' Strips of dried beef shredded, pounded to a pulp, and fried with onions, egg and tomatoes', 10, 10)
insert into mcb.Dish values (39, 'Chicken Burrito', 'Burrito stuffed with a juicy seasoned chicken filling, refried beans, corn, cheese and Mexican Red Rice', 10, 10)

---Contain---
insert into mcb.Contain values (1, 1)
insert into mcb.Contain values (1, 2)
insert into mcb.Contain values (1, 4)
insert into mcb.Contain values (1, 29)
insert into mcb.Contain values (1, 30)

insert into mcb.Contain values (2, 1)
insert into mcb.Contain values (2, 8)
insert into mcb.Contain values (2, 15)
insert into mcb.Contain values (2, 27)
insert into mcb.Contain values (2, 30)

insert into mcb.Contain values (3, 1)
insert into mcb.Contain values (3, 2)
insert into mcb.Contain values (3, 3)
insert into mcb.Contain values (3, 4)
insert into mcb.Contain values (3, 9)
insert into mcb.Contain values (3, 30)

insert into mcb.Contain values (4, 1)
insert into mcb.Contain values (4, 4)
insert into mcb.Contain values (4, 6)
insert into mcb.Contain values (4, 27)
insert into mcb.Contain values (4, 29)
insert into mcb.Contain values (4, 30)

insert into mcb.Contain values (5, 1)
insert into mcb.Contain values (5, 4)
insert into mcb.Contain values (5, 5)
insert into mcb.Contain values (5, 27)
insert into mcb.Contain values (5, 28)
insert into mcb.Contain values (5, 29)
insert into mcb.Contain values (5, 30)

insert into mcb.Contain values (6, 1)
insert into mcb.Contain values (6, 4)
insert into mcb.Contain values (6, 5)
insert into mcb.Contain values (6, 27)
insert into mcb.Contain values (6, 28)
insert into mcb.Contain values (6, 29)
insert into mcb.Contain values (6, 30)

insert into mcb.Contain values (7, 1)
insert into mcb.Contain values (7, 2)
insert into mcb.Contain values (7, 4)
insert into mcb.Contain values (7, 5)
insert into mcb.Contain values (7, 9)
insert into mcb.Contain values (7, 24)
insert into mcb.Contain values (7, 27)
insert into mcb.Contain values (7, 29)
insert into mcb.Contain values (7, 30)

insert into mcb.Contain values (8, 1)
insert into mcb.Contain values (8, 4)
insert into mcb.Contain values (8, 5)
insert into mcb.Contain values (8, 10)
insert into mcb.Contain values (8, 11)
insert into mcb.Contain values (8, 25)
insert into mcb.Contain values (8, 27)
insert into mcb.Contain values (8, 29)
insert into mcb.Contain values (8, 30)

insert into mcb.Contain values (9, 1)
insert into mcb.Contain values (9, 4)
insert into mcb.Contain values (9, 7)
insert into mcb.Contain values (9, 16)
insert into mcb.Contain values (9, 21)
insert into mcb.Contain values (9, 26)
insert into mcb.Contain values (9, 29)
insert into mcb.Contain values (9, 30)

insert into mcb.Contain values (10, 1)
insert into mcb.Contain values (10, 2)
insert into mcb.Contain values (10, 4)
insert into mcb.Contain values (10, 7)
insert into mcb.Contain values (10, 11)
insert into mcb.Contain values (10, 18)
insert into mcb.Contain values (10, 22)
insert into mcb.Contain values (10, 29)
insert into mcb.Contain values (10, 30)

insert into mcb.Contain values (11, 1)
insert into mcb.Contain values (11, 29)
insert into mcb.Contain values (11, 30)
insert into mcb.Contain values (11, 31)

insert into mcb.Contain values (12, 1)
insert into mcb.Contain values (12, 2)
insert into mcb.Contain values (12, 3)
insert into mcb.Contain values (12, 4)
insert into mcb.Contain values (12, 5)
insert into mcb.Contain values (12, 6)
insert into mcb.Contain values (12, 7)
insert into mcb.Contain values (12, 8)
insert into mcb.Contain values (12, 10)
insert into mcb.Contain values (12, 11)
insert into mcb.Contain values (12, 14)
insert into mcb.Contain values (12, 15)
insert into mcb.Contain values (12, 16)
insert into mcb.Contain values (12, 19)
insert into mcb.Contain values (12, 29)
insert into mcb.Contain values (12, 30)

insert into mcb.Contain values (13, 1)
insert into mcb.Contain values (13, 2)
insert into mcb.Contain values (13, 4)
insert into mcb.Contain values (13, 10)
insert into mcb.Contain values (13, 11)
insert into mcb.Contain values (13, 29)
insert into mcb.Contain values (13, 30)

insert into mcb.Contain values (14, 1)
insert into mcb.Contain values (14, 2)
insert into mcb.Contain values (14, 14)
insert into mcb.Contain values (14, 30)

insert into mcb.Contain values (15, 1)
insert into mcb.Contain values (15, 4)
insert into mcb.Contain values (15, 8)
insert into mcb.Contain values (15, 33)

insert into mcb.Contain values (16, 1)
insert into mcb.Contain values (16, 4)
insert into mcb.Contain values (16, 5)
insert into mcb.Contain values (16, 33)
insert into mcb.Contain values (16, 34)
insert into mcb.Contain values (16, 35)

insert into mcb.Contain values (17, 1)
insert into mcb.Contain values (17, 18)
insert into mcb.Contain values (17, 26)
insert into mcb.Contain values (17, 35)
insert into mcb.Contain values (17, 36)

insert into mcb.Contain values (18, 1)
insert into mcb.Contain values (18, 4)
insert into mcb.Contain values (18, 6)
insert into mcb.Contain values (18, 16)
insert into mcb.Contain values (18, 29)
insert into mcb.Contain values (18, 30)
insert into mcb.Contain values (18, 33)
insert into mcb.Contain values (18, 34)

insert into mcb.Contain values (19, 1)
insert into mcb.Contain values (19, 5)
insert into mcb.Contain values (19, 9)
insert into mcb.Contain values (19, 12)
insert into mcb.Contain values (19, 18)
insert into mcb.Contain values (19, 29)
insert into mcb.Contain values (19, 35)

insert into mcb.Contain values (20, 1)
insert into mcb.Contain values (20, 4)
insert into mcb.Contain values (20, 5)
insert into mcb.Contain values (20, 6)
insert into mcb.Contain values (20, 12)
insert into mcb.Contain values (20, 29)
insert into mcb.Contain values (20, 30)
insert into mcb.Contain values (20, 33)

insert into mcb.Contain values (21, 1)
insert into mcb.Contain values (21, 2)
insert into mcb.Contain values (21, 3)
insert into mcb.Contain values (21, 5)
insert into mcb.Contain values (21, 6)
insert into mcb.Contain values (21, 7)
insert into mcb.Contain values (21, 10)
insert into mcb.Contain values (21, 26)
insert into mcb.Contain values (21, 27)
insert into mcb.Contain values (21, 29)
insert into mcb.Contain values (21, 36)

insert into mcb.Contain values (22, 1)
insert into mcb.Contain values (22, 3)
insert into mcb.Contain values (22, 29)
insert into mcb.Contain values (22, 30)
insert into mcb.Contain values (22, 37)

insert into mcb.Contain values (23, 1)
insert into mcb.Contain values (23, 3)
insert into mcb.Contain values (23, 4)
insert into mcb.Contain values (23, 27)
insert into mcb.Contain values (23, 29)
insert into mcb.Contain values (23, 38)

insert into mcb.Contain values (24, 1)
insert into mcb.Contain values (24, 3)
insert into mcb.Contain values (24, 4)
insert into mcb.Contain values (24, 10)
insert into mcb.Contain values (24, 18)
insert into mcb.Contain values (24, 24)
insert into mcb.Contain values (24, 26)
insert into mcb.Contain values (24, 27)
insert into mcb.Contain values (24, 30)
insert into mcb.Contain values (24, 35)

insert into mcb.Contain values (25, 1)
insert into mcb.Contain values (25, 3)
insert into mcb.Contain values (25, 6)
insert into mcb.Contain values (25, 10)
insert into mcb.Contain values (25, 15)
insert into mcb.Contain values (25, 27)
insert into mcb.Contain values (25, 30)
insert into mcb.Contain values (25, 39)

insert into mcb.Contain values (26, 1)
insert into mcb.Contain values (26, 4)
insert into mcb.Contain values (26, 15)
insert into mcb.Contain values (26, 30)

insert into mcb.Contain values (27, 1)
insert into mcb.Contain values (27, 4)
insert into mcb.Contain values (27, 15)
insert into mcb.Contain values (27, 30)

insert into mcb.Contain values (28, 1)
insert into mcb.Contain values (28, 2)
insert into mcb.Contain values (28, 4)
insert into mcb.Contain values (28, 29)
insert into mcb.Contain values (28, 30)

insert into mcb.Contain values (29, 1)
insert into mcb.Contain values (29, 4)
insert into mcb.Contain values (29, 8)
insert into mcb.Contain values (29, 11)
insert into mcb.Contain values (29, 19)
insert into mcb.Contain values (29, 30)

insert into mcb.Contain values (30, 1)
insert into mcb.Contain values (30, 3)
insert into mcb.Contain values (30, 4)
insert into mcb.Contain values (30, 5)
insert into mcb.Contain values (30, 8)
insert into mcb.Contain values (30, 9)
insert into mcb.Contain values (30, 10)
insert into mcb.Contain values (30, 11)
insert into mcb.Contain values (30, 12)
insert into mcb.Contain values (30, 14)
insert into mcb.Contain values (30, 18)
insert into mcb.Contain values (30, 19)
insert into mcb.Contain values (30, 22)
insert into mcb.Contain values (30, 29)
insert into mcb.Contain values (30, 30)
insert into mcb.Contain values (30, 34)
insert into mcb.Contain values (30, 40)

insert into mcb.Contain values (31, 1)
insert into mcb.Contain values (31, 2)
insert into mcb.Contain values (31, 8)
insert into mcb.Contain values (31, 18)
insert into mcb.Contain values (31, 20)
insert into mcb.Contain values (31, 24)
insert into mcb.Contain values (31, 29)
insert into mcb.Contain values (31, 30)
insert into mcb.Contain values (31, 40)

insert into mcb.Contain values (32, 1)
insert into mcb.Contain values (32, 2)
insert into mcb.Contain values (32, 8)
insert into mcb.Contain values (32, 11)
insert into mcb.Contain values (32, 18)
insert into mcb.Contain values (32, 20)
insert into mcb.Contain values (32, 24)
insert into mcb.Contain values (32, 40)

insert into mcb.Contain values (33, 1)
insert into mcb.Contain values (33, 12)
insert into mcb.Contain values (33, 17)
insert into mcb.Contain values (33, 18)
insert into mcb.Contain values (33, 27)
insert into mcb.Contain values (33, 28)
insert into mcb.Contain values (33, 40)

insert into mcb.Contain values (34, 1)
insert into mcb.Contain values (34, 3)
insert into mcb.Contain values (34, 4)
insert into mcb.Contain values (34, 5)
insert into mcb.Contain values (34, 12)
insert into mcb.Contain values (34, 26)
insert into mcb.Contain values (34, 27)
insert into mcb.Contain values (34, 39)

insert into mcb.Contain values (35, 1)
insert into mcb.Contain values (35, 2)
insert into mcb.Contain values (35, 3)
insert into mcb.Contain values (35, 4)
insert into mcb.Contain values (35, 5)
insert into mcb.Contain values (35, 10)
insert into mcb.Contain values (35, 11)
insert into mcb.Contain values (35, 16)
insert into mcb.Contain values (35, 21)
insert into mcb.Contain values (35, 26)
insert into mcb.Contain values (35, 27)
insert into mcb.Contain values (35, 29)
insert into mcb.Contain values (35, 30)

insert into mcb.Contain values (36, 1)
insert into mcb.Contain values (36, 11)
insert into mcb.Contain values (36, 13)
insert into mcb.Contain values (36, 30)

insert into mcb.Contain values (37, 1)
insert into mcb.Contain values (37, 2)
insert into mcb.Contain values (37, 3)
insert into mcb.Contain values (37, 4)
insert into mcb.Contain values (37, 5)
insert into mcb.Contain values (37, 10)
insert into mcb.Contain values (37, 11)
insert into mcb.Contain values (37, 12)
insert into mcb.Contain values (37, 13)
insert into mcb.Contain values (37, 29)
insert into mcb.Contain values (37, 30)

insert into mcb.Contain values (38, 1)
insert into mcb.Contain values (38, 4)
insert into mcb.Contain values (38, 5)
insert into mcb.Contain values (38, 6)
insert into mcb.Contain values (38, 10)
insert into mcb.Contain values (38, 11)
insert into mcb.Contain values (38, 29)
insert into mcb.Contain values (38, 30)

insert into mcb.Contain values (39, 1)
insert into mcb.Contain values (39, 2)
insert into mcb.Contain values (39, 3)
insert into mcb.Contain values (39, 4)
insert into mcb.Contain values (39, 5)
insert into mcb.Contain values (39, 11)
insert into mcb.Contain values (39, 13)
insert into mcb.Contain values (39, 29)

---Ingredients---
insert into mcb.Ingredient values (1, 'Salt')
insert into mcb.Ingredient values (2, 'Chicken')
insert into mcb.Ingredient values (3, 'Cheese')
insert into mcb.Ingredient values (4, 'Garlic')
insert into mcb.Ingredient values (5, 'Onion')
insert into mcb.Ingredient values (6, 'Beef')
insert into mcb.Ingredient values (7, 'Pork')
insert into mcb.Ingredient values (8, 'Fish')
insert into mcb.Ingredient values (9, 'Rice')
insert into mcb.Ingredient values (10, 'Tomato')
insert into mcb.Ingredient values (11, 'Chilli')
insert into mcb.Ingredient values (12, 'Eggs')
insert into mcb.Ingredient values (13, 'Corn')
insert into mcb.Ingredient values (14, 'Beans')
insert into mcb.Ingredient values (15, 'Potato')
insert into mcb.Ingredient values (16, 'Mushrooms')
insert into mcb.Ingredient values (17, 'Chocolate')
insert into mcb.Ingredient values (18, 'Sugar')
insert into mcb.Ingredient values (19, 'Shrimp')
insert into mcb.Ingredient values (20, 'Coconut')
insert into mcb.Ingredient values (21, 'Wine')
insert into mcb.Ingredient values (22, 'Tofu')
insert into mcb.Ingredient values (23, 'Coconut')
insert into mcb.Ingredient values (24, 'Basil')
insert into mcb.Ingredient values (25, 'Cottage Cheese')
insert into mcb.Ingredient values (26, 'Flour')
insert into mcb.Ingredient values (27, 'Butter')
insert into mcb.Ingredient values (28, 'Black Lentils')
insert into mcb.Ingredient values (29, 'Spices')
insert into mcb.Ingredient values (30, 'Oil')
insert into mcb.Ingredient values (31, 'Dumplings')
insert into mcb.Ingredient values (32, 'Miso')
insert into mcb.Ingredient values (33, 'Soy Sauce')
insert into mcb.Ingredient values (34, 'Noodles')
insert into mcb.Ingredient values (35, 'Water')
insert into mcb.Ingredient values (36, 'Cinammon')
insert into mcb.Ingredient values (37, 'Spaghetti')
insert into mcb.Ingredient values (38, 'Fettucinne')
insert into mcb.Ingredient values (39, 'Buns')
insert into mcb.Ingredient values (40, 'Milk')

---Cuisine---
insert into mcb.Cuisine values (1, 'Western')
insert into mcb.Cuisine values (2, 'Indian')
insert into mcb.Cuisine values (3, 'Chinese')
insert into mcb.Cuisine values (4, 'Japanese')
insert into mcb.Cuisine values (5, 'Korean')
insert into mcb.Cuisine values (6, 'Italian')
insert into mcb.Cuisine values (7, 'Fast Food')
insert into mcb.Cuisine values (8, 'Thai')
insert into mcb.Cuisine values (9, 'French')
insert into mcb.Cuisine values (10, 'Mexican')

---CategorisedIn---
insert into mcb.CategorisedIn values(1,2)
insert into mcb.CategorisedIn values(1,6)
insert into mcb.CategorisedIn values(1,8)
insert into mcb.CategorisedIn values(1,9)
insert into mcb.CategorisedIn values(1,10)

insert into mcb.CategorisedIn values(2,2)
insert into mcb.CategorisedIn values(2,7)
insert into mcb.CategorisedIn values(2,8)
insert into mcb.CategorisedIn values(2,9)
insert into mcb.CategorisedIn values(2,10)

insert into mcb.CategorisedIn values(3,2)
insert into mcb.CategorisedIn values(3,3)
insert into mcb.CategorisedIn values(3,6)

insert into mcb.CategorisedIn values(4,2)
insert into mcb.CategorisedIn values(4,6)
insert into mcb.CategorisedIn values(4,8)
insert into mcb.CategorisedIn values(4,9)
insert into mcb.CategorisedIn values(4,10)

insert into mcb.CategorisedIn values(5,1)
insert into mcb.CategorisedIn values(5,3)

insert into mcb.CategorisedIn values(6,1)
insert into mcb.CategorisedIn values(6,3)

insert into mcb.CategorisedIn values(7,2)
insert into mcb.CategorisedIn values(7,6)

insert into mcb.CategorisedIn values(8,1)
insert into mcb.CategorisedIn values(8,3)

insert into mcb.CategorisedIn values(9,2)
insert into mcb.CategorisedIn values(9,4)

insert into mcb.CategorisedIn values(10,2)

insert into mcb.CategorisedIn values(11,2)
insert into mcb.CategorisedIn values(11,6)

insert into mcb.CategorisedIn values(12,2)
insert into mcb.CategorisedIn values(12,3)
insert into mcb.CategorisedIn values(12,6)
insert into mcb.CategorisedIn values(12,7)

insert into mcb.CategorisedIn values(13,2)
insert into mcb.CategorisedIn values(13,3)
insert into mcb.CategorisedIn values(13,6)

insert into mcb.CategorisedIn values(14,2)
insert into mcb.CategorisedIn values(14,6)

insert into mcb.CategorisedIn values(15,2)
insert into mcb.CategorisedIn values(15,4)
insert into mcb.CategorisedIn values(15,7)
insert into mcb.CategorisedIn values(15,8)
insert into mcb.CategorisedIn values(15,10)

insert into mcb.CategorisedIn values(16,2)
insert into mcb.CategorisedIn values(16,4)
insert into mcb.CategorisedIn values(16,7)
insert into mcb.CategorisedIn values(16,8)
insert into mcb.CategorisedIn values(16,10)

insert into mcb.CategorisedIn values(17,1)

insert into mcb.CategorisedIn values(18,1)
insert into mcb.CategorisedIn values(18,4)
insert into mcb.CategorisedIn values(18,5)
insert into mcb.CategorisedIn values(18,9)

insert into mcb.CategorisedIn values(19,1)
insert into mcb.CategorisedIn values(19,4)
insert into mcb.CategorisedIn values(19,5)
insert into mcb.CategorisedIn values(19,9)

insert into mcb.CategorisedIn values(20,2)
insert into mcb.CategorisedIn values(20,3)
insert into mcb.CategorisedIn values(20,6)

insert into mcb.CategorisedIn values(21,2)
insert into mcb.CategorisedIn values(21,3)
insert into mcb.CategorisedIn values(21,6)
insert into mcb.CategorisedIn values(21,7)

insert into mcb.CategorisedIn values(22,2)
insert into mcb.CategorisedIn values(22,3)
insert into mcb.CategorisedIn values(22,6)

insert into mcb.CategorisedIn values(23,2)
insert into mcb.CategorisedIn values(23,3)
insert into mcb.CategorisedIn values(23,6)

insert into mcb.CategorisedIn values(24,2)
insert into mcb.CategorisedIn values(24,3)

insert into mcb.CategorisedIn values(25,2)
insert into mcb.CategorisedIn values(25,3)
insert into mcb.CategorisedIn values(25,6)

insert into mcb.CategorisedIn values(26,1)
insert into mcb.CategorisedIn values(26,4)

insert into mcb.CategorisedIn values(27,1)
insert into mcb.CategorisedIn values(27,4)

insert into mcb.CategorisedIn values(28,2)
insert into mcb.CategorisedIn values(28,4)
insert into mcb.CategorisedIn values(28,6)
insert into mcb.CategorisedIn values(28,9)

insert into mcb.CategorisedIn values(29,1)
insert into mcb.CategorisedIn values(29,3)
insert into mcb.CategorisedIn values(29,5)

insert into mcb.CategorisedIn values(30,2)
insert into mcb.CategorisedIn values(30,4)
insert into mcb.CategorisedIn values(30,7)
insert into mcb.CategorisedIn values(30,9)

insert into mcb.CategorisedIn values(31,2)
insert into mcb.CategorisedIn values(31,3)
insert into mcb.CategorisedIn values(31,6)
insert into mcb.CategorisedIn values(31,7)
insert into mcb.CategorisedIn values(31,9)

insert into mcb.CategorisedIn values(32,2)
insert into mcb.CategorisedIn values(32,3)
insert into mcb.CategorisedIn values(32,6)
insert into mcb.CategorisedIn values(32,7)
insert into mcb.CategorisedIn values(32,9)

insert into mcb.CategorisedIn values(33,1)
insert into mcb.CategorisedIn values(33,3)

insert into mcb.CategorisedIn values(34,2)
insert into mcb.CategorisedIn values(34,3)
insert into mcb.CategorisedIn values(34,6)
insert into mcb.CategorisedIn values(34,8)
insert into mcb.CategorisedIn values(34,10)

insert into mcb.CategorisedIn values(35,2)
insert into mcb.CategorisedIn values(35,3)
insert into mcb.CategorisedIn values(35,6)
insert into mcb.CategorisedIn values(35,8)
insert into mcb.CategorisedIn values(35,10)

insert into mcb.CategorisedIn values(36,2)
insert into mcb.CategorisedIn values(36,3)
insert into mcb.CategorisedIn values(36,6)
insert into mcb.CategorisedIn values(36,8)
insert into mcb.CategorisedIn values(36,10)

insert into mcb.CategorisedIn values(37,2)
insert into mcb.CategorisedIn values(37,3)
insert into mcb.CategorisedIn values(37,6)
insert into mcb.CategorisedIn values(37,8)
insert into mcb.CategorisedIn values(37,10)

insert into mcb.CategorisedIn values(38,2)
insert into mcb.CategorisedIn values(38,3)
insert into mcb.CategorisedIn values(38,6)
insert into mcb.CategorisedIn values(38,8)
insert into mcb.CategorisedIn values(38,10)

insert into mcb.CategorisedIn values(39,2)
insert into mcb.CategorisedIn values(39,3)
insert into mcb.CategorisedIn values(39,6)
insert into mcb.CategorisedIn values(39,8)
insert into mcb.CategorisedIn values(39,9)
insert into mcb.CategorisedIn values(39,10)

---FoodCategory---
insert into mcb.FoodCategory values(1, 'Vegetarian', 'For those who don�t eat meat and seafood')
insert into mcb.FoodCategory values(2, 'Non-vegetarian', 'For those who eat all types of meat and seafood')
insert into mcb.FoodCategory values(3, 'Dairy', 'For those who can eat milk related foods')
insert into mcb.FoodCategory values(4, 'Non-Dairy', 'For those who cannot eat milk')
insert into mcb.FoodCategory values(5, 'Vegan', 'For those who don�t eat meat, seafood and dairy')
insert into mcb.FoodCategory values(6, 'Meat and Poultry', 'Food from all types of animals')
insert into mcb.FoodCategory values(7, 'Seafood', 'Food from sea life')
insert into mcb.FoodCategory values(8, 'Atkins', 'Less carbs, more fat and protein')
insert into mcb.FoodCategory values(9, 'Gluten-Free', 'Foods without gluten')
insert into mcb.FoodCategory values(10, 'Keto', 'Very low carbs, a lot of fat and reasonable amount of proteins')


