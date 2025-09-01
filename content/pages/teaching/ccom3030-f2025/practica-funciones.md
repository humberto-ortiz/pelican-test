Title: Practica funciones
Slug: teaching/ccom3030-f2025/practica-funciones

## Assignment

1) In class we wrote a function to convert temperature in degrees
Fahrenheit to Celcius, using the formula: $C = \frac{5}{9} (F - 32)$.

```
fun f2c(f):
  doc: "Convierte grados Fahrenheit a Celsius"
  5/9 * (f - 32)
where:
  f2c(32) is 0
  f2c(212) is 100
end
```

Write a function c2f which does the inverse, converting degrees
Celcius to Fahrenheit. $F = \frac{9}{5} C + 32$. Remember to write
tests and documentation.

2) Pyret has functions to return the maximum or minimum number of a
pair of arguments (see [Number
Functions](https://pyret.org/docs/latest/numbers.html#%28part._.Number_.Functions%29)
in the pyret manual). Write a function to find the smallest element of
three numbers passed to the function. `num-mid(a, b, c)` should return
the smallest of a, b, or c argument.

HINT: use function composition

3) In class we used [Image functions](https://pyret.org/docs/latest/image.html) to draw flags for Armenia and
Austria. In Natural Sciences we have a set of columns painted with
many flags. Pick one of these flags and write a function to draw it.

![Photo of walkway with columns painted as different flags: Lares and different colors of puertorican flag.]({static}/images/banderas.jpg)

Here's the program for Armenia and Austria.

```

# banderas-tres-rayas - crear imagenes de banderas de tres colores (Armenia, Austria, ...)
# Copyright 2025 Humberto Ortiz-Zuazaga

#      This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>. 

ancho = 300
largo = 1.5 * ancho


fun bandera-tres-rayitas(arriba, medio, abajo):
  doc: "Crear una bandera de tres colores con los colores indicados arriba, en medio y abajo"
  above(rectangle(largo, ancho / 3, "solid", arriba), 
    above(rectangle(largo, ancho / 3, "solid", medio),
      rectangle(largo ,ancho / 3, "solid", abajo)))
end

armenia = bandera-tres-rayitas("red","blue","dark-orange")

austria = bandera-tres-rayitas("red","white","red")

armenia
austria
```
