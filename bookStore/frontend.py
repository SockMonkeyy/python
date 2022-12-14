from tkinter import *
selected_tuple = None
from requests import get
import backend
 
#Functions
def view_command():
    list1.delete(0, END)
    for row in backend.view():
        list1.insert(END, row)
def search_command():
    list1.delete(0, END)
    for row in backend.search(
     title_text.get().capitalize(),
     year_text.get().capitalize(), 
     author_text.get().capitalize(),
     isbn_text.get().capitalize()):
        list1.insert(END, row)
 
def addCommand():
    backend.insert( 
        title_text.get().capitalize(),
        year_text.get().capitalize(), 
        author_text.get().capitalize(),
        isbn_text.get().capitalize())
    list1.delete(0, END)
    list1.insert(END,(
        title_text.get().capitalize(),
        year_text.get().capitalize(), 
        author_text.get().capitalize(),
        isbn_text.get().capitalize()))



def get_selected_row(event):
    try:
        global selected_tuple
        index=list1.curselection()[0]
        selected_tuple=list1.get(index)
        e1.delete(0,END)
        e1.insert(END,selected_tuple[1])
        e2.delete(0,END)
        e2.insert(END,selected_tuple[2])
        e3.delete(0,END)
        e3.insert(END,selected_tuple[3])
        e4.delete(0,END)
        e4.insert(END,selected_tuple[4])
    except IndexError:
        pass

def deleteCommand():
    backend.delete(selected_tuple[0])


def updateCommand():
    backend.update(selected_tuple[0],
        title_text.get().capitalize(),
        year_text.get().capitalize(), 
        author_text.get().capitalize(),
        isbn_text.get().capitalize())

#---
 
window = Tk()
window.title("BookStore")
window.resizable(False, False)
 
#Labels
l1 = Label(window, text="Title")
l1.grid(row=0, column=0)
 
l2 = Label(window, text="Author")
l2.grid(row=0, column=2)
 
l3 = Label(window, text="Year")
l3.grid(row=1, column=0)
 
l4 = Label(window, text="ISBN")
l4.grid(row=1, column=2)
 
#Entries
title_text = StringVar()
e1 = Entry(window, textvariable=title_text)
e1.grid(row=0, column=1)
 
year_text = StringVar()
e2 = Entry(window, textvariable=year_text)
e2.grid(row=1, column=1)
 
author_text = StringVar()
e3 = Entry(window, textvariable=author_text)
e3.grid(row=0, column=3)
 
isbn_text = StringVar()
e4 = Entry(window, textvariable=isbn_text)
e4.grid(row=1, column=3)
 
#Listbox
list1 = Listbox(window, height=6, width=35)
list1.grid(row=2, column=0, rowspan=6, columnspan=2)
 
list1.bind("<<ListboxSelect>>", get_selected_row)

#Scrollbar
sb1 = Scrollbar(window)
sb1.grid(row=2, column=2, rowspan=6)
 
#Scrollbar and Listbox configuration.
list1.configure(yscrollcommand=sb1.set)
sb1.configure(command=list1.yview)
 
#Buttons
b1 = Button(window, text="View all", width=12, command=view_command)
b1.grid(row=2, column=3)
b2 = Button(window, text="Search entry", width=12, command=search_command)
b2.grid(row=3, column=3)
b3 = Button(window, text="Add entry", width=12, command=addCommand)
b3.grid(row=4, column=3)
b4 = Button(window, text="Update", width=12, command=updateCommand)
b4.grid(row=5, column=3)
b5 = Button(window, text="Delete", width=12, command=deleteCommand)
b5.grid(row=6, column=3)
b6 = Button(window, text="Close", width=12, command=window.destroy)
b6.grid(row=7, column=3)
 
window.mainloop()