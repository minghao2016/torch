% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_randint_like}
\alias{torch_randint_like}
\title{Randint_like}
\arguments{
\item{input}{(Tensor) the size of \code{input} will determine size of the output tensor.}

\item{low}{(int, optional) Lowest integer to be drawn from the distribution. Default: 0.}

\item{high}{(int) One above the highest integer to be drawn from the distribution.}

\item{dtype}{(\code{torch.dtype}, optional) the desired data type of returned Tensor.        Default: if \code{None}, defaults to the dtype of \code{input}.}

\item{layout}{(\code{torch.layout}, optional) the desired layout of returned tensor.        Default: if \code{None}, defaults to the layout of \code{input}.}

\item{device}{(\code{torch.device}, optional) the desired device of returned tensor.        Default: if \code{None}, defaults to the device of \code{input}.}

\item{requires_grad}{(bool, optional) If autograd should record operations on the        returned tensor. Default: \code{False}.}

\item{memory_format}{(\code{torch.memory_format}, optional) the desired memory format of        returned Tensor. Default: \code{torch_preserve_format}.}
}
\description{
Randint_like
}
\section{randint_like(input, low=0, high, dtype=None, layout=torch.strided, device=None, requires_grad=False, }{


memory_format=torch.preserve_format) -> Tensor

Returns a tensor with the same shape as Tensor \code{input} filled with
random integers generated uniformly between \code{low} (inclusive) and
\code{high} (exclusive).

.. note:
With the global dtype default (\code{torch_float32}), this function returns
a tensor with dtype \code{torch_int64}.
}

