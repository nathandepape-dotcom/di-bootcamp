from curses import OK
from tkinter import NO


b = int(input("Enter a number"))
if b % 3 ==0 and b % 5 == 0:
    print("FizzBuzz")
elif b % 3 == 0:
    print("Fizz")
elif b % 5 == 0:
    
    print("Buzz")



