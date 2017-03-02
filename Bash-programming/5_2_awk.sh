#!/bin/sh
# Zadanie 2
echo
echo 2.
awk '
{ pracownik = pracownik $1 " " $2 " " }
END { print pracownik }
' ./pracownicy.dat