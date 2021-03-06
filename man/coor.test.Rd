% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/coor.test.R
\name{coor.test}
\alias{coor.test}
\title{Randomization test for singing coordination}
\usage{
coor.test(X, iterations = 1000, less.than.chance = TRUE, parallel = 1, pb = TRUE, 
rm.imcomp = FALSE, cutoff = 2, rm.solo = FALSE)
}
\arguments{
\item{X}{Data frame containing columns for singing event (sing.event), 
individual (indiv), and start and end time of signal (start and end).}

\item{iterations}{number of iterations for shuffling and calculation of the expected number of overlaps. Default is 1000.}

\item{less.than.chance}{Logical. If \code{TRUE} the test evaluates whether overlaps occur less often than expected by chance.
If \code{FALSE} the opposite pattern is evaluted (whether overlaps occur more often than expected by chance). 
Default is  \code{TRUE}.}

\item{parallel}{Numeric. Controls whether parallel computing is applied.
It specifies the number of cores to be used. Default is 1 (i.e. no parallel computing).}

\item{pb}{Logical argument to control progress bar. Default is \code{TRUE}. Note that progress bar is only used
when parallel = 1.}

\item{rm.imcomp}{Logical. If \code{TRUE} removes the events that don't have 2 interacting individuals. Default is
\code{FALSE}.}

\item{cutoff}{Numeric. Determines the minimum number of signals per individual in a singing event. Events not meeting 
this criterium are removed if rm.imcomp is \code{TRUE}. If rm.icomp is \code{FALSE} cutoff is ignored. Default is 2. 
Note that randomization tests are not reliable with very small sample sizes. Ideally 10 or more signals per individual 
should be available in each singing event.}

\item{rm.solo}{Logical. Controls if signals that are not intercalated at the start or end of the 
sequence are removed (if \code{TRUE}). For instances the sequence of signals A-A-A-B-A-B-A-B-B-B (in which A and B represent different individuals, as in the 'indiv' column) would be subset to 
A-B-A-B-A-B. Default is  \code{FALSE}.}
}
\value{
A data frame with the observed number of overlaps (obs.overlaps), mean number of overlaps expected by chance,
and p value.
}
\description{
Monte Carlo randomization test to assess the statistical significance of singing coordination
}
\details{
This function calculates the probability of finding and equal or lower number 
(or higher if les.than.chance is \code{TRUE}) of song overlaps in a coordinated singing event. 
The function shuffles the sequences of signals and silence-between-signals for both individuals to produce 
a null distribution of expected number of overlaps by chance. The observed number of overlaps is compared to this
expected values. The p-values are calculated as the proportion of random expected values that were lower (or higher) 
than the observed value. The function runs one test for each singing event in the input data frame. The function 
is equivalent to the "KeepGaps" methods described in Masco et al. 2015.
}
\examples{
{
#load  simulated singing data (see data documentation)
data(sim.coor.sing)

# testing if coordination happens less than expected by chance
coor.test(sim.coor.sing, iterations = 100, less.than.chance = TRUE)

# testing if coordination happens more than expected by chance
coor.test(sim.coor.sing, iterations = 100, less.than.chance = FALSE)
}
}
\author{
Marcelo Araya-Salas (\email{araya-salas@cornell.edu})
}
\references{
Masco, C., Allesina, S., Mennill, D. J., and Pruett-Jones, S. (2015). The Song Overlap Null model Generator (SONG): a new tool for distinguishing between random and non-random song overlap. Bioacoustics. 1-12.
}

