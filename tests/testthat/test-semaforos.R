estados <- c(
  "Aguascalientes",
  "Baja California", "Baja California Sur",
  "Campeche", "Chiapas", "Chihuahua", "Ciudad de M\xc3\xa9xico", "Coahuila", "Colima",
  "Durango",
  "Guanajuato", "Guerrero",
  "Hidalgo",
  "Jalisco",
  "M\xc3\xa9xico", "Michoac\xc3\xa1n", "Morelos",
  "Nayarit", "Nuevo Le\xc3\xb3n",
  "Oaxaca",
  "Puebla",
  "Quer\xc3\xa9taro", "Quintana Roo",
  "San Luis Potos\xc3\xad", "Sinaloa", "Sonora",
  "Tabasco", "Tamaulipas", "Tlaxcala",
  "Veracruz",
  "Yucat\xc3\xa1n",
  "Zacatecas"
)

test_that("data has expected format", {

  expect_error(
    semaforos_get("wew")
  )

  sw <- semaforos_get("wide")

  expect_s3_class(sw, "data.frame")
  expect_identical(nrow(sw), 32L)
  expect_match(colnames(sw)[-1], "^\\d{4}\\-W\\d{2}$")
  expect_setequal(unlist(sw[, -1]), c("verde", "amarillo", "naranja", "rojo"))
  expect_identical(sw[, 1], estados)

  sl <- semaforos_get("long")

  expect_s3_class(sl, "data.frame")
  expect_identical(ncol(sl), 4L)
  expect_named(sl, c("estado", "year", "week", "color"))
  expect_setequal(sl$estado, estados)
  expect_match(sl$year, "^202[0123]$")
  expect_match(sl$week, "^[012345]\\d{1}$")
  expect_setequal(sl$color, c("verde", "amarillo", "naranja", "rojo"))

  expect_identical((ncol(sw)-1L)*length(estados), nrow(sl))

})

