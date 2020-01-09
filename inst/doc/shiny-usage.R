## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----setup--------------------------------------------------------------------
#  library(shiny)
#  library(esquisse)

## -----------------------------------------------------------------------------
#  ui <- fluidPage(
#  
#    titlePanel("Use esquisse as a Shiny module"),
#  
#    sidebarLayout(
#      sidebarPanel(
#        radioButtons(
#          inputId = "data",
#          label = "Data to use:",
#          choices = c("iris", "mtcars"),
#          inline = TRUE
#        )
#      ),
#      mainPanel(
#        tabsetPanel(
#          tabPanel(
#            title = "esquisse",
#            esquisserUI(
#              id = "esquisse",
#              header = FALSE, # dont display gadget title
#              choose_data = FALSE # dont display button to change data
#            )
#          ),
#          tabPanel(
#            title = "output",
#            verbatimTextOutput("module_out")
#          )
#        )
#      )
#    )
#  )
#  
#  
#  server <- function(input, output, session) {
#  
#    data_r <- reactiveValues(data = iris, name = "iris")
#  
#    observeEvent(input$data, {
#      if (input$data == "iris") {
#        data_r$data <- iris
#        data_r$name <- "iris"
#      } else {
#        data_r$data <- mtcars
#        data_r$name <- "mtcars"
#      }
#    })
#  
#    result <- callModule(
#      module = esquisserServer,
#      id = "esquisse",
#      data = data_r
#    )
#  
#    output$module_out <- renderPrint({
#      str(reactiveValuesToList(result))
#    })
#  
#  }
#  
#  shinyApp(ui, server)

## -----------------------------------------------------------------------------
#  ?`module-filterDF`
#  
#  run_module("filterDF")

## -----------------------------------------------------------------------------
#  ?`module-chooseData`
#  
#  run_module("chooseData")

## -----------------------------------------------------------------------------
#  run_module("chooseData2")

## -----------------------------------------------------------------------------
#  ?`module-coerce`
#  
#  run_module("coerce")

## -----------------------------------------------------------------------------
#  ui <- fluidPage(
#    tags$h2("Demo dragulaInput"),
#    tags$br(),
#    dragulaInput(
#      inputId = "dad",
#      sourceLabel = "Source",
#      targetsLabels = c("Target 1", "Target 2"),
#      choices = names(iris),
#      width = "400px"
#    ),
#    verbatimTextOutput(outputId = "result")
#  )
#  
#  
#  server <- function(input, output, session) {
#  
#    output$result <- renderPrint(str(input$dad))
#  
#  }
#  
#  shinyApp(ui = ui, server = server)

## -----------------------------------------------------------------------------
#  ui <- fluidPage(
#    tags$h2("Drop Input"),
#    dropInput(
#      inputId = "mydrop",
#      choicesNames = tagList(
#        list(icon("home"), style = "width: 100px;"),
#        list(icon("flash"), style = "width: 100px;"),
#        list(icon("cogs"), style = "width: 100px;"),
#        list(icon("fire"), style = "width: 100px;"),
#        list(icon("users"), style = "width: 100px;"),
#        list(icon("info"), style = "width: 100px;")
#      ),
#      choicesValues = c("home", "flash", "cogs",
#                        "fire", "users", "info"),
#      dropWidth = "220px"
#    ),
#    verbatimTextOutput(outputId = "res")
#  )
#  
#  server <- function(input, output, session) {
#    output$res <- renderPrint({
#      input$mydrop
#    })
#  }
#  
#  shinyApp(ui, server)

## -----------------------------------------------------------------------------
#  ui <- fluidPage(
#    tags$h2("Color Picker"),
#    colorPicker(
#      inputId = "col",
#      label = "Choose a color:",
#      choices = scales::brewer_pal(palette = "Dark2")(8),
#      textColor = "white"
#    ),
#    verbatimTextOutput(outputId = "res")
#  )
#  
#  server <- function(input, output, session) {
#    output$res <- renderPrint({
#      input$col
#    })
#  }
#  
#  shinyApp(ui, server)

## -----------------------------------------------------------------------------
#  library(scales)
#  ui <- fluidPage(
#    tags$h2("Palette Picker"),
#    palettePicker(
#      inputId = "pal",
#      label = "Choose a palette",
#      choices = list(
#        "Viridis" = list(
#          "viridis" = viridis_pal(option = "viridis")(10),
#          "magma" = viridis_pal(option = "magma")(10),
#          "inferno" = viridis_pal(option = "inferno")(10),
#          "plasma" = viridis_pal(option = "plasma")(10),
#          "cividis" = viridis_pal(option = "cividis")(10)
#        ),
#        "Brewer" = list(
#          "Blues" = brewer_pal(palette = "Blues")(8),
#          "Reds" = brewer_pal(palette = "Reds")(8),
#          "Paired" = brewer_pal(palette = "Paired")(8),
#          "Set1" = brewer_pal(palette = "Set1")(8)
#        )
#      ),
#      textColor = c(
#        rep("white", 5), rep("black", 4)
#      )
#    ),
#    verbatimTextOutput(outputId = "res")
#  )
#  
#  server <- function(input, output, session) {
#    output$res <- renderPrint({
#      input$pal
#    })
#  }
#  
#  shinyApp(ui, server)

