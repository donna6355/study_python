select *
  from product_review;

select *
  from product_review
 where rating >= (
   select avg(rating)
     from product_review
);



-------Scalar Sub Query------------
select quantity, -- #3
       total_price,
       (
          select product_name -- #4
            from lg_product
           where product_id = member_purchase.product_id
       ) as 상품명
  from member_purchase -- #1
 where member_id = 'MEMBER02'; -- #2

 -- 실행 순서 : from -> where -> select -> scalar sub query
 -- 한개의 컬럼/로우 만 가져올 수 있다
 -- 서브쿼리만 단독으로 실행 할 수 있다 -> 비연관 서브쿼리 -> 서브쿼리 먼저 메인쿼리 실행
 -- 메인 쿼리의 컬럼을 참조해야되기 때문에 -> 연관 서브쿼리 -> 메인쿼리 먼저 서브쿼리 실행


 -- 회원 id, 이름, 연락처(휴대폰)
 -- 1개의 값만 가져올 경우에는 조인보다는 스칼라쿼리를 사용하는게 효율적
select 회원id,
       이름,
       (
          select 연락처
            from 회원연락처 c
           where c.회원id = m.회원id
             and 구분코드 = '휴대폰'
       ) as 휴대폰번호
  from 회원 m;


-- 회원 이름, 아이디, 구매횟수 (0)
select member_id,
       member_name,
       (
          select count(*)
            from member_purchase p
           where p.member_id = m.member_id
       ) as 구매횟수
  from lg_member m;

  
  -- select member_id, count(*)
  -- from MEMBER_PURCHASE
  -- GROUP by member_id;


  /*
  상품 가격과 리뷰개수의 상관관계를 확인하려 합니다. 
  상품의 정보와 함께 리뷰개수와 추가로 가장 최근에 리뷰가 작성된 날짜를 함께 조회하세요. 
  실행결과는 PRICE 기준 내림차순 정렬하시오
  */

select product_name,
       price,
       (
          select count(*)
            from product_review r
           where r.product_id = p.product_id
       ) as 리뷰개수,
       (
          select max(r.created_at)
            from product_review r
           where r.product_id = p.product_id
       ) as 가장최근리뷰일시
  from lg_product p
 order by price desc;

 -- 부서별로 재직중인 직원들이 각각 몇명이 있는지 
 -- 부서정보와 함께 부서별인원수로 표현하여 아래와 같이 출력해주세요. 

select d.dept_name,
       d.dept_en_name,
       (
          select count(*)
            from emp e
           where e.dept_no = d.dept_no
             and e.retire_yn = 'N'
       ) as 부서별인원수
  from dept d;




-------Inline View Sub Query------------
-- 쿼리 결과를 테이블처럼 사용
select dept_name,
       dept_en_name,
       부서별인원수
  from (
   select dept_no,
          count(*) as 부서별인원수
     from emp
    where retire_yn = 'N'
    group by dept_no
) d
  join dept d
on d.dept_no = d.dept_no;


-- LG 제품 카테고리별 평균금액을 구하고, 
-- 각 카테고리별로 평균금액보다 비싼 상품만 출력해주세요. 
select b.category,
       b.product_name,
       b.price,
       a.avg_price
  from (
   select category,
          avg(price) as avg_price
     from lg_product
    group by category
) a
  join lg_product b
on a.category = b.category
 where b.price > a.avg_price;


 /*
 LG 충성 고객을 찾기 위해 구매 횟수를 기반으로 데이터를 산정해보려고 합니다. 
 LG회원 정보와 함께 MEMBER_PURCHASE 테이블을 활용해서 
 각 구매횟수를 카운트한 결과를 출력하되, 구매를 한번도 하지 않은 회원은 0이 출력되도록 해주세요. 
 마지막으로 출력 결과는 구매한 횟수가 큰 순서대로 출력되도록 해주세요. 
 */

select m.member_name,
       m.phone_number,
       nvl(
          c.구매횟수,
          0
       ) as purchase_count
  from lg_member m
  left join (
   select p.member_id,
          count(*) as 구매횟수
     from member_purchase p
    group by p.member_id
) c
on m.member_id = c.member_id
 order by purchase_count desc;


-------Nested Sub Query------------




-----------EXISTS--------------
select *
  from lg_member
 where exists (
   select *
     from member_purchase
    where member_id = lg_member.member_id
);

select *
  from lg_product
 where product_id not in (
   select distinct product_id
     from product_review
    where rating <= 2
);

select *
  from lg_product
 where not exists (
   select *
     from product_review
    where product_review.product_id = lg_product.product_id
      and rating <= 2
);