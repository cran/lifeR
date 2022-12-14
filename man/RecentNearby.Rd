% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RecentNearby.R
\name{RecentNearby}
\alias{RecentNearby}
\title{Recent nearby eBird observations}
\usage{
RecentNearby(
  key,
  lat = 32.241,
  lng = -110.938,
  dist = 50,
  back = 4,
  hotspot = TRUE,
  include_provisional = FALSE,
  max_tries = 5,
  timeout_sec = 30,
  verbose = TRUE
)
}
\arguments{
\item{key}{Character eBird API key.}

\item{lat}{Numeric latitude; use negative values for southern latitudes
(i.e. -46.86, \emph{not} "46.86 S).}

\item{lng}{Numeric longitude; use negative values for western
longitudes (i.e. -72.08, \emph{not} "72.08 W").}

\item{dist}{Numeric radius in kilometers of distance from geographic center 
point given by \code{lat} and \code{lng} from which to return recent 
observations.}

\item{back}{Integer number of days back to search for observations.}

\item{hotspot}{Logical indicating whether or not to restrict results to
hotspot locations.}

\item{include_provisional}{Logical indicating whether or not to include
observations which have not yet been reviewed.}

\item{max_tries}{Integer maximum number of query attempts to try.}

\item{timeout_sec}{Integer time to allow before query is aborted.}

\item{verbose}{Logical determining whether or not to print messages during
queries.}
}
\value{
An object of class "recent_obs" with the following elements:
\describe{
  \item{query_type}{The type of query performed.}
  \item{query_parameters}{List of query parameters passed in request.}
  \item{obs}{data frame of observations returned from query; if no
  observations are returned, \code{obs} is \code{NULL}}. Columns include:
    \describe{
      \item{speciesCode}{The (usually) six-letter species code, see 
      \url{https://science.ebird.org/en/use-ebird-data/the-ebird-taxonomy/}}
      \item{comName}{Species' common name.}
      \item{sciName}{Species' scientific name.}
      \item{locId}{eBird identifier of the location.}
      \item{locName}{Name of the location.}
      \item{obsDt}{Observation date as character string in the format 
      "YYYY-MM-DD HH:MM".}
      \item{howMany}{Number of individuals.}
      \item{lat}{Decimal latitude.}
      \item{lng}{Decimal longitude.}
      \item{obsValid}{Logical indicating if observation marked as valid.}
      \item{obsReviewed}{Logical indicating if observation has been reviewed.}
      \item{locationPrivate}{Logical indicating whether or not location is 
      designated as private.}
      \item{subId}{Checklist ID for this observation.}
   }
}
}
\description{
Recent nearby eBird observations
}
\details{
The function uses the eBird API (see \url{https://documenter.getpostman.com/view/664302/S1ENwy59/})
to query recent sightings. Queries to the eBird API require a user key; more
information on obtaining a key can be found at the eBird API documentation.
}
\examples{
\dontrun{
  # Read eBird key in from file
  key <- scan(file = "ebird-key.txt", what = "character")
  # Search for observations 5 km from lat/lng coordinates
  recent <- RecentNearby(key = key, lat = 32.28, lng = -111.02, dist = 5)
}

}
