#!/bin/bash

#Print user age and classify to a group

read -p "Podaj sw�j wiek: " wiek

while [[ $wiek -lt 0 || -z "$wiek" ]] || [ "`echo $wiek | tr -d  "[:digit:]"`" ]
do
    echo "B��dnie podany wiek. Prosimy o podanie wieku w formie liczby nieujemnej."
    read -p "Podaj swoj wiek: " wiek
done

if [[ $wiek -lt 18 ]]
then
  echo Zosta�e� zakwalifikowany do grupy wiekowej A. \"Pogadamy jak dorosniesz\"
elif [[ $wiek -ge 18 && $wiek -le 35 ]]
then
  echo Zosta�e� zakwalifikowany do grupy wiekowej B. - \"jeszcze `expr 67 - $wiek` lat do emerytury\"
elif [[ $wiek -gt 35 ]]
then
  echo Zosat�e� zakwalifikowany do grupy wiekowej C. \"Mlodzi duchem\"
fi
