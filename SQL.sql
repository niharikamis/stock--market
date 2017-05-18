
create database stocks;
\c stocks;

create table Company(
name varchar(40),
stock_symbol varchar(5),
sector varchar(30),
stock_exchange varchar(4),
primary key(stock_symbol));


create table Stocks(
stock_symbol varchar(5),
quote numeric(6,2),
IPO numeric(6,2),
beta numeric(4,2),
trend varchar(5),
opening_rate numeric(6,2),
closing_rate numeric(6,2),
primary key(stock_symbol),
CONSTRAINT fk1 foreign key(stock_symbol) REFERENCES Company);


create table Investor(
I_Id varchar(5),
name varchar(40),
PAN varchar(12),
address varchar(40),
primary key(I_Id),
unique(PAN));


create table Portfolio(
I_Id varchar(5),
company_Id varchar(5),
number_of_stocks numeric(5,0),
primary key(I_Id,company_Id),
CONSTRAINT fk2 foreign key(I_Id) REFERENCES Investor,
CONSTRAINT fk3 foreign key(company_Id) REFERENCES Company);

create table Broker(
B_Id varchar(5),
username varchar(30),
password varchar(40),
brokerage varchar(40),
primary key(B_Id));


create table Serves(
B_Id varchar(5),
I_Id varchar(5),
primary key(B_Id,I_Id),
CONSTRAINT fk9 foreign key(B_Id) REFERENCES Broker,
CONSTRAINT fk10 foreign key(I_Id) REFERENCES Investor);


create table Direct_Transaction(
I_Id varchar(5),
company_Id varchar(5),
trans_type varchar(4),
time varchar(8),
stock_price numeric(8,2),
number numeric(5,0),
primary key(I_Id,company_Id),
CONSTRAINT fk4 foreign key(company_Id) REFERENCES Company,
CONSTRAINT fk5 foreign key(I_Id) REFERENCES Investor);

create table Indirect_Transaction(
B_Id varchar(5),
I_Id varchar(5),
company_Id varchar(5),
trans_type varchar(4),
time varchar(8),
stock_price numeric(5,2),
number numeric(5,0),
primary key(B_Id,I_Id,company_Id),
CONSTRAINT fk6 foreign key(company_Id) REFERENCES Company,
CONSTRAINT fk7 foreign key(B_Id,I_Id) REFERENCES Serves(B_Id,I_Id));


create table Metals(
name varchar(20),
value numeric(8,2),
primary key(name));

create table Currency(
standard_currency varchar(40),
currency varchar(40),
value numeric(8,2),
primary key(currency));

create table Metal_Investment(
B_Id varchar(5),
I_Id varchar(5),
metal varchar(30),
amount numeric(8,2),
price numeric(8,2),
primary key(B_Id,I_Id,metal),
CONSTRAINT fk13 foreign key(B_Id,I_Id) REFERENCES Serves,
CONSTRAINT fk12 foreign key(metal) REFERENCES Metals);



insert into Company values('Aarti Industries Ltd.', 'AIL', 'Chemicals', 'NSE');
insert into Company values('Aban Offshore Ltd.', 'AOL', 'Oil', 'NSE');
insert into Company values('Aditya Birla Fashion and Retail Ltd.', 'ABF','Retailing','NSE');
insert into Company values('AIA Engineering Ltd.', 'AIA', 'Industrial Equipment' ,'NSE');
insert into Company values('Ajanta Pharma Ltd.', 'AJP', 'Pharmaceuticals', 'NSE');
insert into Company values('Albemic Pharmaceuticals Ltd.','ALP', 'Pharmaceuticals' ,'NSE');
insert into Company values('Bharati Airtel Ltd.', 'BAL', 'Telecommunication', 'NSE');
insert into Company values('Bharat Forge Ltd.', 'BFL', 'Forgings', 'NSE');
insert into Company values('Blue Star Ltd.', 'BSL', 'Chemicals', 'NSE');
insert into Company values('Canara Bank', 'CNB', 'Bank - Public', 'NSE');
insert into Company values('Castrol India Ltd.', 'CIL', 'Lubricants', 'NSE');
insert into Company values('Axis Bank Ltd.', 'ABL', 'Bank - Private', 'BSE');
insert into Company values('Cipla Ltd.', 'CPL', 'Pharmaceuticals', 'BSE');
insert into Company values('HDFC Bank Ltd.', 'HBL', 'Bank - Private', 'BSE');
insert into Company values('Hero MotoCorp Ltd.', 'HMC', 'Automobile', 'BSE');
insert into Company values('Hindustan Unilever Ltd.', 'HUL', 'Household', 'BSE');
insert into Company values('ICICI Bank Ltd.', 'IBL', 'Bank - Private', 'BSE');
insert into Company values('Infosys Ltd.', 'IFL', 'IT', 'BSE');
insert into Company values('Tata Consultancy Services Ltd.', 'TCS', 'IT', 'BSE');
insert into Company values('Tata Steel Ltd.', 'TSL', 'Steel', 'BSE');


