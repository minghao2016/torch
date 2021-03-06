% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_floor_divide}
\alias{torch_floor_divide}
\title{Floor_divide}
\arguments{
\item{input}{(Tensor) the numerator tensor}

\item{other}{(Tensor or Scalar) the denominator}
}
\description{
Floor_divide
}
\section{floor_divide(input, other, out=None) -> Tensor }{


Return the division of the inputs rounded down to the nearest integer. See \code{\link{torch_div}}
for type promotion and broadcasting rules.

\deqn{
    \mbox{{out}}_i = \left\lfloor \frac{{\mbox{{input}}_i}}{{\mbox{{other}}_i}} \right\rfloor
}
}

\examples{
if (torch_is_installed()) {

a = torch_tensor(c(4.0, 3.0))
b = torch_tensor(c(2.0, 2.0))
torch_floor_divide(a, b)
torch_floor_divide(a, 1.4)
}
}
