% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eq02buildW1Mat.R
\name{eq02buildW1Mat}
\alias{eq02buildW1Mat}
\title{Equation 2: Build winter survival matrix (S.w)}
\usage{
eq02buildW1Mat(S.w.mg = 0.8, S.w.mp = 0.8, S.w.fg = 0.8, S.w.fp = 0.8)
}
\arguments{
\item{S.w.mg}{Survival (S) in the winter (w) of males (m) in good (g) habitat}

\item{S.w.mp}{Winter survival of males in poor (p) habitat.}

\item{S.w.fg}{Winter survival of female birds (f) in good habitat}

\item{S.w.fp}{Winter survival of females in poor habitat}
}
\value{
S.w (W1) matrix of winter (w) survival probabilities by sex and winter habitat
}
\description{
This function produces a diagonal matrix of survival (S.) values. in winter (S.w) for males (.m) and females (.f) in both good (._g) and poor (._p) habitat
}
\details{
TODO(): I call the matrix returned by the function S.w; why not W1?
}
\examples{
# Default winter survival matrix
eq02buildW1Mat()

# Errors thrown in values exceed 1 or are less than 0
\donttest{eq02buildW1Mat(S.w.mg = 10)}

}
\references{
Runge, MC and PP Marra.  2004.  Modeling seasonal interactions in the population dynamics of migratory birds. In Greenberg, R and PP Marra, eds.  Birds of two worlds. Johns Hopkins University Press, Baltimore.
}
