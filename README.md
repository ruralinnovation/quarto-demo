# Quarto Demo
MDA Team
2023-10-19

Before you render this file with `quarto`, you will need to make sure
that the [`quarto cli`](https://quarto.org/docs/get-started/) *and* the
following `R` packages are available in your local environment
(shell/terminal)…

``` r
## Initial setup ----
#| echo: true
#| output: false
#| warning: false
suppressMessages({
    if (!require("tidyverse") || !require("palmerpenguins")) {
        options(
         repos = c(CRAN = "https://cran.rstudio.com")
        )
        install.packages(c(
            "tidyverse",
            "palmerpenguins"
            )
        )
    }
})
```

Once this dependency is satisfied, render this README with this command:

    quarto render README.qmd --cache-refresh  --verbose

------------------------------------------------------------------------

*Setup Github Actions/Pages*

    $ git checkout -b gh-pages
    $ git reset --hard
    $ git rm -r .github/workflows/quarto-publish-example.yml
    $ git commit -am "Initialising gh-pages branch"
    $ quarto render README.qmd --cache-refresh  --verbose # verify ability to render
    $ git push -u origin gh-pages
    $ git checkout main
    $ quarto publish gh-pages

------------------------------------------------------------------------

Turn this README document into presentation slides with this command:

    quarto render README.qmd --cache-refresh --to revealjs --verbose

------------------------------------------------------------------------

## Table

The table below shows the first six rows from the MTCars dataset

``` r
head(mtcars)
```

                       mpg cyl disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1

------------------------------------------------------------------------

## Chart

[Figure 1](#fig-mtscatter) shows a relationship between `wt` and `mpg`
features in the MTCars dataset.

``` r
library(ggplot2)

ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point(color = "#0099f9", size = 5)
```

<img src="README_files/figure-commonmark/fig-mtscatter-1.png"
id="fig-mtscatter"
alt="Figure 1: Weight of vehicle per 1000lbs (wt) vs. Miles/Gallon (mpg)" />
