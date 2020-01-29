Title: CCOM 4087 - Compiler Design - Spring 2020
date: 2019-12-25
category: Teaching
tags: hacking, learning
slug: teaching/compilers2020

<h3>
University of Puerto Rico<br>
Rio Piedras Campus<br>
College of Natural Sciences<br>
Department of Computer Science<br>
</h3>

## Professor

| Field        | Value                               |
|--------------|-------------------------------------|
| Name         | Humberto Ortiz-Zuazaga              |
| Office       | NCL A-159                           |
| Laboratory   | NCL A-158                           |
| Telephone    | 787-764-0000 x88363                 |
| email        | <mailto:humberto.ortiz@upr.edu>     |
| Web page     | <https://ccom.uprrp.edu/~humberto/> |
| Office hours | Monday, Wednesday 10:00 AM - 12:00 PM    |
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

Class will meet Tuesday and Thursday from 10:00 to 11:20 AM in NCL
A-143. In UPR-RP attendance is compulsory.

## Calendar

Rio Piedras [delayed the start of classes until January 27,
2020](http://www.uprrp.edu/2020/01/informe-de-situacion-actual-del-recinto-de-rio-piedras-luego-de-los-recientes-sismos/)
due to the [earthquakes](https://ccom.uprrp.edu/~humberto/temblores/).

| Date           | Topic                       | Reading                                                                                                                                                                | Assignment                                      |
|----------------|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| Jan 28-30      | Introduction to OCaml       | [Learn OCaml in Y minutes](https://learnxinyminutes.com/docs/ocaml/)                                                                                                   |                                                 |
| Feb 4          | Introduction                | [Lecture 1](https://course.ccs.neu.edu/cs4410sp19/lec_intro_notes.html)                                                                                                | [depython]({filename}compilers2020/depython.md) |
| Feb 6          | Toy compiler                | [Lecture 2](https://course.ccs.neu.edu/cs4410sp19/lec_neonate_notes.html)                                                                                              |                                                 |
| Feb 11-13      | Lexing and Parsing          | [Real World OCaml Parsing](http://dev.realworldocaml.org/parsing-with-ocamllex-and-menhir.html)                                                                        | parser                                          |
| Feb 18-20      | "variables" and stacks      | [Lecture 3](https://course.ccs.neu.edu/cs4410sp19/lec_let-and-stack_notes.html)                                                                                        | let compiler                                    |
| Feb 25-27      | Conditional expressions     | [Lecture 4](https://course.ccs.neu.edu/cs4410sp19/lec_anf_notes.html)                                                                                                  | if compiler                                     |
| Mar 3-5        | Types                       | [Lecture 5](https://course.ccs.neu.edu/cs4410sp19/lec_tagging-values_notes.html)                                                                                       |                                                 |
| Mar 10-12      | Function calls              | [Lecture 6](https://course.ccs.neu.edu/cs4410sp19/lec_function-calls_notes.html)                                                                                       |                                                 |
| Mar 17-19      | Function definitions        | [Lecture 7](https://course.ccs.neu.edu/cs4410sp19/lec_function-defs_notes.html)                                                                                        | function compiler                               |
| Mar 24-26      | Type checking and inference | [Lecture 10](https://course.ccs.neu.edu/cs4410sp19/lec_type-checking_notes.html) and [Lecture 11](https://course.ccs.neu.edu/cs4410sp19/lec_type-inference_notes.html) |                                                 |
| Mar 31 - Apr 2 | Pairs and the heap          | [Lecture 12](https://course.ccs.neu.edu/cs4410sp19/lec_tuples_notes.html)                                                                                              |                                                 |
| Apr 7          | Mutable tuples              | [Lecture 13](https://course.ccs.neu.edu/cs4410sp19/lec_mutable-tuples_notes.html)                                                                                      |                                                 |
| Apr 9-11       | Spring break                |                                                                                                                                                                        |                                                 |
| Apr 14-16      | First class functions       | [Lecture 14](https://course.ccs.neu.edu/cs4410sp19/lec_lambdas_notes.html)                                                                                             |                                                 |
| Apr 21-23      | Objects                     | [Lecture 15](https://course.ccs.neu.edu/cs4410sp19/lec_objects_notes.html)                                                                                             |                                                 |
| Apr 28-30      | Optimization                |                                                                                                                                                                        |                                                 |
| May            | Advanced topics             |                                                                                                                                                                        |                                                 |
 
### Alternative Teaching Methods

Certification No. 112 (2014-2015) of the Governing Board defines a
classroom course as a course in which 75% or more of the hours of
instruction require the physical presence of the students and the
teacher in the classroom.  This means that 25% of a classroom course
could be offered without requiring the physical presence of the
students and the teacher in the classroom.  If necessary, this course
will be able to complete up to 25% of the contact hours (11.25 hours)
on a non-face-to-face basis by alternative methods such as:
videoconferences, instructional modules, discussion forums and
others. If so, the calendar/agenda will be modified to include the
topics that will be covered by alternative methods.

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
[Ben Lerner's Spring 2019 Compiler lecture notes](https://course.ccs.neu.edu/cs4410sp19/#%28part._lectures%29).

Students with no functional programming experience will probably need
an additional text on OCaml.  I can suggest the free textbook by
Jason Hickey 
[Introduction to Objective Caml](http://courses.cms.caltech.edu/cs134/cs134b/book.pdf).
Or the textbook by Michael R. Clarkson
[Functional Programming in OCaml](https://www.cs.cornell.edu/courses/cs3110/2019fa/textbook/).

## Software

We will be writing our compiler in the functional programming language
[Objective Caml](https://ocaml.org/). See the website for instructions to download ocaml and opam.

## Evaluation

Students work will be evaluated on a 100% basis with the standard curve.

-        Participation in course forums (online, classroom), 25% final grade
-        Homework, 25% final grade
-        Quizzes, 25% final grade
-        Compiler project, 25% final grade


## Reasonable accomodations for students

Students with disabilities properly registered with the
Office of Services for Students with Disabilities,
[Oficina de Servicios a Estudiantes con Impedimentos (OSEI)](http://estudiantes.uprrp.edu/servicios-al-estudiante/oapi/),
should notify the professor at the start of the semester. The
professor will make reasonable accommodations to support the student,
in consultation with OSEI.

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

## Policy on sexual discrimination or harassment

The University of Puerto Rico prohibits discrimination based on sex,
sexual orientation, and gender identity in any of its forms, including
that of sexual harassment. According to the Institutional Policy
Against Sexual Harassment at the University of Puerto Rico,
Certification Num. 130, 2014-2015 from the Board of Governors, any
student subjected to acts constituting sexual harassment, may turn to
the Office of the Student Ombudsperson, the Office of the Dean of
Students, and/or the Coordinator of the Office of Compliance with
Title IX for an orientation and/or a formal complaint.

## References

1. Andrew W. Appel. (1998) [Modern Compiler Implementation in
ML](http://www.cs.princeton.edu/~appel/modern/ml/). Cambridge
University Press. ISBN 0-521-60764-7.

1. Fischer, C. N., Cytron, R. K., & LeBlanc, R. J. (2009). Crafting a
compiler. Addison-Wesley Publishing Company. ISBN 0136067050
9780136067054