insert into Investor values ('IN123','Srinivasan','ABCDE123F','White Field');
insert into Investor values ('IN124','Wu','ABCDE124F','SNN-SERENITY');
insert into Investor values ('IN125','Mozart','ABCDE125F','RR NAGAR');
insert into Investor values ('IN126','Einstien','ABCDE126F','HEBBAL');
insert into Investor values ('IN127','Ashok','ABCDE127F','GIRI NAGAR');
insert into Investor values ('IN128','Goldy','ABCDE128F','JP NAGAR');
insert into Investor values ('IN129','Katz','ABCDE129F','GIRI NAGAR');
insert into Investor values ('IN130','Califieri','ABCDE130F','BANASHANKHARI');
insert into Investor values ('IN131','Singh','ABCDE131F','MG ROAD');
insert into Investor values ('IN132','Crick','ABCDE132F','RR NAGAR');
insert into Investor values ('IN133','Brandt','ABCDE133F','JAY NAGAR');
insert into Investor values ('IN134','Kim','ABCDE134F','WHITE FIELD');
insert into Investor values ('IN135','Jignesh','ABCDE135F','JAIPUR');
insert into Investor values ('IN136','Jiggisa','ABCDE136F','HYDERABAD');
insert into Investor values ('IN137','Nihal','ABCDE137F','ALLAH NAGAR');
insert into Investor values ('IN138','Nikita','ABCDE138F','ASHOK MARG');
insert into Investor values ('IN139','Rashi','ABCDE139F','LUCKNOW');
insert into Investor values ('IN140','MutthuSwami','ABCDE140F','GIRI NAGAR');
insert into Investor values ('IN141','Nikhil','ABCDE141F','JP NAGAR');
insert into Investor values ('IN142','Sita','ABCDE142F','RR NAGAR');


insert into broker values ('BR101', 'Srini', 'abc_123', 'Your Law_brokerage');
insert into broker values ('BR102', 'Messy', 'password', 'Your Law_brokerage');
insert into broker values ('BR203', 'Ash', '12345567', 'AJ & Sons Brokerage');
insert into broker values ('BR404', 'GoldenStein', 'hero_26', 'Brokerage 4 U');
insert into broker values ('BR305', 'Frank', 'my_bike', 'Kothari & Sons');
insert into broker values ('BR161', 'Kimmy', 'LawFirm', 'Your Law_brokerage');
insert into broker values ('BR891', 'Suri', 'bday_1990', 'Krishna Brokerage');
insert into broker values ('BR181', 'Singh', 'Rajendra', 'Finance_Services');
insert into broker values ('BR501', 'Sidhu', 'navjodh', 'Misra Finances');
insert into broker values ('BR901', 'Brad', 'USA_147', 'Agarwal Law_brokerage');
insert into broker values ('BR201', 'Brandt', 'Narayan', 'Your Law_brokerage');
insert into broker values ('BR301', 'Mozzy', 'Neal_pollock', 'Your Law_brokerage');
insert into broker values ('BR302', 'Moriarty', 'Sherlock', 'AJ & Sons Brokerage');
insert into broker values ('BR407', 'Sheldon', 'password', 'Brokerage 4 U');
insert into broker values ('BR503', 'Michael', 'Scofield_458', 'Kothari & Sons');
insert into broker values ('BR162', 'Lincoln', 'Burrows_109', 'Your Law_brokerage');
insert into broker values ('BR198', 'Cooper', 'Fernandes', 'Krishna Brokerage');
insert into broker values ('BR182', 'Bellick', 'office_password', 'Finance_Services');
insert into broker values ('BR568', 'Colin', 'mock_1960', 'Misra Finances');
insert into broker values ('BR109', 'Russel', 'peter', 'Agarwal Law_brokerage');
insert into broker values ('BR963', 'Sahil', 'khatri', 'Misra Finances');
insert into broker values ('BR852', 'Atul', 'shah', 'Agarwal Law_brokerage');



