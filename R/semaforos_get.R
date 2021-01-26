#' Get Semáforo Epidemiológico Data from Mexico COVID-19 response
#'
#' @param format Either `"long"` (the default), or `"wide"` to specify the
#' format of the output `data.frame`
#'
#' @return
#' - if `format = "long"`, a `data.frame` with 4 columns:
#'    * `estado` which contains the name of the state to which the semaforo
#'    in the row applies
#'    * `year` the four-digit year (`%Y` in [strptime()])
#'    * `week` the two-digit week, as specified in the ISO8601 (`%W` in
#'    [strptime()]
#'    * `color` the color of the semaforo, indicating the alert level
#' - if `format = "wide"`, a `data.frame` with `estado` as the first column
#' and then one column for each week, with the column names indicating the week
#' in the format `%Y-W%W` (e.g., "2021-W02")
#'
#' @examples
#' sw <- semaforos_get(format = "wide")
#' head(sw)
#'
#' sl <- semaforos_get(format = "long")
#' head(sl)
#'
#' @importFrom utils read.csv
#' @importFrom stats reshape
#'
#' @export
semaforos_get <- function(format = c("long", "wide")) {

  format <- match.arg(format)

  semaforos <- read.csv(
    system.file("extdata", "semaforos.csv", package = "semaforos"),
    check.names = FALSE
  )

  if (format == "wide") {
    return(semaforos)
  }

  semaforos_long <- reshape(
    semaforos,
    idvar = "estado",
    ids = semaforos$estado,
    timevar = c("year", "week"),
    times = colnames(semaforos)[-1],
    varying = list(colnames(semaforos)[-1]),
    v.names = "color",
    direction = "long"
  )
  rownames(semaforos_long) <- NULL
  semaforos_long$year <- gsub("^(\\d{4})\\-W\\d{2}$", "\\1", semaforos_long$year)
  semaforos_long$week <- gsub("^\\d{4}\\-W(\\d{2})$", "\\1", semaforos_long$week)

  return(semaforos_long)

}
