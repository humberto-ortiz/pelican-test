title: Warmup - OCaml practice
date: 2021-02-03
category: Teaching
tags: hacking, learning
slug: teaching/compilers2022/warmup

# OCaml warmup
En clase definimos un tipo para arboles binarios:

El codigo de bintree:

```ocaml
type bintree = Node of int * bintree * bintree | EmptyNode;;
```
Y definimos dos arboles pequeños:

```ocaml
let t1 = Node (3, EmptyNode, EmptyNode);;

let t2 = Node (1, Node (5, EmptyNode, EmptyNode), EmptyNode);;
```

Podemos definir una funcion sumtree que reciba un bintree y devuelva la suma de los enteros contenidos en el arbol:

```ocaml
let rec sumtree (tree : bintree) : int =
  (* FIXME - return the sum of the nodes *)
  0
```

Cuando arreglen sumtree, sumtree de t1 debe dar 3, y sumtree t2 debe dar 6. 

Entreguen un archivo con su codigo ocaml en [UPRRP
moodle](https://online.uprrp.edu/).
