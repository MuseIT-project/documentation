# Enrichment

Enrichment is the process of creating more, or adding more data to existing data. This is typically used to create meaningful content to use.

## Tools

In order to be founded on something, there must always be either a secondary source of data to combine the original data with. The art lies in knowing, and establishing meaningful benchmarks for that data.

Say that we wish to generate an image for a certain dataset; this requires a description to be available, which must then be supplied to a generative model to produce such as image. In short, this outlines (in high level terms) our tooling.

- First of all, we used the aforementioned WikiArt Scraper to acquire content from both a curated list of 300 items, and the available items from WikiArt Emotions dataset.
    - For both sets - we scraped all metadata, and all available image files. Sometimes, these files are missing (because Wikiart, for instance, moved them).
- In order to enrich, we used several types of models and prompts:
    - First, an image vision model (34b weights) to produce descriptive text. The images were converted to an appropriate format, then a prompt was provided to the model to generate a description based on those embeddings. We experimented with smaller models (4b, 17b) as well, but found that the size of the model directly corresponded with the qualitative nature of the output.
    - Next, an LLM to condense the description down in two ways. Firstly, to generate a set of keywords based on the description data. Secondly, to generate Haptic Subject Index terms from the description data. In the case of both, this required a rather powerful model (70b) to get any significant output length.

Most of these enrichments were done as a single flow, using a model under Ollama as a remote service (similar to other services in the orchestrator).

## Workflows and usage

The workflows detailed for this are located within [the enrichment directory](https://github.com/MuseIT-project/orchestrator-deployment-repo/tree/main/scripts/flows/museit/enrichment) of the repo.