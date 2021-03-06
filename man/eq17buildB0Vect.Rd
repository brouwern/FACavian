% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eq17buildB0Vect.R
\name{eq17buildB0Vect}
\alias{eq17buildB0Vect}
\title{Equation 17: Build vector of Breeding ground abundances after pairing (B0)}
\usage{
eq17buildB0Vect(B.mc, B.mk, B.md, B.fc, B.fk)
}
\arguments{
\item{B.mc}{Abundance of males ("m") in source ("c") habitat on the breeding ground}

\item{B.mk}{Abundance of males in sink ("k") habitat on the breeding ground}

\item{B.md}{"Drain" males without territories in source or sink}

\item{B.fc}{Females in source habitat}

\item{B.fk}{Females in sink habitat}
}
\value{
B0 vector of breeding ground abundances after pairing of males and females
}
\description{
Equation 17: Build vector of Breeding ground abundances after pairing (B0)
}
\examples{
eq17buildB0Vect(B.mc = 10, B.mk = 10, B.md = 10, B.fc = 10, B.fk = 10)

}
\references{
Runge, MC and PP Marra.  2004.  Modeling seasonal interactions in the population dynamics of migratory birds. In Greenberg, R and PP Marra, eds.  Birds of two worlds. Johns Hopkins University Press, Baltimore.
}
