use BOOKSTORE;

DELIMITER $$ 
       -- DEFAULT ROW FOR Subcategory --
	insert into category(id,title) values (-1,'General'); 
	insert into subcategory(title,category_id) values ('General',-1);

	create trigger deleteSubcategorytrigger after delete on subcategory
		for each row
			begin
				update book set subcategory_id=1 where subcategory_id is null ;
			end$$ 
       
	create trigger deleteCategorytrigger after delete on category
		for each row
			begin
				update Book set subcategory_id=1 where subcategory_id is null ;
			end$$
	
    create trigger setpricewithcampaign before insert on Book 
		for each row
			begin
				IF new.price_with_campaign IS null then
					SET new.price_with_campaign = new.price;
				end IF;
			end$$
        
	-- When below triggers are running, because of the book is updated, i create this trigger. Also it can be used for after update a price
	create trigger updatepricewithcampaign before update on Book 
		for each row
			begin
				IF new.price_with_campaign <> new.price then
					SET new.price_with_campaign = new.price - new.price * (select distinct discount_percentage from book,campaign where new.id = book_id)/100;
				end IF;
			end$$
        
	create trigger setpricewithcampaignaftercampaign after insert on Campaign 
		for each row
			begin
				update Book as b set b.price_with_campaign = b.price - b.price * new.discount_percentage/100 where b.id =  new.book_id;
			end$$ 
	
	create trigger setpricewithcampaignafterupdatecampaign after UPDATE on Campaign 
		for each row
			begin
				update Book set price_with_campaign = price - price * new.discount_percentage/100 where book.id =  new.book_id;
			end$$ 
        
	create trigger deletepricewithcampaignafterupdatecampaign after Delete on Campaign 
		for each row
			begin
				update Book set price_with_campaign = price where book.id =  old.book_id;
			end$$
DELIMITER ;