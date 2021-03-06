% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gen-namespace-docs.R,
%   R/gen-namespace-examples.R
\name{torch_rfft}
\alias{torch_rfft}
\title{Rfft}
\arguments{
\item{input}{(Tensor) the input tensor of at least \code{signal_ndim} dimensions}

\item{signal_ndim}{(int) the number of dimensions in each signal.        \code{signal_ndim} can only be 1, 2 or 3}

\item{normalized}{(bool, optional) controls whether to return normalized results.        Default: \code{False}}

\item{onesided}{(bool, optional) controls whether to return half of results to        avoid redundancy. Default: \code{True}}
}
\description{
Rfft
}
\note{
\preformatted{For CUDA tensors, an LRU cache is used for cuFFT plans to speed up
repeatedly running FFT methods on tensors of same geometry with same
configuration. See cufft-plan-cache for more details on how to
monitor and control the cache.
}
}
\section{rfft(input, signal_ndim, normalized=False, onesided=True) -> Tensor }{


Real-to-complex Discrete Fourier Transform

This method computes the real-to-complex discrete Fourier transform. It is
mathematically equivalent with \code{\link{torch_fft}} with differences only in
formats of the input and output.

This method supports 1D, 2D and 3D real-to-complex transforms, indicated
by \code{signal_ndim}. \code{input} must be a tensor with at least
\code{signal_ndim} dimensions with optionally arbitrary number of leading batch
dimensions. If \code{normalized} is set to \code{True}, this normalizes the result
by dividing it with \eqn{\sqrt{\prod_{i=1}^K N_i}} so that the operator is
unitary, where \eqn{N_i} is the size of signal dimension \eqn{i}.

The real-to-complex Fourier transform results follow conjugate symmetry:

\deqn{
    X[\omega_1, \dots, \omega_d] = X^*[N_1 - \omega_1, \dots, N_d - \omega_d],
}
where the index arithmetic is computed modulus the size of the corresponding
dimension, \eqn{\ ^*} is the conjugate operator, and
\eqn{d} = \code{signal_ndim}. \code{onesided} flag controls whether to avoid
redundancy in the output results. If set to \code{True} (default), the output will
not be full complex result of shape \eqn{(*, 2)}, where \eqn{*} is the shape
of \code{input}, but instead the last dimension will be halfed as of size
\eqn{\lfloor \frac{N_d}{2} \rfloor + 1}.

The inverse of this function is \code{\link{torch_irfft}}.
}

\section{Warning}{

For CPU tensors, this method is currently only available with MKL. Use
\code{torch_backends.mkl.is_available} to check if MKL is installed.
}

\examples{
if (torch_is_installed()) {

x = torch_randn(c(5, 5))
torch_rfft(x, 2)
torch_rfft(x, 2, onesided=FALSE)
}
}
