#' Combine
#'
#' Combines a FeatureCollection of Point, LineString, or Polygon features into
#' MultiPoint, MultiLineString, or MultiPolygon features.
#'
#' @export
#' @param fc A FeatureCollection of any type
#' @template lint
#' @examples
#' # combine points
#' fc1 <- '{
#'  "type": "FeatureCollection",
#'  "features": [
#'    {
#'      "type": "Feature",
#'      "properties": {},
#'      "geometry": {
#'        "type": "Point",
#'        "coordinates": [19.026432, 47.49134]
#'      }
#'    }, {
#'      "type": "Feature",
#'      "properties": {},
#'      "geometry": {
#'        "type": "Point",
#'        "coordinates": [19.074497, 47.509548]
#'      }
#'    }
#'  ]
#' }'
#' combine(fc1)
#'
#' # combine linestrings
#' fc2 <- '{
#'  "type": "FeatureCollection",
#'  "features": [
#'    {
#'      "type": "Feature",
#'      "properties": {},
#'      "geometry": {
#'        "type": "LineString",
#'        "coordinates": [
#'          [-21.964416, 64.148203],
#'          [-21.956176, 64.141316],
#'          [-21.93901, 64.135924],
#'          [-21.927337, 64.136673]
#'        ]
#'      }
#'    }, {
#'      "type": "Feature",
#'      "properties": {},
#'      "geometry": {
#'        "type": "LineString",
#'        "coordinates": [
#'          [-21.929054, 64.127985],
#'          [-21.912918, 64.134726],
#'          [-21.916007, 64.141016],
#'          [-21.930084, 64.14446]
#'        ]
#'      }
#'    }
#'  ]
#' }'
#' combine(fc2)
#' @examples \dontrun{
#' fc1 %>% view
#' combine(fc1) %>% view
#' fc2 %>% view
#' combine(fc2) %>% view
#' }

combine <- function(fc, lint = FALSE) {
  lawnlint(fc, lint)
  ct$eval(sprintf("var exp = turf.combine(%s);", convert(fc)))
  ct$get("exp")
}