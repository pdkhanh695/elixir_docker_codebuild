# Build Stage 
FROM elixir:alpine AS app_builder

# Set environment variables for building the application
ENV REPLACE_OS_VARS=true
ENV MIX_ENV=prod \
    TEST=1 \
    LANG=C.UTF-8

RUN apk add --update git && \
    rm -rf /var/cache/apk/*

# Install hex and rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Create the application build directory
RUN mkdir /app
WORKDIR /app

# Copy over all the necessary application files and directories
COPY config ./config
COPY lib ./lib
COPY priv ./priv
COPY mix.exs .
COPY mix.lock .

# Fetch the application dependencies and build the application
RUN mix deps.get
RUN mix deps.compile
RUN mix release

# Application Stage 
FROM alpine AS app

ENV LANG=C.UTF-8

# Install openssl
RUN apk add --update openssl ncurses-libs postgresql-client && \
    rm -rf /var/cache/apk/*

# Copy over the build artifact from the previous step and create a non root user
RUN adduser -D -h /home/app app
WORKDIR /home/app
COPY --from=app_builder /app/_build .
RUN chown -R app: ./prod
USER app


COPY entrypoint.sh .

ENV APP_PORT=4000
ENV APP_HOSTNAME=localhost
ENV DB_USER=postgres
ENV DB_PASSWORD=postgres
ENV DB_HOST=postgres.chjup0ji0a5y.us-east-1.rds.amazonaws.com
ENV SECRET_KEY_BASE=FgpNsLszr+jdqyiHytZQNZ+FXUCK1yIUJEPUOUtJXEZK91ju/jFaGjwYaQDSQCkM

# Run the Phoenix app
CMD ["sh","./entrypoint.sh"]