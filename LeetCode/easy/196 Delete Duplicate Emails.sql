
delete from Person  p
where  id >(select min(id) from person where p.email=email)