insert into Serves values ('BR101', 'IN123');
insert into Serves values ('BR203', 'IN125');
insert into Serves values ('BR203', 'IN126');
insert into Serves values ('BR182', 'IN127');
insert into Serves values ('BR161', 'IN128');
insert into Serves values ('BR891', 'IN142');
insert into Serves values ('BR109', 'IN130');
insert into Serves values ('BR181', 'IN131');
insert into Serves values ('BR501', 'IN132');
insert into Serves values ('BR901', 'IN133');
insert into Serves values ('BR201', 'IN134');
insert into Serves values ('BR109', 'IN135');
insert into Serves values ('BR302', 'IN136');
insert into Serves values ('BR407', 'IN137');
insert into Serves values ('BR503', 'IN123');
insert into Serves values ('BR162', 'IN139');
insert into Serves values ('BR182', 'IN140');
insert into Serves values ('BR568', 'IN142');
insert into Serves values ('BR109', 'IN142');
insert into Serves values ('BR109', 'IN123');

insert into portfolio values('IN142','AOL',100);
insert into portfolio values('IN140','HMC',600);
insert into portfolio values('IN130','IFL',250);
insert into portfolio values('IN135','HUL',290);
insert into portfolio values('IN135','TSL',320);
insert into portfolio values('IN142','HBL',1010);
insert into portfolio values('IN136','AOL',187);
insert into portfolio values('IN128','AIL',2089);
insert into portfolio values('IN129','CNB',2340);
insert into portfolio values('IN131','CIL',1234);
insert into portfolio values('IN132','CIL',2300);
insert into portfolio values('IN141','IBL',1000);
insert into portfolio values('IN132','BAL',7650);
insert into portfolio values('IN140','AIA',1050);
insert into portfolio values('IN140','AJP',2390);
insert into portfolio values('IN123','AOL',1890);
insert into portfolio values('IN124','HBL',235);
insert into portfolio values('IN125','BAL',950);
insert into portfolio values('IN126','AIA',230);
insert into portfolio values('IN127','CIL',762);
insert into portfolio values('IN130','IFL',850);
insert into portfolio values('IN130','IFL',790);
insert into portfolio values('IN131','BAL',230);
insert into portfolio values('IN132','CPL',170);
insert into portfolio values('IN133','CIL',760);
insert into portfolio values('IN135','HMC',865);
insert into portfolio values('IN134','AIA',245);
insert into portfolio values('IN135','CNB',290);
insert into portfolio values('IN136','ALP',350);
insert into portfolio values('IN136','AJP',290);
insert into portfolio values('IN137','TSL',340);
insert into portfolio values('IN138','HUL',120);
insert into portfolio values('IN137','BAL',125);
insert into portfolio values('IN137','BAL',400);
insert into portfolio values('IN140','TSL',7000);
insert into portfolio values('IN137','ABL',1980);
insert into portfolio values('IN136','IFL',300);
insert into portfolio values('IN136','TCS',3005);
insert into portfolio values('IN135','TCS',2390);
insert into portfolio values('IN135','IFL',790);
insert into portfolio values('IN134','TSL',1000);
insert into portfolio values('IN132','TSL',1050);
insert into portfolio values('IN131','TCS',1300);
insert into portfolio values('IN126','AOL',1005);
insert into portfolio values('IN131','ALP',4002);
insert into portfolio values('IN128','BAL',1350);
insert into portfolio values('IN127','BAL',2000);
insert into portfolio values('IN127','CIL',1000);
insert into portfolio values('IN126','AJP',130);
insert into portfolio values('IN126','ABL',1100);
insert into portfolio values('IN125','BFL',3100);
insert into portfolio values('IN125','AIL',1090);
insert into portfolio values('IN142','AOL',160);

