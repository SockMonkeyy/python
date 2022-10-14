from cgitb import text
from enum import auto
from tkinter import *
from tkinter.ttk import *


window=Tk()
window.title('KG Converter')



def kmToMiles():
    t1.delete('1.0', END)
    t2.delete('1.0', END)
    t3.delete('1.0', END)
    gr=float(e2Value.get())*1000
    lbs=float(e2Value.get())*2.20462
    oz=float(e2Value.get())*35.274
    t1.insert(END, gr)
    t2.insert(END, lbs)
    t3.insert(END, oz)


#This can be used to create clear field BTNS, but I included in the kmToMiles function 
# def clear_text():
#    t1.delete('1.0', END)
#    e1.delete(0, END)

# b2=Button(window,text="Clear", command=clear_text)
# b2.grid(row=1, column=4)
b1=Button(window, text="Convert", command=kmToMiles, width=20)
b1.grid(row=0, column=6)

# kglbl=Text(window, height=1, width=auto, text="KG")
# kglbl.grid(row=0, column=1)


e1=Label(window,text="Kg")
e1.grid(row=0, column=1)
from asyncio.tasks import _T4
e2=Entry(window, textvariable=e2Value)
e2.grid(row=0, column=2)

t1=Label(window, text="Grams")
t1.grid(row=2, column=1)
t2=Label(window,text="Pounds")
t2.grid(row=2, column=3)
t3=Label(window,text="Ounces")
t3.grid(row=2, column=5)

t1=Text(window, height=1, width=20)
t1.grid(row=2,  column=2)
t2=Text(window, height=1, width=20)
t2.grid(row=2, column=4)
t3=Text(window, height=1, width=20, pady=10)
t3.grid(row=2, column=6)

window.mainloop()