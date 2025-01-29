#ggplot intro 29.01.2025

#paczki
library(tidyverse)

# Dane hydrochemiczne
zab_hydrochemia <- read.csv("R/zabinskie_lake/zab_hydrochemistry-lake.csv") |>
mutate(date = lubridate::ymd(date))

#Wykres x = czas y = wartosc Ca
ggplot2::ggplot(zab_hydrochemia, aes(date, ca)) +
  geom_line()

#wykres x = czas y= wartosc ca - serie pokolorowane - glebokosc
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = depth)) +
  geom_line()

#wykres x = czas y= wartosc ca - serie pokolorowane - glebokosc jako wartosci dyskretne
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line()

#wykres x = czas y= wartosc ca - serie pokolorowane - glebokosc jako wartosci dyskretne
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth))

#wykres x = czas y= wartosc ca - serie pokolorowane - glebokosc jako wartosci dyskretne
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth), ncol = 1)

#wykres x = czas y= wartosc ca - serie pokolorowane - glebokosc jako wartosci dyskretne. brak tła, linie osi itd
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth), ncol = 1) +
  theme_dark()

#wykres x = czas y= wartosc ca - serie pokolorowane - glebokosc jako wartosci dyskretne. brak tła, linie osi itd
ggplot2::ggplot(zab_hydrochemia, aes(date, ca, color = factor(depth))) +
  geom_line() +
  facet_wrap(vars(depth), ncol = 1) +
  theme(panel.background = element_blank())

# Wczytaj dane zab_temperature_daily
zab_temp <- read.csv("R/zabinskie_lake/zab_temperature-daily.csv") |>
mutate(day = lubridate::ymd(day))

#wykres temperatury wody w czasie, temperatura na pierwszym metrze, punkty, linia, wygladzone
ggplot(zab_temp, aes(day, temp_01)) +
  geom_point() +
  geom_line(color = "red") +
  geom_smooth()

#wykres z seriali rozbitymi na panele, wszystkie głębokości
zab_temp |>
  tidyr::pivot_longer(cols = starts_with("temp_"), names_to = "glebokosc", values_to = "temperatura") |>
  ggplot(aes(day, temperatura)) +
  geom_line() +
  facet_wrap(vars(glebokosc), ncol = 1, scales = "free")

# wczytaj dane dotyczące pułapki sedymentacyjnej
zab_trap <- read.csv("R/zabinskie_lake/zab_sediment-trap_hypolimnion.csv") |> mutate(date = lubridate::ymd(date))

# Wykres kolumnowy tempa akumulacji
zab_trap |>
ggplot(aes(data, mar))  +
  geom_col()

# tu coś nie poszło
zab_trap |>
ggplot() +
  geom_rect()

# boxplot (za statistici ramka-wąsy)
ggplot(zab_hydrochemia) + geom_boxplot(aes(y = ca, group = factor(depth)))

#vinpoint
ggplot(zab_hydrochemia) + geom_violin(aes(x = factor(depth), y = ca))

# histogramy
ggplot(zab_hydrochemia) + geom_histogram(aes(ca, fill = factor(depth)))
