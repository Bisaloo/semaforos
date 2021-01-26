url <- "https://datos.covid-19.conacyt.mx/Semaforo/semaforo.php"

library(rvest)
library(polite)

session <- bow(url)

scripts_page <- scrape(session) %>%
  html_nodes(xpath = "//script")

semaforos_new <- html_text2(scripts_page[[3]]) %>%
  strsplit(";\\s*") %>%
  unlist() %>%
  { grep("^NColors\\[", ., value = TRUE) } %>%
  { gsub("^NColors\\['\\d{2}'\\]='([[:alpha:]]+)'", "\\1", .) } %>%
  tolower() %>%
  as.data.frame() %>%
  setNames(format(Sys.Date(), "%Y-W%W"))

library(readr)

semaforos <- read_csv("inst/extdata/semaforos.csv") %>%
  cbind(semaforos_new)

write_csv(semaforos, "inst/extdata/semaforos.csv")
