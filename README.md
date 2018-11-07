
<!-- README.md is generated from README.Rmd. Please edit that file -->

# leaflet.opacity

# General

**leaflet.opacity** extends the **leaflet** R package with the
**Leaflet.OpacityControls** JavaScript plugin (LizardTech, 2013). It
offers control buttons and a slider for adjusting the opacity of a
layer.

## Installation

You can install the released version of leaflet.opacity from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("leaflet.opacity")
```

or the latest version from GitHub
with:

``` r
devtools::install_github("https://github.com/be-marc/leaflet.opacity", dependencies=TRUE)
```

## Example

``` r
library(leaflet)
library(leaflet.opacity)
library(raster)

r <- raster(xmn = -2.8, xmx = -2.79, ymn = 54.04, ymx = 54.05, nrows = 30, ncols = 30)
values(r) <- matrix(1:900, nrow(r), ncol(r), byrow = TRUE)
crs(r) <- CRS("+init=epsg:4326")

leaflet() %>%
    addTiles() %>%
    addRasterImage(r, layerId = "raster") %>%
    addOpacitySlider(layerId = "raster")
```

## Reference

LizardTech (2013). Leaflet.OpacityControls. Retrieved from
<https://github.com/lizardtechblog/Leaflet.OpacityControls>
