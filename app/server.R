library(shiny)
source("global.R")
server <- function(input, output, session) {

latest_run <- eventReactive(input$rerun, {
  
  q <- shroomDK::create_query_token(query = query, 
                               api_key = readLines('api_key.txt'),
                               ttl = 1, cache = FALSE)
  
  q <- shroomDK::get_query_from_token(q$token, api_key = readLines('api_key.txt'))
  
  clean_query(q)
  })
  
  # Simple reactable - see: styles.css for formatting
  output$myreactable <- renderReactable({
    if(input$rerun == 0){
    reactable(latest_data,
              borderless = TRUE,
              outlined = FALSE)
      } else { 
        reactable(latest_run(),
                  borderless = TRUE,
                  outlined = FALSE)        
      }
  })
  

  
}