insert into metals values('gold',999);
insert into metals values('silver',750);	
insert into metals values('brass',500);
insert into metals values('aluminium',220);
insert into metals values('platinum',999);
insert into metals values('zinc',22);
insert into metals values('manaksia',120);
insert into metals values('steel',650);
insert into metals values('iron',120);
insert into metals values('mineral',50);
insert into metals values('mercury',160);
insert into metals values('copper',320);
insert into metals values('crude oil',120);

insert into Stocks values('AIL',670.90,774.90,0.08,'-2.47',785.52,794.65);
insert into Stocks values('AOL',150.43,225.25,0.09,'-2.1',228.8,224.9);
insert into Stocks values('ABF',256.34,155.40,0.01,'+2.3',254.23,256.7);
insert into Stocks values('AIA',400.43,220,0.79,'+2.03',398.8,400.9);
insert into Stocks values('AJP',290.43,420,0.86,'-1.23',280.8,278.9);
insert into Stocks values('ALP',120.43,140,0.98,'+2.34',117.8,125.9);
insert into Stocks values('BAL',89.43,320,0.09,'+0.78',91.8,85.9);
insert into Stocks values('BFL',138.03,420,0.9,'+1.02',140.8,145.9);
insert into Stocks values('BSL',245.51,210,0.95,'+2.02',247.8,249.9);
insert into Stocks values('CNB',340.40,205,0.04,'+1.56',337.8,340.9);
insert into Stocks values('CIL',324.33,290,0.10,'+1.06',317.8,322.9);
insert into Stocks values('ABL',215.14,193,0.01,'-0.34',195.8,203.9);
insert into Stocks values('CPL',250.56,670,0.34,'+2.1',260.8,249.0);
insert into Stocks values('HBL',140.92,150,0.56,'+1.11',135.8,124.9);
insert into Stocks values('HMC',560.31,150,0.08,'+0.97',520.8,530.9);
insert into Stocks values('HUL',340.20,700,0.72,'-1.16',337.8,320.9);
insert into Stocks values('IBL',156.02,208,0.12,'-2.90',167.8,200.9);
insert into Stocks values('IFL',770.98,450,0.09,'+1.29',760.8,789.9);
insert into Stocks values('TCS',231.70,123,0.29,'-0.78',247.8,287.9);
insert into Stocks values('TSL',287.26,320,0.4,'+3.17',240.8,264.9);


insert into Indirect_Transaction values ('BR101','IN123','AIL','BUY','16:05',340.34,25);
insert into Indirect_Transaction values ('BR101','IN123','AOL','SELL','13:15',342.14,100);
insert into Indirect_Transaction values ('BR203', 'IN126','AIA','SELL','16:00',250.70,290);
insert into Indirect_Transaction values ('BR182', 'IN127','BFL','BUY','10:53',120.04,10);
insert into Indirect_Transaction values ('BR161', 'IN128','CNB','SELL','10:55',178.42,35);
insert into Indirect_Transaction values ('BR161', 'IN128','CPL','SELL','16:24',1256.21,45);
insert into Indirect_Transaction values ('BR109', 'IN130','HBL','BUY','11:43',146.32,29);
insert into Indirect_Transaction values ('BR181', 'IN131','HBL','SELL','17:30',234.54,2605);
insert into Indirect_Transaction values ('BR109', 'IN130','HMC','SELL','10:31',109.67,124);
insert into Indirect_Transaction values ('BR109', 'IN130','HUL','BUY','16:28',100.00,201);
insert into Indirect_Transaction values ('BR201', 'IN134','AJP','SELL','11:37',89.98,209);
insert into Indirect_Transaction values ('BR109', 'IN135','IFL','BUY','10:10',97.34,320);
insert into Indirect_Transaction values ('BR302', 'IN136','CIL','SELL','16:25',125.54,125);
insert into Indirect_Transaction values ('BR407', 'IN137','CNB','SELL','15:42',320.321,212);
insert into Indirect_Transaction values ('BR503', 'IN123','CPL','BUY','14:07',340.50,312);
insert into Indirect_Transaction values ('BR162', 'IN139','AIL','BUY','12:00',312.06,219);
insert into Indirect_Transaction values ('BR182', 'IN140','CIL','SELL','10:16',729.12,120);
insert into Indirect_Transaction values ('BR109', 'IN135','CIL','SELL','15:19',99.14,130);
insert into Indirect_Transaction values ('BR109', 'IN142','BAL','SELL','11:32',189.86,145);
insert into Indirect_Transaction values ('BR109', 'IN135','AOL','BUY','14:56',764.70,135);

