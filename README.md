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
├── DESCRIPTION
├── NAMESPACE
├── README.md
├── .gitignore
│
├── R/
│   ├── run_wrangling.R
│   ├── load_data.R
│   ├── analyze_columns.R
│   ├── severity.R
│
└── inst/
    └── extdata/
        └── example.csv



