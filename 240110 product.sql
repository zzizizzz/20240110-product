insert into comm_product_categories values(1000, '����');
insert into comm_product_categories values(1001, '��ǻ��');
insert into comm_product_categories values(1002, '�ֹ�');
insert into comm_product_categories values(1003, '����');
insert into comm_product_categories values(1004, '����');

insert into comm_product_companies
values(2000, '�Ｚȸ��', '02-1111-1111', '����Ư����');
insert into comm_product_companies
values(2001, 'LGȸ��', '02-2222-1111', '�λ걤����');
insert into comm_product_companies
values(2002, '����ȸ��', '02-3333-1111', '��õ������');
insert into comm_product_companies
values(2003, '���ȸ��', '02-4444-1111', '����������');
insert into comm_product_companies
values(2004, '��ȭȸ��', '02-5555-1111', '��걤����');

insert into comm_product_status values (5000, '�԰���');
insert into comm_product_status values (5001, '�Ǹ���');
insert into comm_product_status values (5002, '������');
insert into comm_product_status values (5003, '�Ǹ�����');

insert into comm_events values (7000, '������','1�����̻� �������Դϴ�.');
insert into comm_events values (7001, '���Ϲ��','���� 12�� �����ֹ��ǿ� ���ؼ� ���̹���Դϴ�.');
insert into comm_events values (7002, '1+1', '1���ֹ��� �ϳ��� �� �帳�ϴ�.');
insert into comm_events values (7003, '2+1', '2���ֹ��� �ϳ��� �� �帳�ϴ�.');
insert into comm_events values (7004, 'ī������','ī�� ����� 1%�����ص帳�ϴ�');
insert into comm_events values (7005, '��Ż�����','��Ż� ���� �ߺ������մϴ�,');

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
            


            