captures <- function(x, m) {
  stopifnot(is.character(x))
  stopifnot(class(m) == "integer" &&
    all(c("match.length", "useBytes", "capture.start", "capture.length", "capture.names") %in% names(attributes(m))))

  starts <- attr(m, "capture.start")
  strings <- substring(x, starts, starts + attr(m, "capture.length") - 1L)
  res <- data.frame(matrix(strings, ncol = NCOL(starts)), stringsAsFactors = FALSE)
  colnames(res) <- auto_name(attr(m, "capture.names"))
  res[is.na(m) | m == -1, ] <- NA_character_
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

is_windows <- function() {
  tolower(Sys.info()[["sysname"]]) == "windows"
}

# This is needed to avoid checking the class of fs_path objects in the
# tests.
compare.fs_path <- function(x, y) {
  if (identical(class(y), "character")) {
    class(x) <- NULL
  }
  names(x) <- NULL
  names(y) <- NULL
  NextMethod("compare")
}

compare.fs_perms <- function(x, y) {
  if (!inherits(y, "fs_perms")) {
    y <- as.character(as_fs_perms(y))
    x <- as.character(x)
  }
  NextMethod("compare")
}

nchar <- function(x, type = "chars", allowNA = FALSE, keepNA = NA) {
  # keepNA was introduced in R 3.2.1, previous behavior was equivalent to keepNA
  # = FALSE
  if (getRversion() < "3.2.1") {
    if (!identical(keepNA, FALSE)) {
      stop("`keepNA` must be `FALSE` for R < 3.2.1", call. = FALSE)
    }
    return(base::nchar(x, type, allowNA))
  }
  base::nchar(x, type, allowNA, keepNA)
}

`%||%` <- function(x, y) if (is.null(x)) y else x

# Only use deterministic entries if we are building documentation in pkgdown.
pkgdown_tmp <- function(path) {
  if (identical(Sys.getenv("IN_PKGDOWN"), "true")) {
    file_temp_push(path)
  }
}
