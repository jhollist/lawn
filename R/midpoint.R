#' Midpoint
#'
#' @export
#' @param pt1 First point
#' @param pt2 Second point
#' @template lint
#' @return A \code{\link{data-Point}} midway between pt1 and pt2
#' @details Takes two \code{\link{data-Point}} and returns a point midway
#' between them
#' @examples
#' pt1 <- '{
#'   "type": "Feature",
#'   "properties": {},
#'   "geometry": {
#'     "type": "Point",
#'     "coordinates": [144.834823, -37.771257]
#'   }
#' }'
#' pt2 <- '{
#'   "type": "Feature",
#'   "properties": {},
#'   "geometry": {
#'     "type": "Point",
#'     "coordinates": [145.14244, -37.830937]
#'   }
#' }'
#' midpoint(pt1, pt2)
#' @examples \dontrun{
#' midpoint(pt1, pt2) %>% view
#' featurecollection(list(
#'   point(fromJSON(pt1)$geometry$coordinates),
#'   point(fromJSON(pt2)$geometry$coordinates),
#'   structure(midpoint(pt1, pt2), class = "point")
#' )) %>% view
#' }
midpoint <- function(pt1, pt2, lint = FALSE) {
  pt1 <- convert(pt1)
  pt2 <- convert(pt2)
  lawnlint(list(pt1, pt2), lint)
  ct$eval(sprintf("var md = turf.midpoint(%s, %s);", pt1, pt2))
  ct$get("md")
}