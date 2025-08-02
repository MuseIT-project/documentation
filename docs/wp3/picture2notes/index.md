# Introduction

Picture2notes is a Javascript application which is responsible for translating a processed image into different types of modalities.

## Topics & references

A few topics are covered:

- A user guide, which can be found [here](user-manual.md)
- An integration guide, which can be found [here](integration_manual.md)
- And lastly, a guide wouldn't be complete without access to the source code, located [here](https://github.com/MuseIT-project/pictures2notes)

## Use-cases

- Convert images to haptics, sound, and texture
- Validate ideas of the clearinghouse
- Act as a middleman for getting, structuring, and passing on data to various platforms.

## Concepts

Various concepts underpin the Picture2Notes application. These are explained in further detail below.

### Clearinghouse

Merriam Webster defines a clearinghouse thus:

```
clearinghouse
noun
clear·​ing·​house ˈklir-iŋ-ˌhau̇s 
1
: an establishment maintained by banks for settling mutual claims and accounts
2
: a central agency for the collection, classification, and distribution especially of information
broadly : an informal channel for distributing information or assistance
```

In the context in which we are using it, it may be said that one exchanges a type of information for something else - namely information which corresponds to a different modality.

First, it is important to consider what a painting is

#### Color

- First of all, we take a picture, which ultimately is a collection of colors. By converting these colors to a predetermined scheme and compressing them to 60 possibilities - we outline the options of the clearinghouse.
- The colors, based off Scriabin's work involving synesthesia, form a color circle and a musical circle of fifths. Thus - we now have mapped color and sound to the same scale.
- Haptically, we express color as an RGB value. Using three actuators, we are able to provide haptic feedback to a connected device, allowing a person to associate color with haptic information.

#### Contours

A contour is a delineation between different zones on a painting, typically to isolate background from foreground, or subject from subject.

- First, we collect these contours programmatically, and then express them in a single pure red frequency (255,0,0)
- Next, when we load an image with this frequency, we do the following:
    - Express the proximity to a contour as a monotone, which gets louder as one gets closer.
    - Express the proximity to a contour as a haptic intensity, which gets more intensive as one gets closer.

#### Concepts

Concepts are the subjects that appear on the painting. On a high level, we can use AI to establish, and express such concepts in both audible and haptic language.

- First, we process the images using an AI model. This gives us a rich description.
- We then compress that description into Haptic Subject Index; a very high level language for concepts and facts of a painting. Based on the description and image context, we are able to isolate (1) time of day (2) subject (3) subject age (4) type of painting.
- These concepts are either spoken audibly, or are communicated haptically.

### Supported technology

Picture2notes has several subcomponents in order to have it do it's work. These are outlined below.

#### Haptic streaming

Picture2notes does not natively talk to haptic devices. For this purpose, it depends on [Haptiverse][https://museitdocs.wizardtower.dev/wp3/haptidesigner/]. Here it uses a websocket connection and an import script to connect to specific devices.

#### Image conversion

A small container (based on an original Jupyter notebook) has been built to facilitate with image construction. This can either be directly called (as it has a RESTful API), or can be integrated into the [Workflow Orchestrator](https://museitdocs.wizardtower.dev/wp3/workflows/)