% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fs_path.R
\name{fs_path}
\alias{fs_path}
\alias{as_fs_path}
\alias{fs_path}
\title{File paths}
\usage{
as_fs_path(x)

fs_path(x)
}
\arguments{
\item{x}{vector to be coerced to a fs_path object.}
}
\description{
Tidy file paths, character vectors which are coloured by file type on
capable terminals.

Colouring can be customized by setting the \code{LS_COLORS} environment variable,
the format is the same as that read by GNU ls / dircolors.

Colouring of file paths can be disabled by setting \code{LS_COLORS} to an empty
string e.g. \code{Sys.setenv(LS_COLORS = "")}.
}
\seealso{
\url{https://geoff.greer.fm/lscolors},
\url{https://github.com/trapd00r/LS_COLORS},
\url{https://github.com/seebi/dircolors-solarized} for some example color
settings.
}
