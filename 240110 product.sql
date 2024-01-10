insert into comm_product_categories values(1000, '문구');
insert into comm_product_categories values(1001, '컴퓨터');
insert into comm_product_categories values(1002, '주방');
insert into comm_product_categories values(1003, '가구');
insert into comm_product_categories values(1004, '가전');

insert into comm_product_companies
values(2000, '삼성회사', '02-1111-1111', '서울특별시');
insert into comm_product_companies
values(2001, 'LG회사', '02-2222-1111', '부산광역시');
insert into comm_product_companies
values(2002, '현대회사', '02-3333-1111', '인천광역시');
insert into comm_product_companies
values(2003, '대우회사', '02-4444-1111', '대전광역시');
insert into comm_product_companies
values(2004, '한화회사', '02-5555-1111', '울산광역시');

insert into comm_product_status values (5000, '입고예정');
insert into comm_product_status values (5001, '판매중');
insert into comm_product_status values (5002, '재고없음');
insert into comm_product_status values (5003, '판매종료');

insert into comm_events values (7000, '무료배송','1만원이상 무료배송입니다.');
insert into comm_events values (7001, '당일배송','오전 12시 이전주문건에 대해서 당이배송입니다.');
insert into comm_events values (7002, '1+1', '1개주문시 하나를 더 드립니다.');
insert into comm_events values (7003, '2+1', '2개주문시 하나를 더 드립니다.');
insert into comm_events values (7004, '카드할인','카드 결재시 1%할인해드립니다');
insert into comm_events values (7005, '통신사할인','통신사 할인 중복가능합니다,');

commit;





create table comm_product_categories (
    category_no         number(4),
    category_name       varchar(255) not null,
    constraint product_catno_pk primary key(category_no)
    );
    
    create table comm_product_companies(
        company_no      number(4),
        company_name    varchar2(255) not null,
        company_tel     varchar2(255) not null,
        company_city    varchar2(255) not null,
        
        constraint product_companyno_pk primary key (company_no)
        
    );
    
    create table comm_events (
      event_no          number(4),
      event_title       varchar2(255) not null,
      event_description varchar2(255) not null,
      
      constraint eventno_pk primary key(event_no)
    );
    create table comm_product_status (
    status_no               number(4),
    status_name             varchar(255) not null,
    constraint product_statusno_pk primary key (status_no)
    );
    
    
  create table comm_products (
    product_no              number(6),
    product_name            varchar2(255) not null,
    category_no             number(4) not null,
    company_no              number(4) not null,
    product_price           number(8) not null,
    product_discount_price  number(8) not null,
    product_description     varchar2(1000) not null,
    status_no               number(4) not null,
    product_stock           number(5) default 100,
    product_updated_date    date      default sysdate,
    product_created_date    date      default sysdate,
    
    constraint productno_pk primary key(product_no),
    constraint product_catno_fk foreign key (category_no)
                                references comm_product_categories (category_no),
    constraint product_companyno_fk foreign key (company_no)
                              references comm_product_companies (company_no),
    constraint product_statusno_fk foreign key (status_no)
                            references comm_product_status (status_no)
);


create table comm_product_events (
    product_no number(6) not null,
    event_no   number(4) not null,
    constraint events_productno_fk foreign key (product_no)
                            references comm_products (product_no),
    constraint events_eventno_fk foreign key (event_no)
                            references comm_events (event_no)
                            
                            
                            
);





		select
			category_no				as no,
			category_name			as	name
			
        from 
				comm_product_categories
				
        order by
				category_no asc;
                
                
		select
			company_no			as no,
			company_name 		as name,
			company_tel			as tel,
			company_city		as city
		from 
			comm_product_companies
		order by
			company_no asc;
            
            
		select
			status_no			as no,
			status_name			as name
		from 
			comm_product_status
		order by
			status_no asc;
            
            
        select 
			event_no			as no,
			event_title			as title,
			event_description 	as description
			
		from 
			comm_events
		order by
			event_no asc;
            
            		select 
			event_no			as no,
			event_title			as title,
			event_description 	as description
			
		from 
			comm_events
		order by
			event_no asc;
            
            
create sequence products_seq start with 100000 nocache;

select products_seq.nextval
from dual;

select A.product_no,
      D.category_name,
       A.product_name,
       B.company_name,
       A.product_price,
       A.product_discount_price,
       C.status_name,
       A.product_created_date,
       A.product_updated_date
from comm_products A, comm_product_companies B, comm_product_status C, comm_product_categories D
where A.company_no = B.company_no
and A.status_no = C.status_no
and A.category_no = D.category_no
and A.product_no=100011;


   		select 
   			event_no			as no,
   			event_title 		as title,
   			event_description   as description
   			
   		from 
   			comm_events
   		where 
   			event_no in(select event_no
   						from comm_product_events
   						where product_no = 100011);
            


            