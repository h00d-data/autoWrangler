# autoWrangler
Automatic data-wrangling in R for clean datasets

# autoWrangler 🧹📊

**autoWrangler** é um pacote R para **análise automática de qualidade de dados**.  
Ele identifica problemas comuns em datasets e classifica cada ocorrência por **nível de severidade**, sem quebrar seu pipeline.

Feito para **cientistas de dados, analistas e engenheiros** que querem diagnóstico rápido antes de modelar ou publicar dados.

---

## 🚀 O que o pacote faz

O `autoWrangler` analisa bases de dados e detecta automaticamente:

- Numéricos contaminados por texto  
- Colunas completamente vazias  
- Alta cardinalidade inesperada  
- Problemas estruturais silenciosos que quebram modelos depois  

Cada problema é classificado como:

- **INFO** – informativo
- **WARNING** – atenção recomendada
- **CRITICAL** – erro grave que pode invalidar análises

---

## 📦 Estrutura do pacote

autoWrangler/
│
├── R/
│ ├── run_wrangling.R
│ ├── load_data.R
│ ├── analyze_columns.R
│ └── severity.R
│
├── inst/
│ └── extdata/
│ └── example.csv
│
├── DESCRIPTION
├── NAMESPACE
└── README.md


## 🔧 Instalação (local)

install.packages("devtools")
devtools::load_all("autoWrangler")

-> O pacote ainda não está no CRAN. A instalação é local ou via Git.

## ▶️ Uso básico 

run_wrangling(
  file_path = "C:/Users/SeuID/Documents/cybersecurity_attacks_data.csv"
)

## 🚦 Ignorar colunas problemáticas

Caso você saiba que algumas colunas possuem problemas aceitáveis (ex: logs, user-agent, device info), basta informar:

run_wrangling(
  file_path = "dados.csv",
  ignored_columns = c("device.information", "user.agent")
)

-> Essas colunas não entram na análise de severidade, mas continuam existindo no dataset.

## ⛔ Parar execução em erros críticos

Se quiser interromper o script automaticamente ao encontrar erros CRITICAL:

run_wrangling(
  file_path = "dados.csv",
  stop_on_critical = TRUE
)

-> Ideal para pipelines de produção.


## 🧠 Tipos de erros detectados:

column              issue                   severity
-----------------------------------------------------
productcode     Numérico contaminado         CRITICAL
device.information    Alta cardinalidade     WARNING


## 📌 Boas práticas:

❌ Nunca use source() em arquivos .csv
✅ CSVs devem ser passados como caminho de arquivo
✅ Use ignored_columns para ajustes manuais
✅ Use stop_on_critical = TRUE em produção
















