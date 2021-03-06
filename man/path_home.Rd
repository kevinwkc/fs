% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/path.R
\name{path_home}
\alias{path_home}
\alias{path_temp}
\title{Paths starting from useful directories}
\usage{
path_home(...)

path_temp(...)
}
\arguments{
\item{...}{Additional paths appended to the temporary directory by \code{path()}.}
}
\description{
\itemize{
\item \code{path_temp()} starts the path with the session temporary directory
\item \code{path_home()} starts the path with the users home directory
}
}
\examples{
path_home()
path_home("R")

path_temp()
path_temp("does-not-exist")
}
