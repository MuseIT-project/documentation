# Setup & Requirements

Setting up requires access to the [X-System repository](https://github.com/xsystemltd/museit). Please reach out to X-System to get access. 

For the sake of convenience, instructions are below.

## MuseIT Co-Creation Platform
### Windows setup
Download and install python 3.10 or above from https://www.python.org/.

Download and install latest LTS version of Node (currently 20.12.1).

Install yarn:
- Run cmd/powershell as admin
- Run `corepack enable`
- Close the admin shell

### Running the frontend
Make and activate a virtualenv then run:

```.bash
cd backend
pip install -r requirements.txt
pip install -e .
```

You'll also need to make sure you have yarn installed and run:
```.bash
cd frontend
yarn install
```

Then you can run everything with:

```.bash
python -m museit_backend
```

The backend process will spawn the frontend for you.

If you want hot-reloading for the python code during development install jurigged:

```.bash
pip install jurigged
```

Then you can run the app with:

```.bash
jurigged --watch [path to backend] -m museit_backend
```

### Running backend services
The backend services can be run with either docker compose, or podman compose.

First change to the backend directory:
```.bash
cd backend
```

Build the services if necessary:
```.bash
docker compose build
```

Then run them:
```.bash
docker compose up -d
```

If you only want to run a single service (eg musicgen) you can run it with:
```.bash
docker compose up -d musicgen
```