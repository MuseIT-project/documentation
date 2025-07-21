FROM python:3.12-alpine
WORKDIR /site 
COPY . /site
RUN pip install -r requirements.txt
EXPOSE 4040
CMD ["mkdocs", "serve", "--dev-addr", "0.0.0.0:4040"]
