select *
  from lg_product
 order by price desc;


select *
  from lg_product
 order by category desc,
          stock_qty asc;



 -- PRODUCT_REVIEW 테이블에서 상품ID를 기준으로 그룹화하여 리뷰 개수를 구합니다. 
 -- 그 다음 리뷰 개수를 기준으로 내림차순 정렬하여 어떤 상품ID가 리뷰 개수가 높은지 알아봅시다.

select product_id,
       count(*) as 리뷰수
  from product_review r
 group by product_id
 order by 리뷰수 desc;


-- 사원을 직급순으로 정렬하되, 같은 직급 내에서는 이름이 가나다 순으로 정렬되도록 하시오.
select e.emp_id,
       e.name,
       e.job_title
  from emp e
 order by job_title,
          name asc;

-- 재직중인 사원을 대상으로 JOB_TITLE 기준 오름차순 정렬한 후, 잔여연차수가 많은 순서대로 출력하시오. 
select e.emp_id,
       e.name,
       e.job_title,
       d.dept_name,
       e.leave_amount
  from emp e
 inner join dept d
on e.dept_no = d.dept_no
 where e.retire_yn = 'N'
 order by e.job_title asc,
          e.leave_amount desc;



-- custom order with case

select *
  from emp
 order by
   case job_title
      when '선임' then
         1
      when '책임' then
         2
      when '팀장' then
         3
      else
         4
   end;