# Ingestion

Ingestion is about moving intermediate products to an end-state, namely deposition in Dataverse. This is relatively straightforward.

## Tools used

This is very (nearly 95%) similar to how the original ODISSEI stack operates:

- Files are retrieved from the S3 storage(s).
- Metadata is mapped through the dataverse-mapper project, and passed to the dataverse-importer project.

It then ends up inside Dataverse.