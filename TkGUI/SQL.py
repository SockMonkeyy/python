import psycopg2
from requests import delete

def create_table():
    conn=psycopg2.connect("dbname='mydatabase' user='postgres' password='Jordan.7187' host='localhost' port='5432'")
    cur=conn.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS store (item TEXT, quantity INTEGER, price REAL)")
    conn.commit()
    conn.close()


def insert(item, quantity, price):
    conn=psycopg2.connect("dbname='mydatabase' user='postgres' password='Jordan.7187' host='localhost' port='5432'")
    cur=conn.cursor()
    cur.execute("INSERT INTO store VALUES(%s,%s,%s)",(item,quantity,price))
    conn.commit()
    conn.close()

def view():
    conn=psycopg2.connect("dbname='mydatabase' user='postgres' password='Jordan.7187' host='localhost' port='5432'")
    cur=conn.cursor() 
    cur.execute("SELECT * FROM store")
    rows=cur.fetchall()
    conn.close()
    return rows

def delete(item):
    conn=psycopg2.connect("dbname='mydatabase' user='postgres' password='Jordan.7187' host='localhost' port='5432'")
    cur=conn.cursor() 
    cur.execute("DELETE FROM store WHERE item=%s",(item,))
    conn.commit()
    conn.close()

def update(quantity, price, item):
    conn=psycopg2.connect("dbname='mydatabase' user='postgres' password='Jordan.7187' host='localhost' port='5432'")
    cur=conn.cursor() 
    cur.execute("UPDATE store SET quantity=%s, price=%s WHERE item=%s",(quantity, price, item))
    conn.commit()
    conn.close()

create_table()
insert("Jordan 2 Tee", 15, 24.99)
# update(15, 26.99, "Jordan 1 Tee")
# delete("Jordan 2 Tee")
print(view())

