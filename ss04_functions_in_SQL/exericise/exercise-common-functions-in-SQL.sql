USE QuanLySinhVien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    subject
WHERE
    Credit IN (SELECT 
            MAX(Credit)
        FROM
            subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 
    sj.SubName, MAX(Mark)
FROM
    mark m
        JOIN
    subject sj ON m.SubId = sj.SubId
GROUP BY sj.SubId;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 
    s.*, AVG(Mark) AS 'Diem thi trung binh'
FROM
    student s
        JOIN
    mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId;