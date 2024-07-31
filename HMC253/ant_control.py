from machine import Pin

p2 = Pin(19, Pin.OUT)
p1 = Pin(18, Pin.OUT)
p0 = Pin(5, Pin.OUT)

def set_ant(num, verbose=True):
    num -= 1
    
    if(verbose):
        print(num % 2)
    p0.value(num % 2)
    
    if(verbose):
        print(int(num /2) %2)
    p1.value(int(num /2) %2)
    
    if(verbose):
        print(int(num /4) %2)
    p2.value(int(num /4) %2)
    
    