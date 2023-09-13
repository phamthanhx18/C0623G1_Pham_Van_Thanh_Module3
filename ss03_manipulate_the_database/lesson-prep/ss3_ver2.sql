-- 1. Lấy ra thông tin các học viên và cho biết các học viên đang theo học 
-- lớp nào (chỉ những học viên có lớp học).
-- bảng học viên, bảng lớp.
select s.*, c.name as "class_name"
from student s
join class c on s.class_id = c.id;
-- 2. Lấy ra thông tin các học viên và cho biết các học viên 
-- đang theo học lớp nào 
-- (cả các bạn đã đăng ký nhưng chưa có lớp học).
-- học viên join lớp.
-- join?
select s.*, c.name as "class_name"
from student s
left join class c on s.class_id = c.id;
-- 3. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
-- 3. Lấy thông tin của các học viên tên bắt đầu bằng chữ H.
select *
from student
where name like '%hai' or name like '%huynh';
-- 4. Lấy ra học viên có điểm lớn hơn 5 .
select *
from student
where point > 5;
-- 5. Lấy ra học viên có họ là “nguyen”
select *
from student
where name like 'NGUYEN%';
-- 6. Thông kế số lượng học sinh theo từng loại điểm.

select point, count(point)
from student
group by point;

-- 7. Thông kê số lượng học sinh theo điểm và điểm phải lớn hơn 5

select point, count(point) as "số lượng"
from student
where point > 5
group by point;

-- 8. Thông kế số lượng học sinh theo điểm lớn hơn 5 
-- và chỉ hiện thị với số lượng>=2

select point, count(point) as "số lượng"
from student
where point > 5 
group by point
having count(point) >= 2; 

-- 9. Lấy ra danh sách học viên của lớp c1121g1 
-- và sắp xếp tên học viên theo alphabet.
-- học viên, lớp, innerjoin
-- where name = c11
select s.name, c.name
from student s
join class c 
on c.id = s.class_id
where c.name = 'c1121g1'
order by substring_index(s.name," ",-1);