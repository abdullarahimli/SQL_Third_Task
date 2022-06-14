Create Database Technology

Use Technology


Create Table Brands (
	Id int Primary key Identity,
	Name nvarchar(30)
)

-- 1) Notebook ve Brand Arasinda Mentiqe Uygun Relation Qurun.

Create Table Notebooks (
	Id int Primary Key Identity,
	Name nvarchar(30),
	Price money,
	BrandId int Foreign Key References Brands(Id)
)

-- 2) Phones ve Brand Arasinda Mentiqe Uygun Relation Qurun.

Create Table Phones (
	Id int Primary Key Identity,
	Name nvarchar(30),
	Price money,
	BrandId int Foreign Key References Brands(Id)
)

Select * From Brands
Select * From Notebooks
Select * From Phones

-- 3) Notebooks Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

Select n.Name, b.Name BrandName, n.Price From Brands b Join Notebooks n On b.Id = n.BrandId
Select (b.Name+' '+n.Name) BrandName, n.Price From Brands b Join Notebooks n On b.Id = n.BrandId

-- 4) Phones Adini, Brandin Adini BrandName kimi ve Qiymetini Cixardan Query.

Select p.Name, b.Name BrandName, p.Price From Brands b Join Phones p On b.Id = p.BrandId
Select (b.Name+' '+p.Name) BrandName, p.Price From Brands b Join Phones p On b.Id = p.BrandId

-- 5) Brand Adinin Terkibinde s Olan Butun Notebooklari Cixardan Query.

Select Notebooks.Id, Notebooks.Name, Notebooks.Price, Notebooks.BrandId, Brands.Name BrandName
From Notebooks Join Brands On Notebooks.BrandId = Brands.Id Where Brands.Name like '%s%'

-- 6) Qiymeti 2000 ve 5000 arasi ve ya 5000 den yuksek Notebooklari Cixardan Query.

Select Notebooks.Name From Notebooks Where Price Between 2000 And 5000 Or Price > 5000

-- 7) Qiymeti 1000 ve 1500 arasi ve ya 1500 den yuksek Phonelari Cixardan Query.

Select Phones.Name From Phones Where Price Between 1000 And 1500 Or Price > 1500

-- 8) Her Branda Aid Nece dene Notebook Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

Select Brands.Name, Count(*) ProductCount From Notebooks
Join Brands On Notebooks.BrandId = Brands.Id
Group By Brands.Name

-- 9) Her Branda Aid Nece dene Phone Varsa Brandin Adini Ve Yaninda Sayini Cixardan Query.

Select Brands.Name, Count(*) ProductCount From Phones
Join Brands On Phones.BrandId = Brands.Id
Group By Brands.Name

-- 10) Hem Phone Hem de Notebookda Ortaq Olan Name ve BrandId Datalarni Bir Cedvelde Cixardan Query.

Select * From Phones

-- 11) Phone ve Notebook da Id, Name, Price, ve BrandId Olan Butun Datalari Cixardan Query.

Select p.Id, p.Name, p.Price, p.BrandId From Phones p

Select n.Id, n.Name, n.Price, n.BrandId From Notebooks n

-- 12) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan Butun Datalari Cixardan Query.

Select p.Id, p.Name, p.Price, p.BrandId, Brands.Name BrandName From Phones p
Join Brands On p.BrandId = Brands.Id

Select n.Id, n.Name, n.Price, n.BrandId, Brands.Name BrandName From Notebooks n
Join Brands On n.BrandId = Brands.Id

-- 13) Phone ve Notebook da Id, Name, Price, ve Brandin Adini BrandName kimi Olan 
--Butun Datalarin Icinden Price 1000-den Boyuk Olan Datalari Cixardan Query.

Select Phones.Id, Phones.Name, Phones.Price, Notebooks.Id, Notebooks.Name, Notebooks.Price, Brands.Name BrandName  From Phones
Join Brands On Phones.BrandId = Brands.Id Join Notebooks On Notebooks.BrandId = Brands.Id Where Phones.Price > 1000 Or Notebooks.Price > 1000

-- 14) Phones Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi), 
--Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) ve Hemin Branda Nece dene Telefon Varsa 
--Sayini (ProductCount Kimi) Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple               6750                  3
--Samsung             3500                  4
--Redmi               800                   1


Select Brands.Name BrandName, Sum(Phones.Price) TotalPrice, Count(*) ProductCount From Phones
Join Brands On Phones.BrandId = Brands.Id
Group By Brands.Name

--15) Notebooks Tabelenden Data Cixardacaqsiniz Amma Nece Olacaq Brandin Adi (BrandName kimi),
--Hemin Brandda Olan Telefonlarin Pricenin Cemi (TotalPrice Kimi) , Hemin Branda Nece dene Telefon Varsa 
--Sayini (ProductCount Kimi) Olacaq ve Sayi 3-ve 3-den Cox Olan Datalari Cixardan Query.Misal
--BrandName:        TotalPrice:        ProductCount:
--Apple                6750                3
--Samsung              3500                4

Select Brands.Name BrandName, Sum(Notebooks.Price) TotalPrice, Count(*)  ProductCount From Notebooks
Join Brands On Notebooks.BrandId = Brands.Id 
Group By Brands.Name
Having Count(*) > 2


