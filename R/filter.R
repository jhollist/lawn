#' Filter a FeatureCollection by a given property and value
#'
#' @export
#'
#' @param features A \code{\link{data-FeatureCollection}}.
#' @param key (character) The property on which to filter.
#' @param value (character) The value of that property on which to filter.
#' @template lint
#' @family data functions
#' @return S filtered \code{\link{data-FeatureCollection}} with only
#' features that match input key and value.
#' @examples
#' cat(lawn_data$filter_features)
#' lawn_filter(features = lawn_data$filter_features, key = 'species', value = 'oak')
#' lawn_filter(lawn_data$filter_features, 'species', 'maple')
#' lawn_filter(lawn_data$filter_features, 'species', 'redwood')
lawn_filter <- function(features, key, value, lint = FALSE) {
  lawnlint(features, lint)
  ct$eval(sprintf('var key = "%s";', key))
  ct$eval(sprintf('var value = "%s";', value))
  ct$eval('
    fun = function(cc, k, v) {
      var nfc = turf.featureCollection([]);
      for (var i = 0; i < cc.features.length; i++) {
          if(cc.features[i].properties[k] === v) {
          nfc.features.push(cc.features[i]);
        }
      }
      return nfc;
    }
  ')
  ct$eval(sprintf("var filtered = fun(%s, key, value);", features))
  as.fc(ct$get("filtered"))
}
