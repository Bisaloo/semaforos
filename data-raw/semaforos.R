library(magrittr)

url <- "https://datos.covid-19.conacyt.mx/Semaforo/semaforo.php"

scripts_page <- httr::GET(url) %>%
  httr::content() %>%
  xml2::xml_find_all(xpath = "//script")

semaforos_new <- xml2::xml_text(scripts_page[[3]]) %>%
  strsplit(";\\s*") %>%
  unlist() %>%
  { grep("^NColors\\[", ., value = TRUE) } %>%
  { gsub("^NColors\\['\\d{2}'\\]='([[:alpha:]]+)'", "\\1", .) } %>%
  tolower() %>%
  as.data.frame() %>%
  setNames(format(Sys.Date(), "%Y-W%W"))

semaforos <- read.csv("inst/extdata/semaforos.csv", check.names = FALSE) %>%
  cbind(semaforos_new)

write.csv(semaforos, "inst/extdata/semaforos.csv", row.names = FALSE)
