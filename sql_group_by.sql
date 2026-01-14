-- DROP TABLE 성적표 ; 
-- DROP TABLE 수강생정보 ; 

-- CREATE TABLE 수강생정보 (
-- 학생ID VARCHAR2(9) PRIMARY KEY , 
-- 학생이름 VARCHAR2(50) NOT NULL , 
-- 소속반 VARCHAR2(5) 
-- ); 

-- CREATE TABLE 성적표 ( 
--     학생ID VARCHAR2(9) , 
--     과목   VARCHAR2(30) , 
--     성적   NUMBER  , 
--     CONSTRAINT PK_성적표 PRIMARY KEY(학생ID , 과목) , 
--     CONSTRAINT FK_성적표 FOREIGN KEY(학생ID) REFERENCES 수강생정보(학생ID) 
-- )  ; 

-- INSERT INTO 수강생정보 VALUES ('S0001' , '김현철' , 'A') ; 
-- INSERT INTO 수강생정보 VALUES ('S0002' , '문현중' , 'A') ; 
-- INSERT INTO 수강생정보 VALUES ('S0003' , '강문치' , 'B') ; 
-- INSERT INTO 수강생정보 VALUES ('S0004' , '박나선' , 'B') ; 
-- INSERT INTO 수강생정보 VALUES ('S0005' , '신태강' , 'B') ; 
-- INSERT INTO 수강생정보 VALUES ('S0006' , '물고기' , 'C') ; 
-- INSERT INTO 수강생정보 VALUES ('S0007' , '자라니' , 'C') ; 
-- INSERT INTO 수강생정보 VALUES ('S0008' , '공팔두' , 'C') ; 
-- INSERT INTO 수강생정보 VALUES ('S0009' , '최팔현' , 'C') ; 

-- INSERT INTO 성적표 VALUES('S0001'  ,'국어' , 90); 
-- INSERT INTO 성적표 VALUES('S0001'  ,'수학' , 85); 
-- INSERT INTO 성적표 VALUES('S0001'  ,'영어' , 100); 
-- INSERT INTO 성적표 VALUES('S0002'  ,'국어' , 100); 
-- INSERT INTO 성적표 VALUES('S0002'  ,'수학' , 100); 
-- INSERT INTO 성적표 VALUES('S0002'  ,'영어' , 20); 
-- INSERT INTO 성적표 VALUES('S0003'  ,'국어' , 100); 
-- INSERT INTO 성적표 VALUES('S0003'  ,'수학' , 100); 
-- INSERT INTO 성적표 VALUES('S0003'  ,'영어' , 20); 
-- INSERT INTO 성적표 VALUES('S0004'  ,'국어' , 85); 
-- INSERT INTO 성적표 VALUES('S0004'  ,'수학' , 40); 
-- INSERT INTO 성적표 VALUES('S0004'  ,'영어' , 60); 
-- INSERT INTO 성적표 VALUES('S0005'  ,'국어' , 100); 
-- INSERT INTO 성적표 VALUES('S0005'  ,'수학' , 100); 
-- INSERT INTO 성적표 VALUES('S0005'  ,'영어' , 100); 
-- INSERT INTO 성적표 VALUES ( 'S0006' , '국어' , NULL ) ; 
-- INSERT INTO 성적표 VALUES ( 'S0006' , '수학' , 80 ) ; 
-- INSERT INTO 성적표 VALUES ( 'S0006' , '영어' , NULL ) ; 

-- COMMIT; 



------------- count ---------

select 소속반,
       count(*) as 반별인원수
  from 수강생정보
 group by 소속반;
-- * counts null as well
-- specific column omits null
select 학생id,
       count(성적),
       count(*)
  from 성적표
 group by 학생id;

select job_title,
       count(*) as people
  from emp
 group by job_title;

-----------------------------



------------- max,min -------
-- date, number, string 

select 학생id,
       max(성적),
       min(성적)
  from 성적표
 group by 학생id;

-----------------------------


------------- avg -----------
-- except null
-- 80 + null+null / 1 => 80
select 학생id,
       avg(성적)
  from 성적표
 group by 학생id;
-----------------------------

------------- sum -----------
select 학생id,
       sum(성적)
  from 성적표
 group by 학생id;
-----------------------------


------------- practice -----------
-- 1. 재직자를 대상으로 부서별로 사원수가 몇명인지 아래와 같이 조회해주세요.
select d.dept_name,
       count(*) as 부서별사원수
  from emp e
 inner join dept d
