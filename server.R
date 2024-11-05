library(shiny)
library(bslib)
source(file = "app_functions.R")
# Define the Server (Backend)
server <- function(input, output) {
  # Reactive for DNA sequence
  dna_seq <- reactive({
    base_probs <- c(input$prob_A, input$prob_T, input$prob_C, input$prob_G)
    tryCatch(
      {
        gene_dna(length = input$n_bases, base_probs = base_probs)
      },
      error = function(e) {
        paste("Error:", e$message)
      }
    )
  })
  
  # Reactive for RNA sequence
  rna_seq <- reactive({
    dna <- dna_seq()
    transcribe_dna(dna)
  })
  
  # Render DNA output
  output$dna <- renderText({
    dna_seq()
  })
  
  # Render RNA output
  output$rna <- renderText({
    rna_seq()
  })
  
  # Render Protein output
  output$protein <- renderText({
    translate_rna(rna_seq())
  })
}