insert into Direct_Transaction values ('IN123','AIL','BUY','14:00',2000,100);
insert into Direct_Transaction values ('IN125','AOL','BUY','17:00',2030,500);
insert into Direct_Transaction values ('IN124','CNB','SELL','10:50',5000,10);
insert into Direct_Transaction values ('IN126','ABL','BUY','14:20',400,60);
insert into Direct_Transaction values ('IN127','AIL','SELL','16:00',5432,90);
insert into Direct_Transaction values ('IN128','HBL','BUY','16:20',4300,80);
insert into Direct_Transaction values ('IN129','IFL','SELL','14:40',700,400);
insert into Direct_Transaction values ('IN130','TSL','BUY','09:34',200,6700);
insert into Direct_Transaction values ('IN129','TSL','BUY','12:00',700,100);
insert into Direct_Transaction values ('IN132','HMC','SELL','14:50',342,100);	
insert into Direct_Transaction values ('IN133','CNB','BUY','17:00',6500,1210);
insert into Direct_Transaction values ('IN134','AIL','BUY','16:40',310,150);
insert into Direct_Transaction values ('IN135','CIL','SELL','14:00',2650,100);
insert into Direct_Transaction values ('IN136','ABL','BUY','09:40',2600,650);
insert into Direct_Transaction values ('IN137','BAL','SELL','16:50',6300,1000);
insert into Direct_Transaction values ('IN138','AJP','BUY','14:00',2000,100);
insert into Direct_Transaction values ('IN125','BFL','SELL','14:40',240,1054);
insert into Direct_Transaction values ('IN123','CNB','BUY','12:40',2430,1043);
insert into Direct_Transaction values ('IN142','AIL','SELL','09:10',2430,540);
insert into Direct_Transaction values ('IN140','AJP','BUY','15:50',2400,1040);

insert into currency values('US Dollar','Indian Rupee',65.32);
insert into currency values('US Dollar','Bangladeshi Taka',80.17);
insert into currency values('US Dollar','Argentine Peso',15.57);
insert into currency values('US Dollar','Bermudan Dollar',1.00);
insert into currency values('US Dollar','Canadian Dollar',1.34);
insert into currency values('US Dollar','British Pound',0.81);
insert into currency values('US Dollar','Euro',0.93);
insert into currency values('US Dollar','Hong Kong Dollar',7.76);
insert into currency values('US Dollar','Bitcoin',0.0001);
insert into currency values('US Dollar','Iraqi Dinar',65.32);
insert into currency values('US Dollar','Australian Dollar',1.30);
insert into currency values('US Dollar','Singapore Dollar',1.402);
insert into currency values('US Dollar','Emirati Dirham',3.673);
insert into currency values('US Dollar','Swiss Franc',0.9983);
insert into currency values('US Dollar','Indonesian Rupiah',13347.00);
insert into currency values('US Dollar','Japanese Yen',112.69);
insert into currency values('US Dollar','Kuwaiti Dinar',0.3047);
insert into currency values('US Dollar','Sri Lankan Rupee',152.32);
insert into currency values('US Dollar','Pakistani Rupee',104.79);
insert into currency values('US Dollar','Malaysian Ringitt',4.437);

