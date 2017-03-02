#!/bin/bash

#Functions for printing user age
sprawdz ()
{
 while [[ $wiek -lt 0 || $wiek -gt 130 || -z "$wiek" ]] || [ "`echo $wiek | tr -d  "[:digit:]"`" ]
 do
  echo "Blednie podany wiek. Prosimy o podanie wieku w formie liczby nieujemnej, nie wiekszej niz 130"
  read -p "Podaj swoj wiek: " wiek
 done
}

wyswietl ()
{
 if [[ $wiek -lt 18 ]]
 then
   echo Zostałeś zakwalifikowany do grupy wiekowej A. \"Pogadamy jak dorosniesz\"
 elif [[ $wiek -ge 18 && $wiek -le 35 ]]
 then
   echo Zostałeś zakwalifikowany do grupy wiekowej B. - \"zostalo Ci jeszcze `expr 67 - $wiek` lat do emerytury\"
 elif [[ $wiek -gt 35 ]]
 then
   echo Zostałeś zakwalifikowany do grupy wiekowej C. \"Mlodzi duchem\"
 fi
}

# Run:
read -p "Podaj swój wiek: " wiek
sprawdz
wyswietl
