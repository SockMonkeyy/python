import sqlite3



def connect():
    conn=sqlite3.connect("customer.db")
    cur=conn.cursor()
    cur.execute("""CREATE TABLE IF NOT EXISTS customers (
            id INTEGER PRIMARY KEY,
            firstName text,
            lastName text,
            email text,
            phone text
    )""")
    conn.commit()
    conn.close()

    

def insert(firstName, lastName, email, phone):
    conn=sqlite3.connect("customer.db")
    cur=conn.cursor()
    cur.execute("INSERT INTO customers VALUES (NULL,?, ?, ?,?)", (firstName,lastName,email,phone))
    conn.commit()
    conn.close()

def view():
    conn=sqlite3.connect("customer.db")
    cur=conn.cursor()
    cur.execute("SELECT * FROM customers")
    rows=cur.fetchall()
    conn.close()
    return rows

connect()
# delete(5)
insert("Wayne", "Richardson", "wayne@wayne.com", "2055051420")
# print(search(isbn=187))
# update(187, 1986, "Your Mom", "Time to Do work", 2)
print(view())
