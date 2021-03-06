context("test-copy.R")

describe("file_copy", {
  it("copies an empty file and returns the new path", {
    with_dir_tree(list("foo" = ""), {
      expect_true(file_exists("foo"))
      expect_equal(file_copy("foo", "foo2"), "foo2")
      expect_true(file_exists("foo"))
      expect_true(file_exists("foo2"))
    })
  })

  it("copies a non-empty file and returns the new path", {
    with_dir_tree(
      list("foo" = "test"), {
      expect_true(file_exists("foo"))
      expect_equal(file_copy("foo", "foo2"), "foo2")
      expect_true(file_exists("foo"))
      expect_true(file_exists("foo2"))
      expect_equal(readLines("foo2"), readLines("foo"))
    })
  })
  it("copies multiple files", {
    with_dir_tree(list("foo" = "test", "bar" = "test2"), {
      expect_equal(file_exists(c("foo", "bar")), c(foo = TRUE, bar = TRUE))
      expect_equal(file_copy(c("foo", "bar"), c("foo2", "bar2")),
        c("foo2", "bar2"))
      expect_equal(readLines("foo2"), readLines("foo"))
      expect_equal(readLines("bar2"), readLines("bar"))
    })
  })
})

describe("link_copy", {
  it("copies links and returns the new path", {
    with_dir_tree(list("foo"), {
      link_create(path_norm("foo"), "loo")
      expect_true(dir_exists("foo"))
      expect_true(link_exists("loo"))
      expect_equal(link_copy("loo", "loo2"), "loo2")

      expect_true(link_exists("loo2"))
      expect_equal(link_path("loo2"), link_path("loo"))
    })
  })
})

describe("dir_copy", {
  it("copies an empty directory and returns the new path", {
    with_dir_tree(list("foo"), {
      expect_true(dir_exists("foo"))
      expect_equal(dir_copy("foo", "foo2"), "foo2")
      expect_true(dir_exists("foo"))
      expect_true(dir_exists("foo2"))
    })
  })
  it("copies a non-empty directory and returns the new path", {
    with_dir_tree(
      list("foo/bar" = "test",
        "foo/baz" = "test2"), {
      expect_true(dir_exists("foo"))
      expect_equal(dir_copy("foo", "foo2"), "foo2")
      expect_true(dir_exists("foo"))
      expect_true(dir_exists("foo2"))
      expect_true(file_exists("foo2/bar"))
    })
  })
  it("copies nested directories and returns the path", {
    with_dir_tree(
      list("foo/bar/baz" = "test",
        "foo/baz/qux" = "test2"), {
      expect_true(dir_exists("foo"))
      expect_equal(dir_copy("foo", "foo2"), "foo2")
      expect_true(dir_exists("foo"))
      expect_true(dir_exists("foo2"))
      expect_true(file_exists("foo2/bar/baz"))
    })
  })
  it("copies links and returns the path", {
    with_dir_tree(
      list("foo/bar/baz" = "test"), {
        link_create(path_norm("foo/bar"), "foo/foo")
        expect_equal(dir_copy("foo", "foo2"), "foo2")
        expect_true(dir_exists("foo2"))
        expect_true(link_exists("foo2/foo"))
        expect_equal(link_path("foo2/foo"), link_path("foo/foo"))
    })
  })
})
