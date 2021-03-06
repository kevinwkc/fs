% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/path.R
\name{path_tidy}
\alias{path_tidy}
\title{Tidy paths}
\usage{
path_tidy(path)
}
\arguments{
\item{path}{A character vector of one or more paths.}
}
\value{
A fs_path object
}
\description{
untidy paths are all different, tidy paths are all the same.
Tidy paths always expand \code{~}, use \code{/} to delimit directories, never have
multiple \code{/} or trailing \code{/} and have colourised output based on the file
type.
}
