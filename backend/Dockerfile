FROM rust:latest

WORKDIR /app/

COPY . .

# install psql
RUN apt update
RUN apt install postgresql-client -y
# install the diesel cli
RUN cargo install diesel_cli --no-default-features --features postgres
# install cargo-watch
RUN cargo install cargo-watch

# rebuild automatically when source code changes
CMD ["cargo", "watch", "--why", "-x", "build"]
