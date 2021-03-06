% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/content.R
\name{confl_content}
\alias{confl_content}
\alias{confl_list_pages}
\alias{confl_get_page}
\alias{confl_post_page}
\alias{confl_update_page}
\alias{confl_delete_page}
\title{REST Wrapper for the ContentService}
\usage{
confl_list_pages(
  type = c("page", "blogpost", "comment", "attachment"),
  limit = 10,
  start = 0,
  spaceKey = NULL,
  title = NULL,
  expand = NULL
)

confl_get_page(id, expand = "body.storage")

confl_post_page(
  type = c("page", "blogpost"),
  spaceKey,
  title,
  body,
  ancestors = NULL
)

confl_update_page(id, title, body, minor_edit = FALSE)

confl_delete_page(id)
}
\arguments{
\item{type}{The content type to return. Default value: \code{page}. Valid values: \code{page}, \code{blogpost}.}

\item{limit}{The limit of the number of items to return, this may be restricted by fixed system limits.}

\item{start}{The start point of the collection to return.}

\item{spaceKey}{The space key to find content under.}

\item{title}{The title of the page to find. Required for \code{page} type.}

\item{expand}{A comma separated list of properties to expand. To refer the nested
contents, use periods. (e.g. \verb{body.storage,history}).}

\item{id}{ID of the content.}

\item{body}{The HTML source of the page.}

\item{ancestors}{The page ID of the parent pages.}

\item{minor_edit}{If \code{TRUE}, will mark the \code{update} as a minor edit not notifying watchers.}
}
\value{
The API response as a list.
}
\description{
REST Wrapper for the ContentService
}
\examples{
\dontrun{
# Create a page titled "title1" on a space named "space1"
result <- confl_post_page(
  type = "page",
  spaceKey = "space1",
  title = "title1",
  body = "<h2>example</h2><p>This is example</p>"
)

# Jump to the result page
browseURL(paste0(result$`_links`$base, result$`_links`$webui))

# List pages under space "space1" up to 10 pages
confl_list_pages(spaceKey = "space1")
}

}
\seealso{
\url{https://docs.atlassian.com/ConfluenceServer/rest/latest/}
}
