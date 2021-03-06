context("test-create.R")

test_that("file_create works with new and existing files", {
  x1 <- file_create(tempfile())

  expect_true(file_exists(x1))
  expect_error(file_create(x1), NA)
})

test_that("dir_create works with new and existing files", {
  x1 <- dir_create(tempfile())

  expect_true(file_exists(x1))
  expect_error(dir_create(x1), NA)
})

test_that("link_create does not modify existing links", {

  # Windows does not currently support file based symlinks
  skip_on_os("windows")

  x <- dir_create(tempfile())

  dir_create(path(x, "dir1"))
  dir_create(path(x, "dir2"))

  link_create(path(x, "dir1"), path(x, "link"))
  expect_error(link_create(path(x, "dir2"), path(x, "link")), "file already exists")
  expect_equal(link_path(path(x, "link")), path(x, "dir1"))
})
