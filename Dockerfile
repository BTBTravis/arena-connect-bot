FROM elixir:latest
# inspiration from https://pspdfkit.com/blog/2018/how-to-run-your-phoenix-application-with-docker/

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force

# Compile the project
RUN mix do compile

#CMD [mix, phx.server]
CMD ["mix", "phx.server"]

