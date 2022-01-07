# esquisse <img src="man/figures/logo.png" width=200 align="right" />

> The purpose of this add-in is to let you explore your data quickly to extract the information they hold. You can create visualization with [{ggplot2}](https://ggplot2.tidyverse.org/), filter data with [{dplyr}](https://dplyr.tidyverse.org/) and retrieve generated code.

<!-- badges: start -->
[![version](http://www.r-pkg.org/badges/version/esquisse)](https://CRAN.R-project.org/package=esquisse)
[![cranlogs](http://cranlogs.r-pkg.org/badges/esquisse)](https://CRAN.R-project.org/package=esquisse)
[![Lifecycle: stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![R-CMD-check](https://github.com/dreamRs/esquisse/workflows/R-CMD-check/badge.svg)](https://github.com/dreamRs/esquisse/actions)
<!-- badges: end -->

This addin allows you to interactively explore your data by visualizing it with the [ggplot2](https://github.com/tidyverse/ggplot2) package. It allows you to draw bar plots, curves, scatter plots, histograms, boxplot and [sf](https://github.com/r-spatial/sf) objects, then export the graph or retrieve the code to reproduce the graph.

See online documentation : https://dreamrs.github.io/esquisse/index.html

If you find bugs, please open an [issue](https://github.com/dreamRs/esquisse/issues)


## Installation

Install from [CRAN](https://CRAN.R-project.org/package=esquisse) with :

```r
install.packages("esquisse")
```

Or install development version from [GitHub](https://github.com/dreamRs/esquisse) :

```r
remotes::install_github("dreamRs/esquisse")
```

Then launch the addin via the RStudio menu or with `esquisse::esquisser()`.


## esquisse addin

```r
esquisse::esquisser()
# or with your data:
esquisse::esquisser(palmerpenguins::penguins)
```

![](man/figures/esquisse.gif)

Above gif was made with :heart: by [@mfanny](https://github.com/mfanny) and cannot be removed, but in the meantime {esquisse} has evolved, the latest version now looks like:

![](man/figures/esquisse.png)


### Internationalization

Currently you can use {esquisse} in the following language: <img src="man/figures/i18n/gb.svg" height="16" style="height:16px"/> english (default), <img src="man/figures/i18n/fr.svg" height="16" style="height:16px"/> french (`"fr"`), <img src="man/figures/i18n/mk.svg" height="16" style="height:16px"/> macedonian (`"mk"`), <img src="man/figures/i18n/al.svg" height="16" style="height:16px"/> albanian (`"sq"`). Activate with:

```r
library(esquisse)
set_i18n("fr")
esquisser()
```

If you want another language to be supported, you can submit a Pull Request to add a CSV file like the one used for french (file is located in `inst/i18n` folder in the package, you can see it [here on GitHub](https://github.com/dreamRs/esquisse/blob/master/inst/i18n/fr.csv)).

See [{datamods} vignette](https://dreamrs.github.io/datamods/articles/i18n.html) for more on this topic.

