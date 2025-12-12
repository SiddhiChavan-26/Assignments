--Q1. Write a Sql query that will fetch all upcoming courses.
SELECT * FROM courses
WHERE start_date > CURDATE();

--Q2. Write a Sql query that will fetch all the registered students along with course name
SELECT 
    s.reg_no,
    s.name,
    s.email,
    s.mobile_no,
    s.course_id,
    c.course_name
FROM students s
JOIN courses c ON s.course_id = c.course_id;

--Q3. Write an SQL query to fetch the complete details of a student (based on their email) along with the details
--of the course they are enrolled in
SELECT s.reg_no, s.name, s.email,s.mobile_no, s.course_id, c.course_name, c.description,c.fees, c.start_date, c.end_date, c.video_expire_days
FROM students s
JOIN courses c
ON s.course_id = c.course_id
WHERE s.email = 'rahul@example.com' ;

--Q4. Write an SQL query to retrieve the course details and the list of non-expired videos for a specific student
--using their email address. A video is considered active (not expired) if its added_at date plus the course’s
--video_expire_days has not yet passed compared to the current date.
SELECT
    c.course_id,
    c.course_name,
    c.start_date,
    c.end_date,
    c.video_expire_days,
    v.video_id,
    v.title,
    v.added_at
FROM students s
JOIN courses c
    ON s.course_id = c.course_id
JOIN videos v
    ON c.course_id = v.course_id
WHERE s.email = 'rahul@example.com'   
  AND DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY) >= CURDATE();


