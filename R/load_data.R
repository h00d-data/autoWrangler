load_data <- function(file_path) {

  if (!file.exists(file_path)) {
    stop("❌ Arquivo não encontrado")
  }

  ext <- tools::file_ext(file_path)

  if (ext == "csv") {
    df <- read.csv(file_path, stringsAsFactors = FALSE)
  } else if (ext == "xlsx") {
    if (!requireNamespace("readxl", quietly = TRUE)) {
      stop("❌ Pacote 'readxl' não instalado")
    }
    df <- readxl::read_xlsx(file_path)
  } else if (ext == "rds") {
    df <- readRDS(file_path)
  } else {
    stop("❌ Formato de arquivo não suportado")
  }

  if (nrow(df) == 0) {
    stop("❌ Dataset carregado, porém sem linhas")
  }

  return(df)
}
