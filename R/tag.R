#' Inside
#'
#' Takes a Point and a Polygon or MultiPolygon and determines if the point
#' resides inside the polygon. The polygon can be convex or concave. The
#' function accounts for holes
#'
#' @param points Input point
#' @param polygons Input polygon or multipolygon
#' @param polyId property in polygons to add to joined Point features
#' @param containingPolyId property in points in which to store joined
#' property from polygons
#' @return \code{TRUE} if the Point IS inside the Polygon, \code{FALSE} if
#' the Point IS NOT inside the Polygon
#' @examples \dontrun{
#' pts <- random(n = 30)
#' polys <- triangle_grid(c(-77.3876, 38.7198, -76.9482, 39.0277), 30, 'miles')
#' tag(pts, polys, 'fill', 'marker-color')
#' }
tag <- function(points, polygons, polyId, containingPolyId) {
  message("not working yet")
#   points <- convert(points)
#   polygons <- convert(polygons)
#   ct$eval(sprintf("var tag = turf.tag(%s, %s, '%s', '%s');",
#                   points, polygons, polyId, caontainingPolyId))
#   ct$get("tag")
}