# Workflow orchestrator

In order to enrich basic data from WikiArt, there is a need for a scalable, traceable process for such sort of workloads. These workloads share a number of common properties:

- They are tool agnostic - meaning, there should be no discrimination based on programming language or paradigm.
- They may utilize different resources; REST API's, prompts, whatever is needed. So web connectivity is required.
- Ingestion towards Dataverse is going to be a fixed part.

Based on the previous work produced by ODISSEI (now [SSHOC](https://sshoc.nl/)), we built our own toolchain to perform these operations for us.

## Processes

What we refer to is essentially an ETL pipeline, though the steps require a little more detail.

- Extraction; we harvest the data from WikiArt. This step was taken separately from the pipeline, handled through [a scraper](https://github.com/lucasdavid/wikiart). We then saved this data (since sometimes it goes missing from the source) and hosted it on an S3-compliant solution for files, and as a file within our pipeline for original metadata. This step won't be discussed in detail further since the application linked sufficiently covers it.
- Transformation; there are various transformation steps we use:
    - For files, we convert using the ImageConverter container; this produces the images required for Picture2notes
    - For metadata, we utilize various flows that use image vision models (LLava 34b), LLM's (Llama 70B) to produce rich descriptions and sensible keywords.
    - For plotting, we transform phrases into embeddings
- Loading depends on the flow used:
    - Files are typically uploaded to an S3-compatible container.
    - Metadata is deposited back to local file.
    - Plotting is ingested into a ChromaDB instance (and sometimes, exported to JSON directly)

## References and source

The work done is contained within the [repo](https://github.com/MuseIT-project/orchestrator-deployment-repo) on Github. The readme there both refers to the original project produced under ODISSEI and our version.