on e.dept_no = d.dept_no
 where e.retire_yn = 'N'
 group by d.dept_name;


-- 2. 1번 문제의 결과에서 추가로 GROUP BY 를 수정해 아래와 같이 
-- 부서별, 성별별로 각 사원수가 집계되도록 쿼리해주세요.
select d.dept_name,
       e.gender,
       count(*) as 부서별사원수
  from emp e
 inner join dept d
on e.dept_no = d.dept_no
 where e.retire_yn = 'N'
 group by d.dept_name,
          e.gender;

-- 3. 전체 직원을 대상으로 퇴사자 수와 재직자 수를 구하려고 합니다. 
select case e.retire_yn
   when 'Y' then
      '퇴사자'
   when 'N' then
      '재직자'
   else
      '기타'
       end as 퇴사여부,
       count(*) as 사람수
  from emp e
 group by e.retire_yn;


-- 4. PRODUCT_REVIEW 테이블을 활용해서 상품별로 리뷰건수가 몇개인지, 평균 평점은 몇인지, 가장 처음 달린 리뷰의 날짜와, 
-- 가장 마지막으로 입력된 리뷰의 날짜를 차례대로 구하시오.  
-- [심화] 위 리뷰 결과에 추가로 다음과 같은 로직을 추가해보세요.
select r.product_id,
       count(*) as 리뷰건수,
       round(
          avg(r.rating),
          2
       ) as 평균별점,
       min(r.created_at) as 처음리뷰등록일시,
       max(r.created_at) as 최근리뷰등록일시,
       max(r.created_at) - min(r.created_at) as 리뷰가등록된일수,
       round(
          count(*) /(max(r.created_at) - min(r.created_at)),
          1
       ) as 일평균리뷰건수
  from product_review r
 group by r.product_id;

-- inline view (subquery) -> query를 테이블처럼 사용!
select b.product_id,
       b.product_name,
       a.리뷰건수,
       a.평균별점, -- 필요한 부분만 붙이기
       a.* -- 전체 테이블 붙이기
  from (
   select r.product_id,
          count(*) as 리뷰건수,
          round(
             avg(r.rating),
             2
          ) as 평균별점,
          min(r.created_at) as 처음리뷰등록일시,
          max(r.created_at) as 최근리뷰등록일시,
          max(r.created_at) - min(r.created_at) as 리뷰가등록된일수,
          round(
             count(*) /(max(r.created_at) - min(r.created_at)),
             1
          ) as 일평균리뷰건수
     from product_review r
    group by r.product_id
) a
 inner join lg_product b
on a.product_id = b.product_id;



-- 5. LG 서비스를 이용하는 회원 정보를 LG_MEMBER에 저장하고 있습니다.
-- 각 회원들은 가입시 이메일 정보를 입력해야 하며, 여러 경로(daum , kakao , gmail , icloud 등) 의 메일을 사용하고 있습니다. 
-- 다음 중, 메일의 @뒷부분만 활용하여 각 회원수가 몇명인지 집계해보세요.
select substr(
   m.email,
   instr(
      m.email,
      '@'
   ) + 1
) as 메일유형,
       count(*) as 사용인원수
  from lg_member m
 group by substr(
   m.email,
   instr(
      m.email,
      '@'
   ) + 1
);

-- pivot
select product_name,
       sum(
          case
             when r.rating = 1 then
                1
             else
                0
          end
       ) as 평점1,
       sum(
          case
             when r.rating = 2 then
                1
             else
                0
          end
       ) as 평점2,
       sum(
          case
             when r.rating = 3 then
                1
             else
                0
          end
       ) as 평점3,
       sum(
          case
             when r.rating = 4 then
                1
             else
                0
          end
       ) as 평점4,
       sum(
          case
             when r.rating = 5 then
                1
             else
                0
          end
       ) as 평점5,
       count(*) as 전체평점개수
  from product_review r
  join lg_product p
on r.product_id = p.product_id
 group by product_name;




 -------------- having ----------------
select d.dept_name,
       count(*) as 부서별사원수
  from emp e
 inner join dept d
on e.dept_no = d.dept_no
 where e.retire_yn = 'N'
 group by d.dept_name
having count(*) > 10;


select r.product_id,
       count(*) as 리뷰건수,
       round(
          avg(r.rating),
          2
       ) as 평균별점,
       min(r.created_at) as 처음리뷰등록일시,
       max(r.created_at) as 최근리뷰등록일시
  from product_review r
 group by r.product_id
having count(*) >= 300;