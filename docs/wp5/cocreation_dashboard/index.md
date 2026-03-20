# Co-creation Platform

When co-creation happens, such as performers in a shared room, creators take in information actively and subconsciously. We listen to the pitch and music of the instrument played, but also watch pupil dilation, pheromones and hormones from the body, and flush or signs of arousal, engagement, and excitement from other participants. Until now, it has not been possible to encode, share, or receive such information remotely.

The Co-creation Platform is a software solution which allows two performers to exchange biometric information programmatically, and thus learn and be influenced by one another's mental and physiological states while co-creating. Biometric sensor data is encoded into the audio stream on the sending end. This is received on the other end, and expressed either visually or haptically. 

Participants may both be receivers and senders in this paradigm, allowing for a shared 'state' to be established.

## Underlying technologies and dependencies

The primary audio component is handled by [JackTrip](https://jacktrip.github.io/jacktrip/), developed by the University of Stanford. This service is a benchmark for low-latency audio calls, and especially when co-creating, an absolute necessity to keep latency minimal.

The co-creation dashboard uses a combination of Python + VueJS to build and start a dashboard in a single executable. This launches the backend, the frontend, and starts a search for connected services (which listen on sockets and communicate accordingly). These services provide feedback to the visualization or haptic components.