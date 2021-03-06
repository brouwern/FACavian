#' Test mate pairing equation against test dataframe
#'
#'
#' @param equation Mate pairing equation to test.
#' @param P.test.df A dataframe
#' @param print.i print iteration number for debugging
#'
#' @examples
#' P.test.df <- error_check_build_Ptest_df()
#' dim(P.test.df)
#'
#' error_check_P_test(equation = "eq9",P.test.df=P.test.df[10,])
#' error_check_P_test(equation = "eq10",P.test.df=P.test.df[10,])
#'
#' @export


error_check_P_test <- function(equation = "eq9",
                               P.test.df  = error_check_build_Ptest_df(),
                               print.i = FALSE){

  for(i in 1:nrow(P.test.df)){


    # Set up conditions for iteration i

    ## Population structure to test
    W2.i     <- P.test.df[i,c("mg","mp","fg","fp")]

    ## Carrying capacities to test
    ### stored in param.set-like object
    param.set.i <- P.test.df[i,c("K.bc","K.bk")]

    ## Allocate males and females to source habitat
    B.mc.i <- eq06_Bmc(W2.i, param.set.i$K.bc)
    B.fc.i <- eq04_Bfc(W2.i, param.set.i$K.bc)

    B.fk.i <- eq05_Bfk(W2 = W2.i,
                       K.bc = param.set.i$K.bc,
                       K.bk = param.set.i$K.bk)
    B.mk.i <- eq07_Bmk(W2.i, K.bc = param.set.i$K.bc,
                       B.fk = B.fk.i)


    ## Previous allocation values
    P.cgg <- P.test.df$P.cgg[i]
    P.cgp <- P.test.df$P.cgp[i]
    P.cpg <- P.test.df$P.cpg[i]
    P.cpp <- P.test.df$P.cpp[i]

    P.kgg <- P.test.df$P.kgg[i]
    P.kgp <- P.test.df$P.kgp[i]
    P.kpg <- P.test.df$P.kpg[i]
    P.kpp <- P.test.df$P.kpp[i]



    ## Check equation 9
    if(equation == "eq9"){
      P.focal <- "P.cgg"
      P.test.df[i,P.focal] <- eq09_Pcgg(W2 = W2.i,
                                      K.bc = param.set.i$K.bc,
                                      B.mc = B.mc.i,
                                      B.fc = B.fc.i)
       }
    ## Check equation 10
    if(equation == "eq10"){
      P.focal <- "P.cgp"
      P.test.df[i,P.focal] <- eq10_Pcgp(W2 = W2.i,
                                      K.bc = param.set.i$K.bc,
                                      B.mc = B.mc.i,
                                      B.fc = B.fc.i)
    }

    ## Check equation 11
   if(equation == "eq11"){
     P.focal <- "P.cpg"
     P.test.df[i,P.focal] <- eq11_Pcpg(W2= W2.i,
                           K.bc = param.set.i$K.bc,
                           B.mc = B.mc.i,
                           B.fc = B.fc.i)
   }



  ## Check equation 12
    #...

  ## Check equation 13
    if(equation == "eq13"){

      P.focal <- "P.kgg"
      P.test.df[i,P.focal] <- eq13_Pkgg(W2= W2.i,
                                        K.bc = param.set.i$K.bc,
                                        K.bk = param.set.i$K.bk,
                                        B.mk = B.mk.i,
                                        B.fk = B.fk.i)
    }


    ## Check equation 14
    if(equation == "eq14"){

      P.focal <- "P.kgp"
      P.test.df[i,P.focal] <- eq14_Pkgp(W2   = W2.i,
                                        K.bc = param.set.i$K.bc,
                                        K.bk = param.set.i$K.bk,
                                        B.mk = B.mk.i,
                                        B.fk = B.fk.i)

    }

    ## Check equation 15
    if(equation == "eq15"){

      P.focal <- "P.kpg"
      P.test.df[i,P.focal] <- eq15_Pkpg(W2   = W2.i,
                                        K.bc = param.set.i$K.bc,
                                        K.bk = param.set.i$K.bk,
                                        B.mk = B.mk.i,
                                        B.fk = B.fk.i)

    }

    ## Check equation 16
    if(equation == "eq16"){

      P.focal <- "P.kpp"

    }





  ## nan, na or inf errors
    if(is.nan(P.test.df[i,P.focal])      == T|
       is.na(P.test.df[i,P.focal])       == T|
       is.infinite(P.test.df[i,P.focal]) == T){
      warning("NaN,NA, or Inf errors in error check")

    }

  ## P > 1 error
     if(P.test.df[i,P.focal] > 1){
       warning("iteration ",i,
              "\n", P.focal,"> 1 for",
              "\n W2 = ",W2.i$mg," ",W2.i$fg,
              "\n B.mc.i = ",B.mc.i,
              "\n B.fc.i = ",B.fc.i,
              "\n Ks in param.set.i = ",param.set.i[1]," ",param.set.i[2])
       print(P.test.df[i,])

    }

  ## P < 1 error
    if(P.test.df[i,P.focal] < 0){
      warning("P.cgg < 0 for W2 = ",W2.i,
              "and param.set.i = ",param.set.i)

      }

  }

  return(P.test.df)
}
