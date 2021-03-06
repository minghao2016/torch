% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_angle}
\alias{torch_angle}
\title{Angle}
\arguments{
\item{input}{(Tensor) the input tensor.}

\item{out}{(Tensor, optional) the output tensor.}
}
\description{
Angle
}
\section{angle(input, out=None) -> Tensor }{


Computes the element-wise angle (in radians) of the given \code{input} tensor.

\deqn{
    \mbox{out}_{i} = angle(\mbox{input}_{i})
}
}

\examples{
if (torch_is_installed()) {
\dontrun{
torch_angle(torch_tensor(c(-1 + 1i, -2 + 2i, 3 - 3i)))*180/3.14159
}

}
}
