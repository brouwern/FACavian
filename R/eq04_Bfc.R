#' Equation 4: Allocate breeding females to Source habitat (B.fc)
#'
#' This function outputs \code{B.fc}, the number of females that acquire high quality "source" (._c) habitat during the breeding season
#'
#' This function compares total female population size after migration (\code{W2.fg + W2.fp}) to \code{K.bc} the source carrying capacity; if the total population of females is less than the carrying capacity (eg, code{(W2.fg + W2.fp) < K.bc}), all females acquire habitat in the source.  Therefore when the population is small all females are allocated to source habitat regardless of where they wintered.
#'
#' If \code{W2.fg + W2.fp > K.bc}, then the source habitat gets filled up completely.  Any additinal females will be allocated to the sink (._k) habitat in a subsequent step using a different allocation equation.
#'
#' Note that this allocation process returns just a scalar (single number).  The origin of the the birds isn't tracked at this step.
#'
#' The output of this function is used in equation 17.
#'
#' @param W2 Population vector produced after winter and northward migration survival.
#' @param K.bc carrying capacity of breeding ground (.k_) source (._c) habitat
#'
#' @return B.fc Total number of females (f) allocated to the source (c) habitat
#'
#'@references Runge, MC and PP Marra.  2004.  Modeling seasonal interactions in the population dynamics of migratory birds. In Greenberg, R and PP Marra, eds.  Birds of two worlds. Johns Hopkins University Press, Baltimore.
#'
#' @examples
#' # Set parameters:
#' ## Create named population W2 vector using the eq01buildW0vect()
#' ## 100 females originating from good winter habitat
#' ## 10 females originating from poor winter habitat
#' W2 <- eq01buildW0vect(100, 10, 100, 10)
#'
#' W2
#'
#' #Breeding habitat carrying capacity
#' K.bc.110 <- 110
#' K.bc.100 <- 100
#' K.bc.10  <- 10
#'
#' # The maximum number of birds that can be allocated to source habitat
#' # is the carrying capacity.
#' # When K.bc is 110, all 110 females are allocated to source
#' ## No birds will end up in sink in subsequent steps
#' eq04_Bfc(W2, K.bc.110)
#'
#' # If K.bc is 100, 100 birds will be allocated to source.
#' ## The 10 remaining will be shunted to sink in a subsequent step.
#' eq04_Bfc(W2, K.bc.100)
#'
#' # If K.bc is 10, only 10 birds will be allocated to source.
#' ## The 100 remaining, which are a mix of birds from good and poor winter habitat
#' ## will be allocated to sink habitat in a subsequent step.
#' eq04_Bfc(W2, K.bc.10)
#'
#' # If the number of birds is less than K.bc, then all will be allocated to source.
#' W2 <- eq01buildW0vect(50, 10, 50, 10) # 60 total birds
#' eq04_Bfc(W2, K.bc.110)                # All 60 allocated to source
#'
#' @export

eq04_Bfc <- function(W2,
                     K.bc
){
  if((unlist(W2["fg"]) + unlist(W2["fp"]))  < K.bc){
    B.fc <- unlist((W2["fg"]) + unlist(W2["fp"]))
  }else{
    B.fc <- unlist(K.bc)
  }

  #names(B.fc) <- "B.fc"
  return(B.fc)
}




