FROM balthek/zola:0.13.0

COPY . /app

WORKDIR /app

CMD [ "serve --interface 0.0.0.0 --port 8080 --base-url localhost" ]

# docker run -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app -p 8080:8080 balthek/zola:0.13.0 serve --interface 0.0.0.0 --port 8080 --base-url localhost