% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_histc}
\alias{torch_histc}
\title{Histc}
\arguments{
\item{input}{(Tensor) the input tensor.}

\item{bins}{(int) number of histogram bins}

\item{min}{(int) lower end of the range (inclusive)}

\item{max}{(int) upper end of the range (inclusive)}

\item{out}{(Tensor, optional) the output tensor.}
}
\description{
Histc
}
\section{histc(input, bins=100, min=0, max=0, out=None) -> Tensor }{


Computes the histogram of a tensor.

The elements are sorted into equal width bins between \code{min} and
\code{max}. If \code{min} and \code{max} are both zero, the minimum and
maximum values of the data are used.
}

\examples{
if (torch_is_installed()) {

torch_histc(torch_tensor(c(1., 2, 1)), bins=4, min=0, max=3)
}
}
