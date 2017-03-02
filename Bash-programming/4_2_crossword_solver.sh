#!/bin/bash

# Crossword solver

slownik ()
{
 echo "Słownik do rozwiązywania anglojęzycznych krzyżówek"
 read -p "Podaj schemat wyrazu, którego szukasz: " wyraz

 while [ -z "$wyraz" ]
 do
   echo "Podaj poszukiwane słowo w następujacym formacie: "
   echo "\"xxx...x.x...\"",
   echo gdzie
   echo x - reprezentuje znane litery,
   echo . - reprezentuje nieznane litery
   echo

   read -p "Podaj schemat wyrazu: " wyraz
 done

 echo `grep -w ^"$wyraz"$ /usr/share/dict/linux.words`
}

slownik
