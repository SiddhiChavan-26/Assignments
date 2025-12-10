import arithmetic
import geometry as geo
from geometry import calc_rect_area

print("Hello world!!")
a = int(input("Enter first number : "))
b = int (input("Enter second number: "))

arithmetic.add(a, b)
arithmetic.subtract(a, b)

length = int(input("Enter length: "))
breadth = int(input("Enter breadth : "))

geo.calc_rect_area(length, breadth)
