CREATE TABLE events (
    event_id         INT PRIMARY KEY,
    event_name       TEXT,
    event_date       DATE,
    event_location   TEXT,
    event_description TEXT
);

CREATE TABLE attendees (
    attendee_id     INT PRIMARY KEY,
    attendee_name   TEXT,
    attendee_phone  TEXT,
    attendee_email  TEXT,
    attendee_city   TEXT
);

CREATE TABLE registrations (
    registration_id    INT PRIMARY KEY,
    event_id           INT,
    attendee_id        INT,
    registration_date  DATE,
    registration_amount NUMERIC,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id)
);

INSERT INTO events VALUES
(1, 'Tech Summit 2025', '2025-02-10', 'Delhi', 'Technology and innovation event'),
(2, 'Music Fest',        '2025-03-15', 'Mumbai', 'Live music concert'),
(3, 'Startup Expo',      '2025-04-20', 'Bangalore', 'Startup showcase and networking');


INSERT INTO attendees VALUES
(1, 'Aman Kumar',  '9871111111', 'aman@example.com',  'Delhi'),
(2, 'Sara Malik',  '9872222222', 'sara@example.com',  'Mumbai'),
(3, 'Rohit Sharma','9873333333', 'rohit@example.com', 'Bangalore'),
(4, 'Priya Verma', '9874444444', 'priya@example.com', 'Delhi');


INSERT INTO registrations VALUES
(101, 1, 1, '2025-01-15', 500),
(102, 1, 4, '2025-01-20', 500),
(103, 2, 2, '2025-02-10', 800),
(104, 3, 1, '2025-03-01', 600),
(105, 3, 3, '2025-03-05', 600);


INSERT INTO events VALUES
(4, 'Health Conference', '2025-05-10', 'Chennai', 'Medical and wellness conference');

UPDATE events
SET event_location = 'Hyderabad',
    event_date = '2025-02-20'
WHERE event_id = 1;


DELETE FROM events
WHERE event_id = 2;



ALTER TABLE registrations
DROP CONSTRAINT registrations_event_id_fkey;

ALTER TABLE registrations
ADD CONSTRAINT registrations_event_id_fkey
FOREIGN KEY (event_id) REFERENCES events(event_id)
ON DELETE CASCADE;



DELETE FROM events WHERE event_id = 2;


INSERT INTO attendees VALUES
(5, 'Neha Sharma', '9879999999', 'neha@example.com', 'Kolkata');


INSERT INTO registrations VALUES
(106, 1, 5, '2025-02-01', 500);

SELECT * FROM events;

SELECT 
    e.event_name,
    a.attendee_name,
    a.attendee_email,
    r.registration_date
FROM registrations r
JOIN attendees a ON r.attendee_id = a.attendee_id
JOIN events e ON r.event_id = e.event_id
WHERE r.event_id = 1;


SELECT 
    e.event_name,
    COUNT(r.attendee_id) AS total_attendees
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_name;






