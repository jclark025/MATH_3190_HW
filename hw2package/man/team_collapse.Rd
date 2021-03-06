% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/team_collapse.R
\name{team_collapse}
\alias{team_collapse}
\title{Returns a row of college basketball total, home, and away stats}
\usage{
team_collapse(team, data)
}
\arguments{
\item{team}{the team to search for}

\item{y}{a df containing college basketball data}
}
\value{
df with college basketball stats
}
\description{
Returns a row of college basketball total, home, and away stats
}
\examples{
basketball <- get_data()
team_collapse("Southern Utah", basketball)
}
