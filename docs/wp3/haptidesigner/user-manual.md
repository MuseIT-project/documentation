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

Observe the following screen:

![Initial screen of HaptiDesigner](images/haptidesigner_1.png)

The following things are provided:

1. Navigation elements, located on the top right.
2. Tab actions, located in the lower bar. We'll address those in a moment.
3. The template selection (and various other selection interfaces); this is how you select your current work.
4. The main designer component; this will show what you're presently working on.

### The main supported actions & terminology

HaptiDesigner allows one to design various aspects of haptic communication. We refer to these as follows:

- Templates are a haptic canvas - a Carthesian grid of actuators, which are addressable by integers. This is, in short, your virtual haptic device, and the patterns you are about to draw, will need to address this device.
- Haptograms are the patterns you will design upon your canvas - these are the haptic impulses or directives you will send to the person wearing your vest. Haptograms have some further nuances to explore, which we'll do later in this documents.
- Finally, sentences are compound structures of haptograms, allowing you to design meaning-bearing compound structures and send them to your users, in order to verify they are playing fast or slow enough to understand them.

As admin user, you have one extra button:

- User managenent allows you to create, deactivate, activate, promote, or demote users. You can also set their passwords here.

For each of these tabs, various actions are supported.

1. *Add*; creates a new instance of the tab you're presently on (a new template for Templates, a new empty haptogram for Haptograms, etc)
2. *Rename*; renames the currently selected object
3. *Delete*; this deletes the current object. A number of nuances here; if you are a user, you can only remove your own objects, insofar they are not in use by any other dependent structure (ie, you cannot delete a template if you have haptograms that depend on it).
4. *A-Z / Z-A*; allows you to sort in alphabetical or reverse alphabetical order.
5. *Duplicate*; duplices your currently selected object, renaming it in the process to identify it as a duplicate.

As an admin, you have further actions available:

1. *Promote*; Promotes the selected object to the common library. Items in the common library are available to all users.
2. *Demote*; Demotes the selected object to your own user library. This is only possible for items that have not been used by any users; ie, it's an "undo" for promote.

### Templates

![Template screen](images/haptidesigner_2.png)

Templates are the haptic equivalent of device interfaces. We adhere to the following terminology here:

| Term                | Meaning                                                                                                                                                                |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Template            | The complete structure of template nodes, representing <br>a haptic device                                                                                             |
| Template node       | A single node within a template, representing a <br>single actuator in a haptic device                                                                                 |
| Enabled/disabled    | Whether or not a template node is activated for <br>usage; this can be useful when avoiding defective <br>actuators or to create non-Carthesian templates (as spacing) |
| Index               | The positive-integer address of a single actuator - this is <br>we will refer to this actuator to, when we stream<br>data to your interface.                           |
| Shape               | A shape to visually identify your template node. Shapes can <br>be used to differentiate between different locations for<br>actuators.                                 |
| Forecolor/backcolor | Coloring schemes allowing you to visually identify/distinguish<br>between different actuator placements or types.                                                      |

#### Template specific actions

A number of specific actions exist for templates:

- Index setting/resetting: Your device might not follow sequential addressing (due to wiring, defective actuators, etc) at all times. Changing the index will allow you to support such configurations. Consequently; removing indexes is an en-masse effect that removes any overrides from the index.
- Shape/color changes; in order to visually distinguish your template nodes, you can change the shape and colors for them to create your own conventions (such as; triangles for shoulders, squares for lower back).
- Disabling/enabling; a template may be disabled or enabled, to avoid it from taking part in haptogram design. This can be useful if your actuators aren't spaced out as a Carthesian grid, creating empty space between actuators visually.

#### Designing templates & making your template recognizable

When designing a template, the following things should be considered:

1. How many actuators are you going to be addressing? This will ultimately determine the minimum amount of actuators you'll need to have enabled at any point in time.
2. How are your actuators spaced out? Are you working with a strict grid, or are you working with empty spaces? If so - create a larger template.
3. Where are your actuators located? Conceptually, how many zones are you going to be addrssing? This will determine what kind of shapes/colors you'll need.
4. Finally, name your template appropriately - often, the name of the device you plan to be addressing, and perhaps an identifying characteristic, are good hallmarks for design.

### Haptograms

#### Creating your first haptic pattern

#### Frames, nodes, and previewing

#### Advanced usage - parallel activations in the same frame

#### The frame bar - on how to move frames around

### Sentences

## Streaming haptograms