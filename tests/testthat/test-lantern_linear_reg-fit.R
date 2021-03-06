test_that("linear regression test", {

  df <- tibble::tibble(
   x1 = runif(100),
   x2 = runif(100),
   y = 3 + 2*x1 + 3*x2
  )

  expect_error(
    fit <- lantern_linear_reg(y ~ ., df, epochs = 2),
    regexp = NA
  )

  expect_equal(
    as.numeric(unlist(coef.lantern_linear_reg(fit))[c(3,1,2)]),
    as.numeric(coef(lm(scale(y) ~ ., df))),
    tolerance = 1e-4
  )

  expect_error(
    fit <- lantern_linear_reg(y ~ ., df, epochs = 10, learn_rate = 0.1, optimizer = "SGD"),
    regexp = NA
  )

})
