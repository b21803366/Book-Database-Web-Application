use BOOKSTORE;

create view discounted_books as
select id, title, author_name
from book
where book.id in (select book_id from campaign);

create view confirmed_purchases as
select *
from purchase_request
where purchase_request.is_confirmed = 1;

create view positive_comment as
select *
from book_comment
where book_comment.rate > 5;

create view exported_cargos as
select *
from purchase_request
where purchase_request.id in (select purchase_request_id from in_cargo where export_date is not null and arrival_date is null);