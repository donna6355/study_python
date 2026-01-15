select rownum,
       a.*
  from product_review a;

-- rownum start from 1
select rownum,
       a.*
  from product_review a
 where rownum <= 10;

-- 최근 입사자 10명 추리기
-- 오라클 11g 이하 버전
select *
  from (
   select *
     from emp
    order by hire_date desc
)
 where rownum <= 10;

 -- 오라클 12c 이상 
select *
  from emp
 order by hire_date desc
 fetch first 10 rows only;


select *
  from emp
 order by hire_date desc
offset 3 rows fetch first 10 rows with ties;




----------------------PRACTICE------------------------
-- LG_PRODUCT 테이블에서 가장 비싼 제품 TOP 3와 가장 저렴한 제품 TOP 3을 각각 조회해보세요. 
select *
  from (
   select *
     from lg_product
    order by price desc
)
 where rownum <= 3;


select *
  from lg_product
 order by price desc
 fetch first 3 rows only;


 -- 2020년 미만에 출시된 상품들의 재고를 빨리 없애기 위해 현황 파악을 하려고 합니다. 
 -- 즉, 상품이 등록된 시점이 2019년 12월 31일 23시59분59초 이하여야 합니다. 
 -- 이때, 각 카테고리별로 재고의 합계를 구하고, 재고가 가장 많이 남은 TOP 2를 아래와 같이 출력해주세요. 

select *
  from (
   select category,
          sum(stock_qty) as 카테고리별재고합계
     from (
      select *
        from lg_product
       where to_char(
         created_at,
         'yyyy'
      ) < '2020'
   )
    group by category
    order by 카테고리별재고합계 desc
)
 where rownum <= 2;

select category,
       sum(stock_qty) as 카테고리별재고합계
  from (
   select *
     from lg_product
    where to_char(
      created_at,
      'yyyy'
   ) < '2020'
)
 group by category
 order by 카테고리별재고합계 desc
 fetch first 2 rows only;



-- LOG_AC 는 특정 디바이스의 2주간의 에어컨 로그 전송 정보를 보유하고 있습니다. 
-- 아래와 같이 일자별로 사용한 전력의 합이 가장 많았던 3일을 출력하시오. 
select *
  from (
   select to_char(
      ts,
      'yyyymmdd'
   ) as 일자,
          sum(power_w) as 전력합계
     from log_ac
    group by to_char(
      ts,
      'yyyymmdd'
   )
    order by 전력합계 desc
)
 where rownum <= 3;

select to_char(
   ts,
   'yyyymmdd'
) as 일자,
       sum(power_w) as 전력합계
  from log_ac
 group by to_char(
   ts,
   'yyyymmdd'
)
 order by 전력합계 desc
 fetch first 3 rows only;


 -- (심화) 리뷰 내용이 500BYTE이상 입력된 리뷰를 대상으로 
 -- 상품별로 평균 평점을 구한 후, 
 -- 평균 평점이 가장 높은 TOP 3의 상품 정보들을 함께 추출하시오. 

select p.product_name,
       p.category,
       r.리뷰개수,
       r.평균평점
  from lg_product p
 inner join (
   select product_id,
          count(*) as 리뷰개수,
          avg(rating) as 평균평점
     from (
      select *
        from product_review
       where lengthb(review_text) >= 500
   )
    group by product_id
    order by avg(rating) desc
) r
on p.product_id = r.product_id
 fetch first 3 rows only;



 -- 재직중인 직원들을 대상으로 연차 소진을 독려해야 합니다.
 -- 그런데 하루에 최대 10명의 사원에게만 독려할 수 있습니다. 
 -- 가장 연차를 많이 보유한 대상들에게 먼저 독려할 수 있도록 
 -- 연차 수가 많은 상위 10명의 직원을 찾는 쿼리를 작성해주세요. 

select *
  from emp
 where retire_yn = 'N'
 order by leave_amount desc
 fetch first 10 rows only;