import sqlite3
 
 
 
def connect():
 
    conn=sqlite3.connect("books.db")
 
    cur=conn.cursor()
 
    cur.execute("CREATE TABLE IF NOT EXISTS book (id INTEGER PRIMARY KEY, title text, author text, year integer, isbn integer)")
 
    conn.commit()
 
    conn.close()
 
 
 
def insert(title,year,author,isbn):
 
    conn=sqlite3.connect("books.db")
 
    cur=conn.cursor()
 
    cur.execute("INSERT INTO book VALUES (NULL,?,?,?,?)", (title,year,author,isbn))
 
    conn.commit()
 
    conn.close()
 
 
 
def view():
 
    conn=sqlite3.connect("books.db")
 
    cur=conn.cursor()
 
    cur.execute("SELECT * FROM book")
 
    rows=cur.fetchall()
 
    conn.close()
 
    return rows
 
 
 
 
 
 
def search(title="",author="",year="",isbn=""):
 
    conn=sqlite3.connect("books.db")
 
    cur=conn.cursor()
 
    cur.execute("SELECT * FROM book WHERE title=? OR author=? OR year=? OR isbn=?",(title,author,year,isbn))
 
    rows=cur.fetchall()
 
    conn.close()
 
    return rows
 
 
 
def delete(id):
 
    conn=sqlite3.connect("books.db")
 
    cur=conn.cursor()
 
    cur.execute("DELETE FROM book WHERE id=?",(id,))
 
    conn.commit()
 
    conn.close()
 
 
 
def update(id,title,author,year,isbn):
 
    conn=sqlite3.connect("books.db")
 
    cur=conn.cursor()
 
    cur.execute("UPDATE book SET title=?, author=?, year=?, isbn=? WHERE id=?",(title,author,year,isbn,id))
 
    conn.commit()
 
    conn.close()
 
 
 
    connect()
 
# insert("cr7", "bobby", 1990, 9999999)
 
# delete(11)
 
#update(2,"the moon","mr moon",2020,999999)
 
# print(view())
 
#print(search(author="mr moon")) 