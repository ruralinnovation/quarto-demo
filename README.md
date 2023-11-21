# Quarto Demo
MDA Team
2023-10-19

Before you render this file with `quarto`, you will need to make sure
that the [`quarto cli`](https://quarto.org/docs/get-started/) *and* the
following `R` packages are available in your local environment
(shell/terminal)…

``` r
required_packages <- c(
  "markdown",
  "tidyverse",
  "palmerpenguins"
)
```

``` r
## Initial setup ----
#| echo: false
#| output: false
#| warning: false

suppressMessages({
    if (!require("tidyverse") || !require("palmerpenguins")) {
        options(
         repos = c(CRAN = "https://cran.rstudio.com")
        )
        install.packages(required_packages)
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
    $ npm run build
    $ git push -u origin gh-pages
    $ git checkout main
    $ npm run build:all
    $ npm run publish
