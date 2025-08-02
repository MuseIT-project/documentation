# Transformations

Transformation refers to changing the format and structure of metadata. This is by far our most extensive process, and thus, will go into greater detail regarding approaches. Most of these flows produce a tangible product - either by transformation of data in various steps, and outputting intermediate or final data products, or files.

## Tools used

We distinguish various flows here; namely data flows and file flows, so named after the different outputs they provide. A brief list of tooling used:

Files:
- Minio (to host files)
- Image converter (to transform files)
- A number of loose scripts that result in ontologies or .ttl files for usage in graph databases

Data:
- The complete analyser stack (plotter, ChromaDB, analyzer, and various other 3d visualizations to make fancy 3d stuff)

### Data flows

Data flows output strictly data as an end product. This data can then be further used for ingestion, or as input to various other stacks.

- First; the descriptive data can be used as input for embeddings calculations in a 768-dimensional model such as `all-mpnet-base-v2`, through the Analyzer stack, or to calculate a third axis. Embeddings, as well as raw (meta)data are stored into the ChromaDB instance that runs alongside Analyzer.
    - These embeddings have further downstream products:
        - Usage for the stacked outputs by means of z-binning; this results in an array of 2d coordinates stacked by means of Z. The Z-axis can be determined using SentiArt, PageRank, or production years of the artworks. This provides a nuanced view of how topics evolve over years, as the similarity is processed in 2d in this method (thus placing topically similar clusters close-by)
        - 3d UMAP or tSNE coordinates to demonstrate topical similarity. These can be further faceted by Artist or Style.
    - Calculation of a third axis by means of [Pagerank](https://scikit-network.readthedocs.io/en/latest/tutorials/ranking/pagerank.html) or [SentiArt](https://github.com/matinho13/SentiArt/tree/main):
        - In the SentiArt approach, we calculate the value of each token (word in the description) by means of processing through the model. We then store a sum, and a mean for each artwork.
        - In the PageRank approach, we calculate a graph with all words in all descriptions as nodes. Then, we filter each artwork through this graph to establish how important it is in the entire collection.
- Secondly, from the perspective of internal quality control, we can use the rich descriptive data as input for a generative model as well. This results in an image - which is then rendered into image embeddings, along with the original. This allows us to approximate how accurate the description generation has been - assuming the base image is 100% similar to itself, and assuming the rendered image is some degree of dissimilar to the original, it means any intermediate products are at least as fidelitious as the generated image embedding. As an example - we render a description from the Mona Lisa, then use that description to generate another picture of the Mona Lisa, using only the description value. Cosine similarity of the resulting piece places it at 0.7 (or 70% similar). We now know that the description data at least 70% fidelitious.

### File flows

File flows output, well, files.

For downstream file output, we only ascribe to a single service at present; the [image converter service](https://github.com/MuseIT-project/image-converter). This tool takes in an original image, performs closest-neighbour for each pixel and various other transformations to allow it to be used with Pictures2Notes software.