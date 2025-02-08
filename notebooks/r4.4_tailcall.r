blowup <- function(n = 1, maxiter, verbose = FALSE) {
  if (verbose) {
    cat("\n\nCall stack: \n")
    s <- sys.status()
    print(s)
  }
  if (n >= maxiter) {
    return("Finished")
  }
  blowup(n+1, maxiter, verbose)
}

blowup_tail <- function(n = 1, maxiter, verbose = FALSE) {
  if (verbose) {
    cat("\n\nCall stack: \n")
    s <- sys.status()
    print(s)
  }
  if (n >= maxiter) {
    return("Finished")
  }
  Tailcall(blowup_tail, n+1, maxiter, verbose)
}


blowup(1, 10000)
blowup_tail(1, 100000)

bench::mark(
  blowup(1, 2000),
  blowup_tail(1, 2000)
)

blowup(1, 4, verbose = TRUE)
blowup_tail(1, 4, verbose = TRUE)