insert into Metal_Investment values ('BR101','IN123','gold',10,2200);
insert into Metal_Investment values ('BR203', 'IN126','gold',100,2200);
insert into Metal_Investment values ('BR182', 'IN127','platinum',150,1000);
insert into Metal_Investment values ('BR161', 'IN128','platinum',1200,1000);
insert into Metal_Investment values ('BR891', 'IN142','zinc',1324,22);
insert into Metal_Investment values ('BR109', 'IN130','zinc',500,22);
insert into Metal_Investment values ('BR181', 'IN131','steel',320,650);
insert into Metal_Investment values ('BR501', 'IN132','steel',100,650);
insert into Metal_Investment values ('BR901', 'IN133','copper',210,320);
insert into Metal_Investment values ('BR201', 'IN134','crude oil',45,120);
insert into Metal_Investment values ('BR109', 'IN135','mineral',2000,50);
insert into Metal_Investment values ('BR302', 'IN136','manaksia',450,120);
insert into Metal_Investment values ('BR407', 'IN137','brass',230,500);
insert into Metal_Investment values ('BR503', 'IN123','crude oil',128,120);
insert into Metal_Investment values ('BR162', 'IN139','manaksia',430,120);
insert into Metal_Investment values ('BR182', 'IN140','copper',563,320);
insert into Metal_Investment values ('BR568', 'IN142','silver',510,1500);
insert into Metal_Investment values ('BR109', 'IN142','silver',64,1500);
insert into Metal_Investment values ('BR109', 'IN123','brass',232,500);
insert into Metal_Investment values ('BR109', 'IN123','steel',25,620);


1.to find all investors with indirect transactions.

select distinct name from investor,indirect_transaction where investor.i_id = indirect_transaction.i_id;


2.list all the brokers and the number of investors they serve, if they serve greater than equal to 2 investors.

select b_id,count(i_id) from serves group by b_id having count(*)>=2; 


3.list all people who have invested in metal and stock.

select distinct name,i_id from investor where i_id in(select i_id from direct_transaction) and i_id in(select i_id from metal_investment)
UNION
select distinct name,i_id from investor where i_id in(select i_id from indirect_transaction) and i_id in(select i_id from metal_investment);  


4.number of stocks held by investor having I_Id=140

select sum(number_of_stocks) from portfolio where I_Id='IN135';



5.list the number of transactions made by one broker in one day

select i.B_Id, b.username, count(*)  from Indirect_Transaction as i, broker as b where i.B_Id = b.B_Id group by i.B_Id, b.username; 


6.unempployed brokers

select username,B_Id from broker where B_Id NOT IN (select B_Id from Indirect_Transaction);


7.Investor who have not invested on that day

select name,I_Id from Investor where I_Id NOT IN((select I_Id from Direct_Transaction) UNION (select I_Id from Indirect_Transaction));


8. list the leading company in each sector.

select C.sector,C.name,C.stock_symbol,S.quote from Company as C, Stocks as S where S.quote in (select max(quote) from Company,Stocks 
	where Company.stock_symbol = Stocks.stock_symbol group by sector) and C.stock_symbol = S.stock_symbol;

9. Name and id of investors who have not taken help of brokers and have done investment in metals

select name,I_Id from Investor where I_Id IN (select I_Id from Metal_Investment where I_Id IN(select I_Id from Direct_Transaction where I_Id
 NOT IN(select I_Id from Indirect_Transaction)));

10. max transaction between 10:00 to 18:00

select d.I_id, d.company_Id from Direct_Transaction as d where 
d.stock_price * d.number in (select max(a.value) from (select x.stock_price * x.number as value from Direct_Transaction as x 
where x.time < '18:00' and x.time > '10:00') as a );


11. The percentage of buy and sell 

select X.company_Id, sum(X.number)*100/(select sum(Y.add) from( select Z.company_Id, SUM(Z.number) as add 
	from(select company_Id, number from Direct_Transaction UNION select company_Id, number from Indirect_Transaction) as Z group by Z.company_Id) as Y)
as percentage  from(
	select company_Id, number from Direct_Transaction
	UNION
	select company_Id, number from Indirect_Transaction
	) as X group by X.company_Id; 


12.find who has invested most money in metal.

select name,investor.i_id,amount*price as value from metal_investment,investor where investor.i_id = metal_investment.i_id and 
amount * price = (select max(a.value) from (select amount*price as value from metal_investment) as a);


13.number of transactions between a time range

select((select count(*) from Indirect_Transaction where time > '09:00' and time < '11:00') + (select count(*) from Direct_Transaction where time > '9:00' and time < '11:00')) as number;

14.Indian to all other currencies

 (select round(value / (select value from currency where currency = 'Indian Rupee'),5 ) as INR,currency from Currency  );





