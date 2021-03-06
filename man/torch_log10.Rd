% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_log10}
\alias{torch_log10}
\title{Log10}
\arguments{
\item{input}{(Tensor) the input tensor.}

\item{out}{(Tensor, optional) the output tensor.}
}
\description{
Log10
}
\section{log10(input, out=None) -> Tensor }{


Returns a new tensor with the logarithm to the base 10 of the elements
of \code{input}.

\deqn{
    y_{i} = \log_{10} (x_{i})
}
}

\examples{
if (torch_is_installed()) {

a = torch_rand(5)
a
torch_log10(a)
}
}
