captures <- function(x, m) {
  stopifnot(is.character(x))
  stopifnot(class(m) == "integer" &&
    identical(names(attributes(m)), c("match.length", "useBytes", "capture.start", "capture.length", "capture.names")))

  starts <- attr(m, "capture.start")
  strings <- substring(x, starts, starts + attr(m, "capture.length") - 1L)
  res <- data.frame(matrix(strings, ncol = NCOL(starts)), stringsAsFactors = FALSE)
  colnames(res) <- auto_name(attr(m, "capture.names"))
  res[m == -1, ] <- NA_character_
  res
}

auto_name <- function(names) {
  missing <- names == ""
  if (all(!missing)) {
    return(names)
  }
  names[missing] <- seq_along(names)[missing]
  names
}