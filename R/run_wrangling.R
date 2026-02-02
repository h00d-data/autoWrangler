run_wrangling <- function(
  file_path,
  ignored_columns = c(),
  stop_on_critical = FALSE,
  verbose = TRUE
) {

  if (verbose) {
    message("📦 Iniciando autoWrangler...")
  }

  df <- load_data(file_path)

  report <- analyze_columns(df, ignored_columns)

  if (nrow(report) == 0) {
    message("✅ Nenhum problema encontrado")
  } else {
    print(report)
  }

  if (stop_on_critical && any(report$severity == "CRITICAL")) {
    stop("❌ Execução interrompida devido a erros CRITICAL")
  }

  message("✅ Script finalizado com sucesso!")
  return(invisible(report))
}
