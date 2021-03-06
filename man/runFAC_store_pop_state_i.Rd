% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runFAC_store_pop_state_i.R
\name{runFAC_store_pop_state_i}
\alias{runFAC_store_pop_state_i}
\title{Save current population state of model being run}
\usage{
runFAC_store_pop_state_i(
  i,
  minimum.i = 10,
  FAC.out,
  W.list,
  B0,
  P.breeding.pair.results,
  Y2,
  check.eq = T,
  ...
)
}
\arguments{
\item{i}{current iteration of model}

\item{minimum.i}{Minimum number of iterations over which to run model}

\item{FAC.out}{dataframe holding output of model for each iteraction}

\item{W.list}{list containing state of population after winter and fall migration}

\item{B0}{vector of....}

\item{P.breeding.pair.results}{vector representing pairing frequency of birds in source (".c") habitat the both originated from good (".gg") habitat on the wintering ground.}

\item{Y2}{vector of reproductive output (post migration?)}

\item{check.eq}{Should lambda be calculated}

\item{...}{Additional arguements}
}
\value{
FAC.out dataframe updated with population sizeds from time i
}
\description{
Save current population state of model being run
}
