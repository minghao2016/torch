% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_cholesky}
\alias{torch_cholesky}
\title{Cholesky}
\arguments{
\item{input}{(Tensor) the input tensor \eqn{A} of size \eqn{(*, n, n)} where \code{*} is zero or more                batch dimensions consisting of symmetric positive-definite matrices.}

\item{upper}{(bool, optional) flag that indicates whether to return a                            upper or lower triangular matrix. Default: \code{False}}

\item{out}{(Tensor, optional) the output matrix}
}
\description{
Cholesky
}
\section{cholesky(input, upper=False, out=None) -> Tensor }{


Computes the Cholesky decomposition of a symmetric positive-definite
matrix \eqn{A} or for batches of symmetric positive-definite matrices.

If \code{upper} is \code{True}, the returned matrix \code{U} is upper-triangular, and
the decomposition has the form:

\deqn{
  A = U^TU
}
If \code{upper} is \code{False}, the returned matrix \code{L} is lower-triangular, and
the decomposition has the form:

\deqn{
    A = LL^T
}
If \code{upper} is \code{True}, and \eqn{A} is a batch of symmetric positive-definite
matrices, then the returned tensor will be composed of upper-triangular Cholesky factors
of each of the individual matrices. Similarly, when \code{upper} is \code{False}, the returned
tensor will be composed of lower-triangular Cholesky factors of each of the individual
matrices.
}

\examples{
if (torch_is_installed()) {

a = torch_randn(c(3, 3))
a = torch_mm(a, a$t()) # make symmetric positive-definite
l = torch_cholesky(a)
a
l
torch_mm(l, l$t())
a = torch_randn(c(3, 2, 2))
\dontrun{
a = torch_matmul(a, a$transpose(-1, -2)) + 1e-03 # make symmetric positive-definite
l = torch_cholesky(a)
z = torch_matmul(l, l$transpose(-1, -2))
torch_max(torch_abs(z - a)) # Max non-zero
}
}
}
