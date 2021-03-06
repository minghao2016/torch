% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_ne}
\alias{torch_ne}
\title{Ne}
\arguments{
\item{input}{(Tensor) the tensor to compare}

\item{other}{(Tensor or float) the tensor or value to compare}

\item{out}{(Tensor, optional) the output tensor that must be a \code{BoolTensor}}
}
\description{
Ne
}
\section{ne(input, other, out=None) -> Tensor }{


Computes \eqn{input \neq other} element-wise.

The second argument can be a number or a tensor whose shape is
broadcastable  with the first argument.
}

\examples{
if (torch_is_installed()) {

torch_ne(torch_tensor(matrix(1:4, ncol = 2, byrow=TRUE)), 
         torch_tensor(matrix(rep(c(1,4), each = 2), ncol = 2, byrow=TRUE)))
}
}
