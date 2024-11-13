# załadowanie paczek
library(tidyverse)

# Dane z internetu Nowa Zelandia
dane_www <- readr::read_csv(file = "https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#czytanie z dysku - pełna ścieżka (bezwględna)
date_dysk_full_path <- readr::read_csv(file = "C:/GitHub/z internetu/annual-enterprise-survey-2023-financial-year-provisional.csv")

#wczytaj z dysku - ścieżka względna
dane_dysk_relative_path <- readr::read_csv(file = "R/z internetu/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Zamień kolumny tekstowej na liczbową
dane_dysk_relative_path$Value <- as.numeric(dane_dysk_relative_path$Value)

# Parowanie tekstu na numer
dane <- readr::read_csv(file = "R/z internetu/annual-enterprise-survey-2023-financial-year-provisional.csv")
dane$Value <- readr::parse_number(dane$Value)

dane[748, "Value"]
