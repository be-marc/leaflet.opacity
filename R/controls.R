dependency <- function() {
  jquery_ui <- htmltools::htmlDependency(name = "jquery-ui",
                            version = "1.10.3",
                            src= system.file("lib/jquery-ui/", package = "leaflet.opacity"),
                            script = "jquery-ui-1.10.3.custom.min.js",
                            stylesheet = "jquery-ui-1.10.3.custom.min.css")

  opacity <- htmltools::htmlDependency(name = "opacity",
                            version = "1.0.0",
                            src= system.file("lib/opacity/", package = "leaflet.opacity"),
                            script = "Control.Opacity.js",
                            stylesheet = "Control.Opacity.css")
  list(jquery_ui, opacity)
  }

#' @title Add lower opacity control to map
#' @description Add lower opacity control to map
#' @param map Leaflet map
#' @param layerId Opacity layer
#' @author Marc Becker
#' @examples
#' # Libraries
#' library(leaflet)
#' library(leaflet.opacity)
#' library(raster)
#'
#' # Create artificial raster
#' r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
#' values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
#' crs(r) <- CRS("+init=epsg:4326")
#'
#' # Create leaflet map with lower opacity control
#' leaflet() %>%
#'   addTiles() %>%
#'   addRasterImage(r, layerId = "raster") %>%
#'   addLowerOpacity(layerId = "raster")
#' @export

addLowerOpacity <- function(map, layerId) {

  map$dependencies <- c(map$dependencies, dependency())
  data = list(layerId = layerId)

  htmlwidgets::onRender(
    map,
    htmlwidgets::JS("function(el,x,data){
                       var map = this;
                       var lowerOpacity = new L.Control.lowerOpacity();
                       var opacityLayer = map.layerManager.getLayer('image', data.layerId)

                       lowerOpacity.setOpacityLayer(opacityLayer);
                       map.addControl(lowerOpacity);
                    }") ,data)
}

#' @title Add higher opacity control to map
#' @description Add higher opacity control to map
#' @param map Leaflet map
#' @param layerId Opacity layer
#' @author Marc Becker
#' @examples
#' # Libraries
#' library(leaflet)
#' library(leaflet.opacity)
#' library(raster)
#'
#' # Create artificial layer
#' r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
#' values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
#' crs(r) <- CRS("+init=epsg:4326")
#'
#' # Create leaflet map with higher opacity control
#' leaflet() %>%
#'   addTiles() %>%
#'   addRasterImage(r, layerId = "raster") %>%
#'   addHigherOpacity(layerId = "raster")
#' @export

addHigherOpacity <- function(map, layerId) {

  map$dependencies <- c(map$dependencies, dependency())
  data = list(layerId = layerId)

  htmlwidgets::onRender(
    map,
    htmlwidgets::JS("function(el,x,data){
                       var map = this;
                       var higherOpacity = new L.Control.higherOpacity();
                       var opacityLayer = map.layerManager.getLayer('image', data.layerId)

                       higherOpacity.setOpacityLayer(opacityLayer);
                       map.addControl(higherOpacity);
                    }") ,data)
}

#' @title Add opacity slider control to map
#' @description Add opacity slider control to map
#' @param map Leaflet map
#' @param layerId Opacity layer
#' @author Marc Becker
#' @examples
#' # Libraries
#' library(leaflet)
#' library(leaflet.opacity)
#' library(raster)
#'
#' # Create artificial layer
#' r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
#' values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
#' crs(r) <- CRS("+init=epsg:4326")
#'
#' # Create leaflet map with opacity slider
#' leaflet() %>%
#'   addTiles() %>%
#'   addRasterImage(r, layerId = "raster") %>%
#'   addOpacitySlider(layerId = "raster")
#' @export

addOpacitySlider <- function(map, layerId) {

  map$dependencies <- c(map$dependencies, dependency())
  data = list(layerId = layerId)

  htmlwidgets::onRender(
    map,
    htmlwidgets::JS("function(el,x,data){
                       var map = this;
                       var opacitySlider = new L.Control.opacitySlider();
                       var opacityLayer = map.layerManager.getLayer('image', data.layerId)

                       opacitySlider.setOpacityLayer(opacityLayer);
                       map.addControl(opacitySlider);
                    }") ,data)
}
