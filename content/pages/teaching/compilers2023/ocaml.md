title: OCaml practice
date: 2023-02-03
category: Teaching
tags: hacking, learning
slug: teaching/compilers2023/ocaml
status: published

# Practica con ocaml

1. Define una funcion `doble` que multiplique su argumento (int) por dos.

1. En clase vimos que ocaml permite definir o redefinir operadores. En
el [Learn OCaml in Y minutes]() vimos como redefinir el operador de
suma `+`. Defina un operador `+/.` que promedie dos argumentos de punto
flotante que reciba.

1. Defina una funcion que reciba una lista de enteros, y sume los elementos.

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
Podemos definir una funcion `maxtree` que reciba un bintree y devuelva el mayor de los enteros contenidos en el arbol:
```ocaml
let rec maxtree (tree : bintree) : int =
  (* FIXME - return the max of the nodes *)
  0
```
Cuando arreglen `maxtree`, `maxtree t1` debe dar 3, y `maxtree t2` debe dar 5.

**HINT:** a veces es mas facil hacer estos problemas definiendo un "helper", una funcion interna que puede recibir un parametro adicional que represente el maximo que se ha visto hasta ahora. 

Entreguen un archivo con su codigo ocaml en [UPRRP
moodle](https://online.uprrp.edu/).
