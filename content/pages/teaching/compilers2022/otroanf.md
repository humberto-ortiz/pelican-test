title: Otro ANF
date: 2022-03-22
category: Teaching
tags: hacking, learning
slug: teaching/compilers2022/otroanf

# A(dministrative?)-Normal Form

En [Lecture 4](https://course.ccs.neu.edu/cs4410/lec_anf_notes.html), Ben Lerner
definió ANF y dio varios ejemplos de como convertir expresiones a ANF.

En clase discutimos alternativas a la funcion anf de Dr. Lerner, en particular
que podiamos crear un nuevo tipo para no confundir expresiones con expresiones
en ANF. Joe Gibbs presenta [una version de ANF que usa unos nuevos
tipos](https://www.cs.swarthmore.edu/~jpolitz/cs75/s16/n_anf-tutorial.html),
pero me parece un poco complicada. Voy a tratar de hacer una mas sencilla.

Sabemos que queremos distinguir expresiones immediatas de las demas, asi que podemos definir un tipo.

```ocaml
type immexpr =
  | ImmNum of int64
  | ImmId of string
```

Ahora podemos definir otro tipo `aexp` de expresiones en ANF. A diferencia de las `expr`, las `aexpr` solo pueden construir expresiones en ANF.

```ocaml
type aexpr =
  | AImm of immexpr
  | AAdd1 of immexpr
  | ASub1 of immexpr
  | APrim2 of prim2 * immexpr * immexpr
  | AIf of immexpr * aexpr * aexpr
  | ALet of string * aexpr * aexpr
```

La funcion anf debe entoces recibir un `expr` y producir un `aexpr`. Vamos a llamar esta `anfv2`.

```ocaml
let rec anfv2 (e : expr) : aexpr =
    match e with
    | Num n -> AImm (ImmNum n)
    | Id v -> AImm (ImmId v)
```

Como `AAdd1` tiene que recibir un immediato, y `Add1` puede contener cualquier `expr`, debemos definir una variable para contener la expresion:

```ocaml
    | Add1 e ->
       let tempnam = gensym "_add1" in
       ALet (tempnam, anfv2 e, AAdd1 (ImmId tempnam))
```

Fijense, ahora no podemos construir un `AAdd1 (anfv2 e)`, ya que esto da un error, el tipo que devuelve anfv2 no es un `immexpr`.

El compilador tiene que cambiar, el nuevo compilador va a recibir un `aexpr` y producir la lista de instrucciones:

```ocaml
let rec compile_aexpr (e : aexpr) (env : env) : instruction list =
  let imm_to_arg (e : immexpr) : arg =
    match e with
    | ImmNum n -> Constant n
    | ImmId x -> RegOffset (RSP, lookup x env)
  in
  match e with
```

Cuando sabemos que tenemos un `immexpr` se simplifica la compilacion

```ocaml
  | AImm imm ->     [ IMov (Reg RAX, imm_to_arg imm) ]
  | AAdd1 imm -> [IMov (Reg RAX, (imm_to_arg imm)); 
                IAdd (Reg RAX, Constant 1L)]
```
