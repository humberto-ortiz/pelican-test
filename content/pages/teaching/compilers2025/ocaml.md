title: OCaml practice
date: 2025-01-29
category: Teaching
tags: hacking, learning
slug: teaching/compilers2025/ocaml
status: published

# Practica con ocaml

1. Define una funcion `doble` que multiplique su argumento (int) por dos.

1. En clase vimos que ocaml permite definir o redefinir operadores. En
el [Learn OCaml in Y minutes]() hay un ejemplo de como redefinir el operador de
suma `+`. Defina un operador `+/.` que promedie dos argumentos de punto
flotante que reciba.

1. Defina una funcion que reciba una lista de enteros no vacia, y encuentre el elemento maximo.

1. Podemos definir un tipo para arboles binarios:

El codigo de bintree:
```ocaml
type bintree = Node of int * bintree * bintree | EmptyNode;;
```
Y definimos dos arboles pequeños:
```ocaml
let t1 = Node (3, EmptyNode, EmptyNode);;

let t2 = Node (1, Node (5, EmptyNode, EmptyNode), EmptyNode);;
```
Podemos definir una funcion `sumtree` que reciba un bintree y devuelva la suma de los enteros contenidos en el arbol:
```ocaml
let rec sumtree (tree : bintree) : int =
  (* FIXME - return the sum of all the nodes *)
  0
```
Cuando arreglen `sumtree`, `sumtree t1` debe dar 3, y `sumtree t2` debe dar 6.

Entreguen un archivo con su codigo ocaml en [UPRRP
moodle](https://online.uprrp.edu/).
