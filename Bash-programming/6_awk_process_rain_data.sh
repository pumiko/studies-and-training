#!/bin/bash

awk '
        {
                a[NR] = $1
                b[NR] = $2
                sum += $2
        }

        END {
                printf "|%-6s|%-12s|%-12s|%-12s|%-12s|\n",  "rok", "opad", "obs-sr", "|obs-sr|", "(obs-sr)^2" > "./dane.csv"
                printf "|%-6s|%-12s|%-12s|%-12s|%-12s|\n",  "------", "------------", "------------", "------------", "------------" >> "./dane.csv"
                for (i=1; i<=NR; i++)
                {
                        printf "|%-6s|%12s|%12.2f|%12.2f|%12.2f|\n",  a[i], b[i], b[i]-(sum/NR), sqrt((b[i]-(sum/NR))^2), (b[i]-(sum/NR))^2 >> "./dane.csv"
                        sumakw+=(b[i]-(sum/NR))^2
                        sumaroznicbezwzgl+=sqrt((b[i]-(sum/NR))^2)
                }

                printf "|%-25s|%7s|\n", "Statystyka", "wartosc" > "./statystyki.csv"
                printf "|%-25s|%7s|\n", "-------------------------", "-------" >> "./statystyki.csv"
                printf "|%-25s|%7.2f|\n", "Średnia", sum/NR >> "./statystyki.csv"
                printf "|%-25s|%7.2f|\n", "Odchylenie standardowe", sqrt(sumakw/NR) >> "./statystyki.csv"
                printf "|%-25s|%7.2f|\n", "Odchylenie przeciętne", sumaroznicbezwzgl/NR >> "./statystyki.csv"
                printf "|%-25s|%7.2f|\n", "Wariancja", sumakw/NR >> "./statystyki.csv"
        }
' sumy_opadow_Bidston.csv

echo
cat ./dane.csv
echo
cat ./statystyki.csv
