#' Maximum value of a field among points within polygons
#'
#' Calculates the maximum value of a field for a set of \code{\link{data-Point}}'s
#' within a set of \code{\link{data-Polygon}}'s.
#'
#' @export
#' @template math
#' @template lint
#' @family aggregations
#' @return A FeatureCollection of \code{\link{data-Polygon}} features with
#' properties listed as \code{out_field}.
#' @examples \dontrun{
#' poly <- lawn_data$polygons_average
#' pt <- lawn_data$points_average
#' lawn_max(poly, pt, 'population')
#' }
lawn_max <- function(polygons, points, in_field, out_field = "max", lint = FALSE) {
  lawnlint(list(polygons, points), lint)
  calc_math("max", convert(polygons), convert(points), in_field, out_field)
}
