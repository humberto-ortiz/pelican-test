title: Warmup - OCaml practice
date: 2021-01-21
category: Teaching
tags: hacking, learning
slug: teaching/compilers2021/warmup

# OCaml warmup

Let's practice some OCaml.

In class I defined adata type for points on a 2D plane:
```ocaml
type point2d = Point of float * float;;
let origin = Point (0.0, 0.0);;
```
Problem 1
: Write a function `point_distance` that takes two points, and computes their
   distance. HINT: hypotenuse.

I also defined a binary tree type and example:
```ocaml
type binarytree = EmptyTree | TreeNode of int * binarytree * binarytree ;;
let arbolito = TreeNode (3, EmptyTree, EmptyTree);;
```

Problem 2
: Write a recursive function `tree_depth` to compute the depth of a binary tree.
   The depth of an empty tree should be 0. The depth of our `arbolito` should be
   1, and in general, the depth of a tree is one greater than the maximum depth
   of the children.
      
For both functions, use pattern matching to name sub-parts of the arguments, and
operate on the sub-parts.

You should turn in the code as a single file in the [UPRRP
moodle](https://online.uprrp.edu/).
