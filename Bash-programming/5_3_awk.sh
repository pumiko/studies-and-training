#!/bin/sh
#Zadanie 3
echo
echo 3.
awk '
BEGIN { print "IMIĘ NAZWISKO STAWKA GODZINY_PRACY" }
      { print $0 }
      $4  >  40  { liczba = liczba + 1 }
END   { print "Liczba pracowników, którzy przepracowali ponad 40 godzin: " liczba }
' ./pracownicy.dat
