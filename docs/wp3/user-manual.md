# Introduction to HaptiVerse

This document aims to provide information for usage of the HaptiVerse software. The target audiences are:

- People who are interesting in haptics, and who wish to develop patterns for social haptic communication.
- Developers for haptic hardware, who wish to investigate intercompatibility with haptic patterns and need flexible software to iterate quickly.
- Researchers who work in social haptic communication who wish to create patterns, and test them on a device of their choosing.


## First steps
The first step is accessing the webinterface. Traditionally, this is hosted on an address like `https://haptidesigner.<yourwebhost>.<tld>`. In case you are trying to log in to something not hosted by MuseIT, or are self-hosting, contact the person who is hosting on your behalf to get credentials.

In case you are the person self-hosting, read on below.

### Getting credentials
The initial person who is in charge of your HaptiVerse instance, has likely got credentials with a set of different rights. These are referred to as `admin` level credentials. 

- When he/she logs in, he/she has a button on the top right of his HaptiDesigner instance, called "User management". 
- This is where he/she can create new users, set their permissions, and set/reset passwords.

If you are the person in charge of the HaptiVerse instance and are doing a fresh install (using Docker), you will need to create these credentials automatically. This is relatively straightforward:

- Go to your HaptiMux container; traditionally, this runs on port 8000, unless you've reconfigured this.
- HaptiMux has automatically generated documentation, courtesy of swagger. You may visit this on `http://localhost:8000/api/docs/`, which will provide you a set of URLs.
- As you can see when you arrive there, HaptiMux and HaptiDesigner communicate using encrypted traffic, using OAuth2 with a bearer token.
- When you initially arrive, the instance will be empty. Create a first user using the `/users` endpoint, entering your username and password in plaintext.
- If this is the first user in your instance, you will automatically be admin user.
- Next - try to login with the button for Login on top of the API documentation. If this is successful - congrations, you have a valid user for HaptiDesigner as well.

### Logging in

When you visit the page for HaptiDesigner, the very first thing you will see is the HaptiDesigner login screen.

- Click the top right, and enter the password/username you were provided with by the person managing your HaptiVerse instance.

You should now be logged in, and should see the initial screen for HaptiDesigner.

## HaptiDesigner

tbd

### The main supported actions & terminology

tbd

### Templates

tbd

#### Template specific actions

tbd

#### Designing templates

#### Making your template recognizable

### Haptograms

#### Creating your first haptic pattern

#### Frames, nodes, and previewing

#### Advanced usage - parallel activations in the same frame

#### The frame bar - on how to move frames around

### Sentences

## Streaming haptograms