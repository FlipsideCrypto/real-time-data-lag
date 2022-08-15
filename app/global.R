library(shinyjs)
library(shroomDK)
library(data.table)
library(plotly)
library(dplyr)
library(reactable)

query <- 
  "
with lag_info AS (
SELECT 'ETHEREUM' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM ethereum.core.fact_transactions UNION 
SELECT 'SOLANA' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM solana.core.fact_transactions UNION
SELECT 'AVALANCHE' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM avalanche.core.fact_transactions UNION
SELECT 'POLYGON' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM polygon.core.fact_transactions UNION
SELECT 'FLOW' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM flow.core.fact_transactions UNION
SELECT 'BSC' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM bsc.core.fact_transactions UNION
SELECT 'NEAR' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM near.core.fact_transactions UNION
SELECT 'GNOSIS' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM gnosis.core.fact_transactions UNION
SELECT 'OPTIMISM' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM optimism.core.fact_transactions UNION
SELECT 'ARBITRUM' as chain, MAX(BLOCK_TIMESTAMP) as latest_data, TIMESTAMPDIFF(minute, CURRENT_TIMESTAMP, MAX(BLOCK_TIMESTAMP)) as lag_minutes FROM arbitrum.core.fact_transactions
)

SELECT * FROM lag_info ORDER BY LAG_MINUTES ASC;
"

latest_data <- auto_paginate_query(query, readLines('api_key.txt'))
