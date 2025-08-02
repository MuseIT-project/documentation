# Integration manual

This particular section is more aimed towards developers and those seeking to integrate picture2notes.

Integration of Picture2Notes can be done in two ways; either by hosting it locally and handling controls locally (sans), or by embedding everything through an iFrame. In the case of the Iframe, you will need to handle post Messages

## Deployment

The Picture2Notes app builds down to a simple Nginx docker container. No build engine is used - it's straight up copying the files, and letting the webserver take care of things.

Once you have the Docker container built (or pulled), there are two ways you can go about with this.

### Local development

Local development can be done by just using the docker-compose.yml file located inside the repo. Simple steps:

1. Clone the repo
2. `docker compose up`

If you're feeling fancy and want realtime refreshes, you can either look into using the excellent [live-server plugin with npm](https://www.npmjs.com/package/live-server) or adding a volume to your files.

### Production-esque

Production, typically, is when you build to a Docker image (change the `image` parameter inside the docker-compose.yml file to a repository of your needs), and then deploy that to a production env. The other option naturally would be just copying the files and running live-server as a daemonized process or so.

Keep in mind that neither of these setups natively deal with SSL termination; it is strongly advised (especially in the year of our Lord two thousand twenty five of this writing) to have SSL present, either by baking it into the Nginx image or having a reverse proxy or load balancer (using, for instance, Letsencrypt) do this for you.

Once you have it running, move on to query params first - then we'll deal with the iframe situation.

#### Iframe usage

## Usage

Picture2notes can be used in two ways: either by natively integrating images (using a menu with buttons) or by passing query params. The query params is a rather flexible integration, but required a second system to pass them.

### Query params

Query params is how Picture2notes gets information passed to it. There are a number of query params currently supported:

- 'imageSource': This expects a URL to be passed, pointing to an image. All types are supported, as long as they are web accessible.
- 'audioVolume': This expects a number between 0 and 100; 0 is effective mute, 100 is full volume.
- 'hapticIntensity': This expects a number between 0 and 255. 

### Modes & switching

tbd