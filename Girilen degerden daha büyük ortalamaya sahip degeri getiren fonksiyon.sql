USE [Okul]


--Girilen degerden daha büyük ortalamaya sahip degeri getiren fonksiyon:

  
 ALTER function [dbo].[GirilenDeğerdennDahaBüyükOrtalamayıGetirir](@girilendeğer int)
  returns table
  as
  return 
   select * from (
	                           select 
	                                  ood.Vize,
	                                  ood.Final,
	                                  (ood.Vize*0.4+ood.Final*0.6) as Ortalama
	                                  
                               from dbo.OgrenciOgretmenDers as ood
                            
                               where  ood.Statu =1
                               
                          ) as a
                where a.Ortalama>@girilendeğer
	


--cagiralim:
select * from  dbo.GirilenDeğerdennDahaBüyükOrtalamayıGetirir(28)





--where clause kontrolü:

select *  from (select ood.Vize,ood.Final,(ood.Vize*0.4+ood.Final*0.6) as Ortalama from dbo.OgrenciOgretmenDers as ood)a
where a.Ortalama>28					  