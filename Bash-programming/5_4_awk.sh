#!/bin/sh
#Zadanie 4.
echo
echo 4.
awk '
    { tab[NR] = $0 }
END { for(i = NR; i > 0; i = i - 1)
      print tab[i]
    }
' ./pracownicy.dat