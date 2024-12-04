#27.11.2024
library(tidyverse)
library(readxl)

# Wczytanie danych
ramka <- readxl::read_excel("R/Dane_Anta_BC_robocze_na_przetwarzanie.xlsx.xlsx", sheet = "Arkusz1")

ramka2 <- dplyr::rename(ramka, filter_mass = 'filter mass', station_name = 'station name', mass_matter_g = 'matter mass [g]', volume_of_water_l = 'volume of water [l]')

# zmiana nazwa z malej na wielka
ramka_3 <- dplyr::rename_with(ramka2, .cols = dplyr::everything(), \(i) toupper(i))

ramka_4 <- dplyr::rename_with(ramka2, .cols = dplyr::starts_with("sample"), \(i) toupper(i))

ramka_5 <- dplyr::rename_with(ramka2, .cols = dplyr::contains("matter"), \(i) toupper(i))

# operacja na wierszach
ramka_4[2, ]
# operacje na kolumnach
ramka_4[ , 2]

ramka$kolumna11 <- ramka[ , 3] / ramka[ , 4]
View(ramka)

ramka_6 <- dplyr::mutate(ramka, wynik_dzielenia = 'filter mass' / 'filter+matter')

# ponowne wczytanie
ramka <- readxl::read_excel("R/Dane_Anta_BC_robocze_na_przetwarzanie.xlsx.xlsx" , sheet = "Arkusz1")

ramka$kolumna11 <- ramka[ , 3] / ramka[ , 4]


ramka_6 <- dplyr::mutate(ramka, wynik_dzielenia = 'filter mass' / 'filter+matter', wynik_dodawania = 'volume of water [l]' + 1)
ramka_7 <- dplyr::mutate(ramka, 'volume of water [l]' = 'volume of water [l]' - 10)
ramka_8 <- dplyr::mutate(ramka, 'volume of water [l]' = 'volume of water [l]' - 10, keep = "none")

# Przesunięcie danych
ramka_9 <- dplyr::relocate(ramka_7, 'volume of water [l]', after = sample)
