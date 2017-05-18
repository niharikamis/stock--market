# from flask import Flask, Response
# from flask import render_template

# app = Flask(__name__)

# @app.route("/")
# def index():
#     return Response("It works!"), 200

# if __name__ == "__main__":
#     app.run(debug=True)
from flask import Flask, render_template
import psycopg2
conn = psycopg2.connect("dbname='stocks' user='postgres' host='localhost' password='123'")
curr = conn.cursor()


curr.execute("""select X.company_Id, sum(X.number)*100/(select sum(Y.add) from( select Z.company_Id, SUM(Z.number) as add from(select company_Id, number from Direct_Transaction UNION select company_Id, number from Indirect_Transaction) as Z group by Z.company_Id) as Y)
as percentage  from(
	select company_Id, number from Direct_Transaction
	UNION
	select company_Id, number from Indirect_Transaction
	) as X group by X.company_Id""")
rows = curr.fetchall()
b = ""
for i in rows:
	for j in i:
		b = b + str(j) + "*"
	b = b[:len(b) - 2]	
	b = b + ","
b= b[:len(b) - 2]	
print (b)


curr.execute("""select stocks.stock_symbol,quote from stocks,company where stock_exchange = 'NSE' and stocks.stock_symbol = company.stock_symbol""")
companies = curr.fetchall()
string_nse = ""
for i in companies:
        k = 0
        for j in i:
                if k ==0:
                        string_nse = string_nse + str(j)+ "  : "
                        k = 1
                else:
                        string_nse = string_nse + str(j)
                        k = 0
                
        string_nse = string_nse + "        "
        
print(string_nse)

curr.execute("""select stocks.stock_symbol,quote from stocks,company where stock_exchange = 'BSE' and stocks.stock_symbol = company.stock_symbol""")
companies = curr.fetchall()
string_bse = ""
for i in companies:
        k = 0
        for j in i:
                if k ==0:
                        string_bse = string_bse + str(j)+ "  : "
                        k = 1
                else:
                        string_bse = string_bse + str(j)
                        k = 0
                
        string_bse = string_bse + "        "
        
print(string_bse)

curr.execute("""select * from currency""")
companies = curr.fetchall()
currency = ""
for i in companies:
        for j in i:
                currency = currency + str(j)+ "*"
                
        currency = currency[:len(currency) - 2]
        currency = currency + ","
currency = currency[:len(currency) - 2]
print(currency)


curr.execute("""
select((select count(*) from Indirect_Transaction where time >= '09:00' and time <= '11:00') + (select count(*) from Direct_Transaction where time >= '09:00' and time <= '11:00'));""")
time1 = curr.fetchall()
time1= time1[0][0]
print(time1)

curr.execute("""
select((select count(*) from Indirect_Transaction where time >= '11:00' and time <= '13:00') + (select count(*) from Direct_Transaction where time >= '11:00' and time <= '13:00'));""")
time2 = curr.fetchall()
time2= time2[0][0]
print(time2)

curr.execute("""
select((select count(*) from Indirect_Transaction where time >= '13:00' and time < '15:00') + (select count(*) from Direct_Transaction where time >= '13:00' and time < '15:00'));""")
time3 = curr.fetchall()
time3= time3[0][0]
print(time3)

curr.execute("""
select((select count(*) from Indirect_Transaction where time >= '15:00' and time <= '17:00') + (select count(*) from Direct_Transaction where time >= '15:00' and time <= '17:00'));""")
time4 = curr.fetchall()
time4= time4[0][0]
print(time4)


curr.execute("""
select((select count(*) from Indirect_Transaction where time > '11:00' and time < '13:00') + (select count(*) from Direct_Transaction where time > '11:00' and time < '13:00'));""")
time2 = curr.fetchall()
time2= time2[0][0]

curr.execute("""select * from metals;""")
metal = curr.fetchall()
metal_price= ""
for i in metal:
        k = 0
        for j in i:
                if k ==0:
                        metal_price = metal_price + str(j)+ "  : "
                        k = 1
                else:
                        metal_price = metal_price + str(j)
                        k = 0
                
        metal_price = metal_price + "        "
        
print(metal_price)


curr.execute("""select name,stocks.stock_symbol,quote,IPO,beta,trend,opening_rate,closing_rate
from Company,Stocks where company.stock_symbol = stocks.stock_symbol;""")
c = curr.fetchall()
cs= ""
for i in c:
        for j in i:
                cs = cs + str(j) + "*"
        cs = cs+","
print(cs)
        



app = Flask(__name__)

@app.route('/')


def hello_name():
   return render_template('hello1.html', nse = string_nse, bse = string_bse, currencies = currency, percentage = b, t1 = time1, t2 = time2, t3 = time3, t4 = time4, metal_prices = metal_price, comp_info = cs)

if __name__ == '__main__':
   app.run(debug = True)
