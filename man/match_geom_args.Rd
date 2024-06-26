% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geometries.R
\name{match_geom_args}
\alias{match_geom_args}
\title{Match list of arguments to arguments of geometry}
\usage{
match_geom_args(
  geom,
  args,
  add_aes = TRUE,
  mapping = list(),
  add_mapping = FALSE,
  exclude_args = NULL,
  envir = "ggplot2"
)
}
\arguments{
\item{geom}{Character. name of the geometry.}

\item{args}{Named list, parameters to be matched to the geometry arguments.}

\item{add_aes}{Add aesthetics parameters (like size, fill, ...).}

\item{mapping}{Mapping used in plot, to avoid setting fixed aesthetics parameters.}

\item{add_mapping}{Add the mapping as an argument.}

\item{exclude_args}{Character vector of arguments to exclude, default is to exclude aesthetics names.}

\item{envir}{Package environment to search in.}
}
\value{
a \code{list()}.
}
\description{
Match list of arguments to arguments of geometry
}
\examples{
# List of parameters
params <- list(
  bins = 30,
  scale = "width",
  adjust = 2,
  position = "stack",
  size = 1.6,
  fill = "#112246"
)

# Search arguments according to geom
match_geom_args(geom = "histogram", args = params)
match_geom_args(geom = "violin", args = params)
match_geom_args(geom = "bar", args = params, add_aes = FALSE)
match_geom_args(geom = "point", args = params)
match_geom_args(geom = "point", args = params, add_aes = FALSE)
}
