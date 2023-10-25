# Lineāras vienādojumu sistēmas<br>un funkciju aproksimācija

<p class="text-center">Einārs Lielmanis, RTU CECA0</p>

<p class="text-center">Risinājumi veikti ar GNU Octave 8.3.</p>


## 1a. Atrisināt vienādojumu sistēmu Ax=B

```
A = [10 -4 5; 3 -2 7; 1 6 -2]
x = [x1 x2 x3]
B = [7; 5; 3]
```

#include src/01a.m

## 1b-a. Atrisināt sistēmu

```
  /
  |  x      - z +  t =  3
 <  2x + 3y - z      =  4
  | 5x          - 3t = -6
  |  x +  y + z +  t =  2
  \
```

#include src/01ba.m


## 1b-b. Atrisināt sistēmu

```
  /
 | 2x -  y +  z =  9
<   x - 2y + 3z = 10
 | 3x - 3y + 4z =  5
  \
```

#include src/01bb.m

## 2. Atrast vienādojuma saknes intervālā [-1; 4]

sqrt(3) * sin(1.7 x) * log(4.6 - x) = 0

Ziņkārības pēc, apskatīsim grafiku:

#plot src/02-plot.m

Uz aci izskatās, ka saknes ir trīs (kaut iespējams, ap 3.6 ir divas, ja kūkums šķērso y asi, nevis tai tikai pieskaras).

Izmantosim `symbolic` paciņu, lai atrisinātu šo vienādojumu pa īstam.

#include src/02-solve.m

Nē, atbildes ir tikai trīs: X = 0, X = 1.848 un X = 3.6.

## 3. Aprēķināt ar vidējo taisnstūru metodi noteikto integrāli

2\. variants:

f(x) = sin(x + sqrt(x)) 

a = 0, b = 12

#include src/03-solve-quad.m

Secināms, ka taisnstūru metode ir ciešama aproksimācija — ar šī nelielā intervāla dalīšanu 50 daļās, kļūda ir zem 1%, tomēr sešu daļu dalīšana neder pavisam nekam.

Ideja: uzzīmēt grafiku ar sešiem taisnstūrīšiem virsū, lai redzētu, cik tas baisi izskatās?

## 3. Simpsona metode

#include src/03-solve-simpson.m

Simpsona metodei nav ne vainas: ar vien divdesmit dalījumiem, kļūda ir <1%. 

Nav parādīts kodā, bet ar n=100, kļūda ir <0.1%.

## 4. Figūras laukuma aprēķins

Figūras laukumu dalīsim divās daļās. Kreiso kārtu izteiksim kā trešās pakāpes polinomu,

Kreisā daļa:

#plot+ src/04-approx-left.m

Labā daļa:

#plot+ src/04-approx-right.m

Gala aprēķins un ilustrācija:

#plot+ src/04-total.m

---

<p class="text-center"><a href="https://github.com/einars/matlab-01">github.com/einars/matlab-01</a></p>
