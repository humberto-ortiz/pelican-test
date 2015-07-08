title: CCOM 4995 Systems and Network Security
date: 2015-05-25
category: Teaching
tags: hacking, learning
slug: teaching/cyber2
Status: published

# Draft Syllabus

## Professor

| Field        | Value                              |
| Name         | Humberto Ortiz-Zuazaga             |
| Office       | NCL A-150                          |
| Laboratory   | NCL A-158                          |
| Telephone    | 787-764-0000 x7430                 |
| email        | <mailto:humberto.ortiz@upr.edu>    |
| Web page     | <http://ccom.uprrp.edu/~humberto/> |
| Office hours | Monday, Wednesday 8:00-9:30 AM     |
|              | Tuesday, Thursday 3:30-5:00 PM     |
|              | or by appointment                  |

## Description

In this course, students will learn
secure system and network administration techniques. Students will
have hands-on system administration experiences with key Internet
services, will learn about important security issues related to such
services, and will be exposed to techniques and tools to analyse,
defend and secure systems and networks.

## Pre-requisites

1. CCOM 4088 - Introduction to Cybersecurity
1. One of:

	- CCOM 4086 - Computer Architecture
	- CCOM 4017 - Operating Systems
	- CCOM 4205 - Computer Networks
  
## Content

The course will use material developed for
[MIT's Graduate Computer Systems Security class](http://css.csail.mit.edu/6.858/2014/general.html)
under a
[Creative Commons Attribution license](http://creativecommons.org/licenses/by/3.0/us/). The
original course material describes the content as:

> Lectures cover threat models, attacks that compromise security, and
> techniques for achieving security, based on recent research
> papers. Topics include operating system (OS) security, capabilities,
> information flow control, language security, network protocols,
> hardware security, and security in web applications. Assignments
> include labs that involve implementing and compromising a secure web
> server and web application, and a group final project.

## Objectives

After successfully completing the course students will be able to:

1. Analyze a computer system, identifying one or more potential
security vulnerabilities.
1. Exploit common security vulnerabilities.
1. Understand mitigation techniques implemented in modern computer systems.
1. Implement changes to a computer system to mitigate security risks.
1. Assess the risks in a computer system.

## Course schedule

   Class will meet Tuesday and Thursday from 10:00 to 11:20 AM in NCL
   A-141. In UPR-RP attendance is compulsory.

### Tentative course calendar

| Date   | Topic          | Chapter        | Lecture      | Lab |
|--------|----------------|----------------|--------------|-----|
| Aug 11 | Intro          | 0x100          | Lec 1 [text](http://css.csail.mit.edu/6.858/2014/lec/l01-intro.txt), [video](https://www.youtube.com/watch?v=M2gc6b1hmk8) 
| Aug 13 | Assembly, GDB  | 0x250 - 0x253  |   | [Lab 1](http://css.csail.mit.edu/6.858/2014/labs/lab1.html) (part 1, exercise 1)
| Aug 18 | Stack overflows | 0x300 - 0x321 | Lec 2 [text](http://css.csail.mit.edu/6.858/2014/lec/l02-baggy.txt), [video](https://www.youtube.com/watch?v=ow9BYxNtEjI) (skip baggy bounds) 
| Aug 20 | Stack exploit   | 0x480 - 0x482 |  | [Lab 1](http://css.csail.mit.edu/6.858/2014/labs/lab1.html) (part 1, exercise 2)
| Aug 25 | Shellcode       | 0x500 - 0x530 |   
| Aug 27 | Stack hardening | 0x6a0 - 0x6c1 | Lec 3 [text](http://css.csail.mit.edu/6.858/2014/lec/l03-brop.txt), [video](https://www.youtube.com/watch?v=pDzgwrqWNvY) (skip baggy bounds)  | [Lab 1](http://css.csail.mit.edu/6.858/2014/labs/lab1.html) (part 2, exercise 3) 
| Sep 1  | BROP Attack     | [BROP Paper](http://css.csail.mit.edu/6.858/2014/readings/brop.pdf)
| Sep 3  | Privilege separation | 0x280 - 0x283 | Lec 4 [text](http://css.csail.mit.edu/6.858/2014/lec/l04-okws.txt), [video](https://www.youtube.com/watch?v=XnBJc3-N2BU)  | [Lab 2](http://css.csail.mit.edu/6.858/2014/labs/lab2.html) (exercise 1, 2, 3)
| Sep 8  | Sandboxing |   | 
| Sep 10 | Web security | [OWASP slides](http://css.csail.mit.edu/6.858/2014/readings/owasp-top-10.pdf) | Lec 8 [text](http://css.csail.mit.edu/6.858/2014/lec/l08-web-security.txt), [video](https://www.youtube.com/watch?v=_1C62Twf0vs) |  [Lab 2](http://css.csail.mit.edu/6.858/2014/labs/lab2.html) (exercise 9, 10, 11) |
| Sep 15 | Securing web services | [Security in Django](http://www.djangobook.com/en/2.0/chapter20.html) | Lec 9 [text](http://css.csail.mit.edu/6.858/2014/lec/l09-web-defenses.txt), [video](https://www.youtube.com/watch?v=6HhmIlbE0l0)
| Sep 17 | Ur/Web | [Ur/Web paper](http://css.csail.mit.edu/6.858/2014/readings/urweb.pdf) | Lec 11 [video](https://www.youtube.com/watch?v=CtnpmsadTVw) | [Lab 4](http://css.csail.mit.edu/6.858/2014/labs/lab4.html) 
| Sep 22 | Networking | 0x430 - 0x475 | Lec 12 [text](http://css.csail.mit.edu/6.858/2014/lec/l12-tcpip.txt), [video](https://www.youtube.com/watch?v=3lDUGRqZmXA)
| Sep 24 | HTTPS | 0x741 | Lec 14 [text](http://css.csail.mit.edu/6.858/2014/lec/l14-forcehttps.txt), [video](https://www.youtube.com/watch?v=gcttL6jGSN4) | [Lab 5](http://css.csail.mit.edu/6.858/2014/labs/lab5.html)
| Sep 29 | Exam 1 |
| Oct 1  | Side channel attacks | [paper](http://css.csail.mit.edu/6.858/2014/readings/brumley-timing.pdf) | Lec 16 [text](http://css.csail.mit.edu/6.858/2014/lec/l16-timing-attacks.txt), [video](https://www.youtube.com/watch?v=AZkDGaISXq8) | [Lab 7](http://css.csail.mit.edu/6.858/2014/labs/lab7.html) (project)
| Oct 6  | Passwords | 0x760 - 0x764 | Lec 17 [text](http://css.csail.mit.edu/6.858/2014/lec/l17-authentication.txt), [video](https://www.youtube.com/watch?v=M1wHbeY7gTc)
| Oct 8  | Private browsing | [paper](http://css.csail.mit.edu/6.858/2014/readings/private-browsing.pdf) | Lec 18 [text](http://css.csail.mit.edu/6.858/2014/lec/l18-priv-browsing.txt), [video](https://www.youtube.com/watch?v=WE4rfpKJyN0)
| Oct 13 | Tor | [paper](http://css.csail.mit.edu/6.858/2014/readings/tor-design.pdf) | Lec 19 [videp](https://www.youtube.com/watch?v=rIf_VZQr-dw)
| Oct 15 | Android security | [paper](http://css.csail.mit.edu/6.858/2014/readings/android.pdf) | Lec 20 [text](http://css.csail.mit.edu/6.858/2014/lec/l20-android.txt), [video](https://www.youtube.com/watch?v=K7NhUlKrbEM)
| Oct 20 | TaintDroid | [paper](http://css.csail.mit.edu/6.858/2014/readings/taintdroid.pdf) | Lec 21 [text](http://css.csail.mit.edu/6.858/2014/lec/l21-taintdroid.txt), [video](https://www.youtube.com/watch?v=sAhWjSPaQp4)
| Oct 22 | Medical devices | [paper](http://css.csail.mit.edu/6.858/2014/readings/medical-sw.pdf) | Lec 15 [video](https://www.youtube.com/watch?v=gk5qzjO69VQ)
| Oct 27 | Tahoe filesystem | [paper](https://eprint.iacr.org/2012/524.pdf)
| Oct 29 | Bitcoin | [paper](https://bitcoin.org/bitcoin.pdf)
| Nov 3  | Twister | [paper](http://arxiv.org/pdf/1312.7152v1.pdf)
| Nov 5  | IPSEC | [paper](https://www.schneier.com/paper-ipsec.pdf)
| Nov 10 | DNSSEC | [paper](https://eprint.iacr.org/2010/115.pdf)
| Nov 12 | Secure Multiparty Computation | [paper](http://arxiv.org/pdf/1506.03471v1.pdf)
| Nov 17 | Zero Knowledge Authentication | [paper](http://www.austinmohr.com/work/files/zkp.pdf)
| Nov 19 | Holiday  | Descubrimiento de PR
| Nov 24 | Holiday  | Thanksgiving
| Nov 26 | Holiday  | Thanksgiving
| Dec 1  | Project presentations
| Dec 3  | Project presentations

## Instructional resources

The course will be hosted on the <a
href="http://moodle.ccom.uprrp.edu/">CCOM Moodle</a>. Register and
stay tuned for our polls and forum postings.

The course will use material developed for
[MIT's Graduate Computer Systems Security class](http://css.csail.mit.edu/6.858/2014/general.html)
which has lecture notes, videos, lab assignments and quizzes online,
as well as links to reference material.

## Textbook

We will mostly use the
[MIT course materials](http://css.csail.mit.edu/6.858/2014/general.html).

We will also use the
book. [Hacking: the Art of Exploitation, 2nd Edition](http://www.nostarch.com/hacking2.htm). Jon
Erickson. No Startch Press. 2008.

## Software

MIT's [Lab 1](http://css.csail.mit.edu/6.858/2014/labs/lab1.html)
provides a
[virtual machine image](http://pdos.csail.mit.edu/~kolya/vm-6858.zip)
you will use for the lab assignments. I have tested the image on
VirtualBox (OS X and linux) and kvm (on linux). Other students have
had trouble with the `gdb` command on OS X. MIT recommends running in
VMWare player or kvm.

## Evaluation

Students work will be evaluated on a 100% basis with the standard curve.

 -        Participation in course forums (online, classroom), 5% final grade
 -        Homework and quizzes, 25% final grade
 -        Two partial exams, 50% final grade
 -        Project, 20% final grade


## Reasonable accomodations for students

Students with disabilities properly registered with the Office of
Affairs for Persons with Disabilities <a
href="http://estudiantes.uprrp.edu/impedimentos/impedimentos.php">Oficina
de Asuntos para la Persona con Impedimento (O.A.P.I.)</a> should
notify the professor at the start of the semester. The professor will
make reasonable accommodations to support the student, in consultation
with OAPI.

## Academic integrity

> The University of Puerto Rico promotes the highest standards of
> academic and scientific integrity. Article 6.2 of the UPR Student
> Bylaws (Certification JS 13 2009–2010) states that “academic
> dishonesty includes but is not limited to: fraudulent actions,
> obtaining grades or academic degrees using false or fraudulent
> simulations, copying totally or partially academic work from another
> person, plagiarizing totally or partially the work of another
> person, copying totally or partially responses from another person
> to examination questions, making another person to take any test,
> oral or written examination on his/hers behalf, as well as assisting
> or facilitating any person to incur in the aforementioned
> conduct”. Fraudulent conduct refers to “behavior with the intent to
> defraud, including but not limited to, malicious alteration or
> falsification of grades, records, identification cards or other
> official documents of the UPR or any other institution.” Any of
> these actions shall be subject to disciplinary sanctions in
> accordance with the disciplinary procedure, as stated in the
> existing UPR Student Bylaws.

DISCLAIMER: The above statement is an English translation, prepared at
the Deanship of Academic Affairs of the Medical Sciences Campus, of
certain parts of Article 6.2 of the UPR Student Bylaws “Reglamento
General de Estudiantes de la Universidad de Puerto Rico”,
(Certificación JS 13 2009-2010). It is in no way intended to be a
legal substitute for the original document, written in Spanish.
