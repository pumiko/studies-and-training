#!/bin/sh
# Zadanie 1
echo 1.1
awk '$3  >  4  { print $1 " " $2 }' ./pracownicy.dat

echo
echo 1.2
awk '{ print "Wypłata dla " $2 " wynosi " $3*$4 }' ./pracownicy.dat

echo
echo 1.3
awk  '{ print $3*$4, $1 " " $2 }'  ./pracownicy.dat  |  sort -n

echo
echo 1.4

awk '$3*$4 > 120 { print $1 " " $2 }' ./pracownicy.dat

echo
echo 1.5

awk '$3 >= 4.0 && $3 <= 6.0 { print $2 }' ./pracownicy.dat

echo
echo 1.6

awk '$2 != "Nowak" { print $0 }' ./pracownicy.dat

