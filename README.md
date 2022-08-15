# Flipside Crypto Real Time Data Lag

This is a small R Shiny app for tracking real time data lags in our [CHAIN].CORE.FACT_TRANSACTIONS across: Ethereum, Solana, Avalanche, Polygon, Flow, BSC, NEAR, Gnosis, Optimism, and Arbitrum.

## Data Quality Transparency

Transparency in data quality is critical for building trust with the community of analysts. Version 1 of this app focuses on **timeliness**. Additional metrics will be developed over time.

6 Metrics of data quality include:

-   accuracy: Data reflects reality.
-   completeness: Data is all there.
-   consistency: Data aligns across different formats and locations.
-   **timeliness**: Data is as recent as reasonable.
-   validity: Data format is logical for its location.
-   uniqueness: Data is repeated only where logical.

## renv

use `renv::restore()` (ensure you have renv downloaded) to restore the app libraries prior to testing on your machine. Note: shroomDK is in active development. This template may fall behind in shroomDK versions. Review the [documentation](https://github.com/FlipsideCrypto/sdk/tree/main/r/shroomDK) for more info.
