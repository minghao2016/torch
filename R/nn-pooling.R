#' @include nn.R
NULL

nn_max_pool_nd <- nn_module(
  "nn_max_pool_nd",
  initialize = function(kernel_size, stride=NULL, padding=0, dilation=1,
                        return_indices=FALSE, ceil_mode=FALSE) {
    self$kernel_size <- kernel_size
    
    if (is.null(stride))
      self$stride <- kernel_size
    else
      self$stride <- stride
    
    self$padding <- padding
    self$dilation <- dilation
    self$return_indices <- return_indices
    self$ceil_mode <- ceil_mode
  }
)

#' MaxPool1D module
#' 
#' Applies a 1D max pooling over an input signal composed of several input
#' planes.
#' 
#' In the simplest case, the output value of the layer with input size \eqn{(N, C, L)}
#' and output \eqn{(N, C, L_{out})} can be precisely described as:
#' 
#' \deqn{
#'   out(N_i, C_j, k) = \max_{m=0, \ldots, \mbox{kernel\_size} - 1}
#' input(N_i, C_j, stride \times k + m)
#' }
#' 
#' If `padding` is non-zero, then the input is implicitly zero-padded on both sides
#' for `padding` number of points. `dilation` controls the spacing between the kernel points.
#' It is harder to describe, but this [link](https://github.com/vdumoulin/conv_arithmetic/blob/master/README.md) 
#' has a nice visualization of what `dilation` does.
#' 
#' @param kernel_size the size of the window to take a max over
#' @param stride the stride of the window. Default value is `kernel_size`
#' @param padding implicit zero padding to be added on both sides
#' @param dilation a parameter that controls the stride of elements in the window
#' @param return_indices if `TRUE`, will return the max indices along with the outputs.
#'    Useful for  `nn_max_unpool1d()` later.
#' @param ceil_mode when `TRUE`, will use `ceil` instead of `floor` to compute the output shape
#' 
#' @section Shape:
#' - Input: \eqn{(N, C, L_{in})}
#' - Output: \eqn{(N, C, L_{out})}, where
#' 
#' \deqn{
#'   L_{out} = \left\lfloor \frac{L_{in} + 2 \times \mbox{padding} - \mbox{dilation}
#'     \times (\mbox{kernel\_size} - 1) - 1}{\mbox{stride}} + 1\right\rfloor
#' }
#' 
#' @examples
#' # pool of size=3, stride=2
#' m <- nn_max_pool1d(3, stride=2)
#' input <- torch_randn(20, 16, 50)
#' output <- m(input)
#' 
#' @export
nn_max_pool1d <- nn_module(
  "nn_max_pool1d",
  inherit = nn_max_pool_nd,
  forward = function(input) {
    nnf_max_pool1d(input, self$kernel_size, self$stride,
                   self$padding, self$dilation, self$ceil_mode,
                   self$return_indices)
  }
)

#' MaxPool2D module
#' 
#' Applies a 2D max pooling over an input signal composed of several input
#' planes.
#' 
#' In the simplest case, the output value of the layer with input size \eqn{(N, C, H, W)},
#' output \eqn{(N, C, H_{out}, W_{out})} and `kernel_size` \eqn{(kH, kW)}
#' can be precisely described as:
#'
#' \deqn{
#'   \begin{array}{ll}
#' out(N_i, C_j, h, w) ={} & \max_{m=0, \ldots, kH-1} \max_{n=0, \ldots, kW-1} \\
#' & \mbox{input}(N_i, C_j, \mbox{stride[0]} \times h + m,
#'                \mbox{stride[1]} \times w + n)
#' \end{array}
#' } 
#' 
#' If `padding` is non-zero, then the input is implicitly zero-padded on both sides
#' for `padding` number of points. `dilation` controls the spacing between the kernel points.
#' It is harder to describe, but this `link` has a nice visualization of what `dilation` does.
#' 
#' The parameters `kernel_size`, `stride`, `padding`, `dilation` can either be:
#' 
#' - a single `int` -- in which case the same value is used for the height and width dimension
#' - a `tuple` of two ints -- in which case, the first `int` is used for the height dimension,
#'   and the second `int` for the width dimension
#'   
#' @param kernel_size the size of the window to take a max over
#' @param stride the stride of the window. Default value is `kernel_size`
#' @param padding implicit zero padding to be added on both sides
#' @param dilation a parameter that controls the stride of elements in the window
#' @param return_indices if `TRUE`, will return the max indices along with the outputs.
#'   Useful for `nn_max_unpool2d()` later.
#' @param ceil_mode when `TRUE`, will use `ceil` instead of `floor` to compute the output shape
#' 
#' @section Shape:
#' - Input: \eqn{(N, C, H_{in}, W_{in})}
#' - Output: \eqn{(N, C, H_{out}, W_{out})}, where
#' 
#' \deqn{
#'   H_{out} = \left\lfloor\frac{H_{in} + 2 * \mbox{padding[0]} - \mbox{dilation[0]}
#'     \times (\mbox{kernel\_size[0]} - 1) - 1}{\mbox{stride[0]}} + 1\right\rfloor
#' }
#' 
#' \deqn{
#'   W_{out} = \left\lfloor\frac{W_{in} + 2 * \mbox{padding[1]} - \mbox{dilation[1]}
#'     \times (\mbox{kernel\_size[1]} - 1) - 1}{\mbox{stride[1]}} + 1\right\rfloor
#' }
#' 
#' @examples
#' # pool of square window of size=3, stride=2
#' m <- nn_max_pool2d(3, stride=2)
#' # pool of non-square window
#' m <- nn_max_pool2d(c(3, 2), stride=c(2, 1))
#' input <- torch_randn(20, 16, 50, 32)
#' output <- m(input)
#' 
#' @export
nn_max_pool2d <- nn_module(
  "nn_max_pool2d",
  inherit = nn_max_pool_nd,
  forward = function(input) {
    nnf_max_pool2d(input, self$kernel_size, self$stride,
                   self$padding, self$dilation, self$ceil_mode,
                   self$return_indices)
  }
)

