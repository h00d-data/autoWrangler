add_issue <- function(report, column, issue, severity) {
  report[nrow(report) + 1, ] <- list(
    column = column,
    issue = issue,
    severity = severity
  )
  return(report)
}
