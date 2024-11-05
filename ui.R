library(shiny)
library(bslib)
source(file = "app_functions.R")
# Define the User Interface (Frontend)
ui <- page_fluid(
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("Virtual Central Dogma"),
      style = "background-color: #f0f0f0; padding: 15px;"
    )
  ),
  layout_columns(
    col_widths = 12,
    card(
      titlePanel("About"),
      helpText("This app simulates DNA transcription and translation, generating RNA and protein sequences based on user-defined probabilities for each nucleotide base (A, T, C, and G).")
    )
  ),
  layout_columns(
    col_widths = 12,
    card(
      card_header("Virtual Gene Generator"),
      sliderInput(inputId = "n_bases",
                  label = "Number of bases:",
                  min = 3,
                  max = 60,
                  value = 30,
                  width = "100%"),
      layout_columns(
        col_widths = c(3, 3, 3, 3),
        numericInput(inputId = "prob_A",
                     label = "Probability of A",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_T",
                     label = "Probability of T",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_C",
                     label = "Probability of C",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1),
        numericInput(inputId = "prob_G",
                     label = "Probability of G",
                     value = 0.25,
                     min = 0,
                     max = 1,
                     step = 0.1)
      )
    )
  ),
  layout_columns(
    col_widths = 12,
    card(
      card_header("DNA, RNA, and Protein Output"),
      mainPanel(
        verbatimTextOutput(outputId = "dna"),
        verbatimTextOutput(outputId = "rna"),
        verbatimTextOutput(outputId = "protein")
      )
    )
  )
)
