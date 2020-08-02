FROM elixir:1.10.4-slim
ENV DEBIAN_FRONTEND=noninteractive

# Create the application build directory

# When this image is run, make /app the current working directory
RUN mkdir /app
WORKDIR /app

# Suggested https://hexdocs.pm/phoenix/installation.html
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get update
RUN apt-get install -y inotify-tools
# Install hex
RUN mix local.hex --force

# Install rebar
RUN mix local.rebar --force

# Install the Phoenix framework itself
RUN mix archive.install hex phx_new 1.5.4 --force
RUN mix archive.install hex sobelow --force

# Install NodeJS and the NPM
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
