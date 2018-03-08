Title: CCOM 4087 - Compiler Design - Spring 2018
date: 2018-1-31
category: Teaching
tags: hacking, learning
slug: teaching/compilers2018

<h3>
University of Puerto Rico<br>
Rio Piedras Campus<br>
College of Natural Sciences<br>
Department of Computer Science<br>
</h3>

## Professor

| Field            | Value                                           |
|----------|---------------------------|
| Name         | Humberto Ortiz-Zuazaga              |
| Office       | NCL A-159                           |
| Laboratory   | NCL A-158                           |
| Telephone    | 787-764-0000 x88363                 |
| email        | <mailto:humberto.ortiz@upr.edu>     |
| Web page     | <https://ccom.uprrp.edu/~humberto/> |
| Office hours | Tuesday, Thursday 8:00-9:30 AM      |
|              | or by appointment                   |

## Credits

3 credits

## Description

Introduction to compiling, structure of simple one-step compilers:
syntax and lexical analysis, parsing, introduction to type checking,
intermediate code generation, introduction to code generation and
optimization. Discussion about tools for compilers design (e.g. Lex
and Yacc).

## Pre-requisites

- High Level Programming Languages (CCOM 4029)
- Computer Architecture (CCOM 4086)
- Operating Systems (CCOM 4017)

## Content

- Introduction to compiling

- Simple one pass compilers

- Lexical analysis

- Symbol tables

- Parsing

- Syntax directed translation

- Introduction to type checking and run time environment

- Intermediate code generation

- Introduction to code generation and code optimization

- Discussion of tools in compiler design

## Objectives

1. Understand how the design of a compiler requires most of the
   knowledge acquired during their study

1. Develop a firm and enlightened grasp of concepts learned earlier in
   their study like higher level programming, assemblers, automata
   theory, and formal languages, languages, languages specifications,
   data structure and algorithms, operating systems and computer
   architecture.

1. Develop an in–depth knowledge of major topics in compiler design.

1. Develop a fundamental understanding of various stages of compiling.

1. Apply the ideas, the techniques, and the knowledge acquired for the
   purpose of other software design

1. Develop fundamental knowledge of language specifications using
   context free grammars (CFG).

## Course Schedule

Class will meet Mondays and Wednesdays from 9:00 to 11:40 AM in NCL
A-141. In UPR-RP attendance is compulsory.

## Calendar

| Date   | Topic        | Reading | Assignment  |
|--------|--------------|---------|-------------|
| Mar 12 | Introduction | Ch 1    | depython |
| Mar 19  | Lexical Analysis | Ch 2| [lexer]({filename}compilers2017/lexer.md) |
| Mar 26 | Parsing | Ch 3 |[subset]({filename}compilers2017/subset.md) |
| Apr 2 | Abstract Syntax Trees | Ch 4 | [ast]({filename}compilers2017/ast.md) |
| Apr 9 | Semantic Analysis | Ch 5 | [semantic]({filename}compilers2017/semantic.md) |
| Apr 16 | Stack frames | Ch 6 | |
| Apr 23 | Intermediate Code | Ch 7 | intermediate |
| Apr 30 | Basic Blocks and Traces | Ch 8 | |
| May 7 | Instruction Generation | Ch 9 | [instructions]({filename}compilers2017/instr.md) |
| May 14 | Liveness Analysis | Ch 10 | |
| May 21 | Register Allocation | Ch 11 | |
| May 28 | Final Form | Ch 12 | | 

## Instructional strategies

The professor will discuss each topic, students will complete a
practical excercise for each compiler technique discussed in
class.

## Instructional resources

The course will be hosted on the
[UPRRP Moodle](https://online.uprrp.edu/). Register and stay tuned for
our polls and forum postings.

## Textbook

The text for the course will be
[Modern Compiler Implementation in ML](http://www.cs.princeton.edu/~appel/modern/ml/)
by Andrew Appel. ISBN 0-521-60764-7

Students with no functional programming experience will probably need
an additional text on Standard ML.  I can suggest the free textbook by
Robert Harper of CMU
[Programming in Standard ML](http://www.cs.cmu.edu/~rwh/isml/book.pdf), or
the books ML for the Working Programmer
<http://www.cl.cam.ac.uk/~lp15/MLbook/> or Elements of ML Programming
<http://infolab.stanford.edu/~ullman/emlp.html>.

## Software

We will be writing our compiler in the functional programming language
[Standard ML](http://sml-family.org/). Several implementations are
available, I recommend
[Standard ML of New Jersey](http://www.smlnj.org/).  Check your
package manager, or download the newest version.

## Evaluation

Students work will be evaluated on a 100% basis with the standard curve.

-        Participation in course forums (online, classroom), 5% final grade
-        Homework, 25% final grade
-        Two partial exams, 50% final grade
-        Compiler project, 20% final grade


## Reasonable accomodations for students

Students with disabilities properly registered with the Office of
Affairs for Persons with Disabilities
[Oficina de Asuntos para la Persona con Impedimento (O.A.P.I.)](http://estudiantes.uprrp.edu/impedimentos/impedimentos.php)
should notify the professor at the start of the semester. The
professor will make reasonable accommodations to support the student,
in consultation with OAPI.

## Academic integrity

>    The University of Puerto Rico promotes the highest standards of
>    academic and scientific integrity. Article 6.2 of the UPR Student
>    Bylaws (Certification JS 13 2009–2010) states that “academic
>    dishonesty includes but is not limited to: fraudulent actions,
>    obtaining grades or academic degrees using false or fraudulent
>    simulations, copying totally or partially academic work from
>    another person, plagiarizing totally or partially the work of
>    another person, copying totally or partially responses from
>    another person to examination questions, making another person to
>    take any test, oral or written examination on his/hers behalf, as
>    well as assisting or facilitating any person to incur in the
>    aforementioned conduct”. Fraudulent conduct refers to “behavior
>    with the intent to defraud, including but not limited to,
>    malicious alteration or falsification of grades, records,
>    identification cards or other official documents of the UPR or
>    any other institution.” Any of these actions shall be subject to
>    disciplinary sanctions in accordance with the disciplinary
>    procedure, as stated in the existing UPR Student Bylaws.

DISCLAIMER: The above statement is an English translation, prepared at
the Deanship of Academic Affairs of the Medical Sciences Campus, of
certain parts of Article 6.2 of the UPR Student Bylaws “Reglamento
General de Estudiantes de la Universidad de Puerto Rico”,
(Certificación JS 13 2009-2010). It is in no way intended to be a
legal substitute for the original document, written in Spanish.

## References

1. Andrew W. Appel. (1998) [Modern Compiler Implementation in
ML](http://www.cs.princeton.edu/~appel/modern/ml/). Cambridge
University Press. ISBN 0-521-60764-7.

1. Robert Harper. (2013) [Programming in Standard
ML](http://www.cs.cmu.edu/~rwh/isml/book.pdf). Carnegie
Mellon University.

1. L.C. Paulson (1996) ML for the Working Programmer, 2nd Edition.
Cambridge University Press. ISBN 052156543X

1. Ullman, J. D. (1994). Elements of ML programming. Prentice-Hall, Inc..
ISBN 0-13-184854-2

1. Fischer, C. N., Cytron, R. K., & LeBlanc, R. J. (2009). Crafting a
compiler. Addison-Wesley Publishing Company. ISBN 0136067050
9780136067054
