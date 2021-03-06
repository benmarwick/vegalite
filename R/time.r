#' How to encode time values
#'
#' @param vl Vega-Lite object
#' @param chnl x,y
#' @param unit the property of a channel definition sets the level of specificity
#'        for a temporal field. Currently supported values are 'year', 'yearmonth',
#'        'yearmonthday', 'yearmonthdate', 'yearday', 'yeardate', 'yearmonthdayhours'
#'        and 'yearmonthdayhoursminutes' for non-periodic time units & 'month',
#'        'day', 'date', 'hours', 'minutes', 'seconds', 'milliseconds', 'hoursminutes',
#'        'hoursminutesseconds', 'minutesseconds' and 'secondsmilliseconds' for
#'        periodic time units.
#' @references \href{http://vega.github.io/vega-lite/docs/timeunit.html}{Vega-Lite Time Unit}
#' @export
#' @examples
#' vegalite() %>%
#'   cell_size(300, 300) %>%
#'   add_data("https://vega.github.io/vega-editor/app/data/unemployment-across-industries.json") %>%
#'   encode_x("date", "temporal") %>%
#'   encode_y("count", "quantitative", aggregate="sum") %>%
#'   encode_color("series", "nominal") %>%
#'   scale_x_time(nice="month") %>%
#'   scale_color_nominal(range="category20b") %>%
#'   axis_x(axisWidth=0, format="%Y", labelAngle=0) %>%
#'   axis_y(remove=TRUE) %>%
#'   timeunit_x("yearmonth") %>%
#'   mark_area(stack="normalize")

timeunit <- function(vl, chnl="x", unit) {
  vl$x$encoding[[chnl]]$timeUnit <- unit
  vl
}

#' @rdname timeunit
#' @export
timeunit_x <- function(vl, unit) {
  vl <- timeunit(vl, chnl="x", unit=unit)
  vl
}

#' @rdname timeunit
#' @export
timeunit_y <- function(vl, unit) {
  vl <- timeunit(vl, chnl="y", unit=unit)
  vl
}
