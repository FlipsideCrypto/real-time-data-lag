library(shiny)
source("global.R")


# Define UI ------

shinyUI(fluidPage(
  title = 'TITLE',
  useShinyjs(),
  
  tags$head(
    tags$link(rel = 'stylesheet', type = 'text/css', href = 'styles.css'),
    tags$link(rel = 'icon', href = 'fliptrans.png'),
    tags$link(rel = 'stylesheet', href = 'https://fonts.googleapis.com/css?family=Roboto+Mono'),
    tags$link(rel = 'stylesheet', href = 'https://fonts.googleapis.com/css?family=Inter')
  ),
  tags$head(tags$script(src = 'rudderstack.js')),
  tags$style(type='text/css',
             '.shiny-output-error { visibility: hidden; }',
             '.shiny-output-error:before { visibility: hidden; }'
  ),
  
  withTags({
    header(class='top-banner',
           section(
             a(class='fs-logo', href='https://www.flipsidecrypto.com', 
               'Powered by Flipside Crypto', onclick = 'rudderstack.track("ntr-click-flipside-icon")'),
             section(class='socials',
                     a(class='twitter', href='https://twitter.com/flipsidecrypto',
                       'Twitter', onclick = 'rudderstack.track("ntr-click-twitter-icon")'),
                     a(class='linkedin', href='https://www.linkedin.com/company/flipside-crypto',
                       'LinkedIn', onclick = 'rudderstack.track("ntr-click-linkedin-icon")'),
                     a(class='discord', href='https://flipsidecrypto.com/discord',
                       'Discord', onclick = 'rudderstack.track("ntr-click-discord-icon")'),
                     a(href='https://app.flipsidecrypto.com/auth/signup/', # redirects to xyz signup
                       'Sign Up', onclick = 'rudderstack.track("ntr-click-signup-icon")')
             )
           )
    )
  }),
  
  # APP LABEL HERE -----------------------------------  
  
  withTags({
    section(class='hero',
            h1(
              class='header', 
              'Flipside Data Lag', 
            ),
            p('Real time lag in minutes of [CHAIN].CORE.FACT_TRANSACTIONS.'),
    )
  }),
  
  # APP START HERE ----------------------------------- 
  
  div( # re-using chart classes to make smoother outlining
          class = 'chart-block',
      fluidRow(
        column(12, 
               actionButton(inputId = "rerun", label = "Force Refresh")
        ))),
  # EXAMPLE REACTABLE TABLE DIV ----
   # re-using chart classes to make smoother 
  div(
    class = 'chart-container',
    div(
      class = 'chart-block',
      div(class = 'chart-title', span('Latest [CHAIN].CORE.FACT_TRANSACTIONS Data')),
              reactableOutput("myreactable")
      )
    )
  
  # EXAMPLE WALLET CONNECT DIV ----
 
  
  
) # end FluidPage
) # end shinyUI