Title: Haciendo nuestra propia MV
date: 2023-08-29
category: Teaching
tags: hacking, learning
slug: teaching/cyber2-2023/ubuntu

## Haciendo nuestra propia maquina virtual (VM)

Si estan en una Mac M1/M2 o Surface, pueden tratar de correr una maquina virtual en azure o amazon. Ambos tienen maquinas virtuales gratuitas (free tier).

Si quieren intentar, hagan la maquina virtual mas pequena que puedan (`t2.micro` en Amazon, o `B1s` en azure) e instalen ubuntu 22.04 LTS.

En su maquina virtual, pueden instalar los siguientes paquetes para poder trabajar con el lab:

```{shell}
sudo apt update
sudo apt upgrade
sudo apt install build-essential
sudo apt install python3-flask
sudo apt install python3-sqlalchemy
git clone https://github.com/mit-pdos/6.5660-lab-2023 lab
cd lab
make
./clean-env.sh ./zookd 8080
```

El servidor `zookd` se va a quejar que el path no es el correcto. Luego pueden anadir un usuario `student` para que deje de dar el error.
