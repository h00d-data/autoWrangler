analyze_columns <- function(df, ignored_columns) {

  report <- data.frame(
    column = character(),
    issue = character(),
    severity = character(),
    stringsAsFactors = FALSE
  )

  for (col in names(df)) {

    if (col %in% ignored_columns) {
      next
    }

    x <- df[[col]]

    # Numérico contaminado
    if (is.character(x)) {
      suppressWarnings(num <- as.numeric(x))
      if (any(!is.na(x) & is.na(num))) {
        report <- add_issue(
          report,
          col,
          "Numérico contaminado",
          "CRITICAL"
        )
      }
    }

    # Cardinalidade alta
    if (length(unique(x)) > 0.9 * length(x)) {
      report <- add_issue(
        report,
        col,
        "Alta cardinalidade",
        "WARNING"
      )
    }

    # Coluna vazia
    if (all(is.na(x))) {
      report <- add_issue(
        report,
        col,
        "Coluna totalmente vazia",
        "CRITICAL"
      )
    }
  }

  return(report)
}
