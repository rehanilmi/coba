# Dockerfile
# Use ruby image to build our own image
FROM ruby:2.7.2

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

#RUN apt-get install -y vim

# gem ini selalu lama diinstall, jadi dibuat disini
RUN gem install nokogiri
RUN gem install openssl
RUN gem install pg
RUN gem install sassc 

# We specify everything will happen within the /app folder inside the container
WORKDIR /web
# We copy these files from our current application to the /app container
COPY Gemfile Gemfile.lock ./

# supaya tidak terlalu lama di install
RUN  bundle config build.nokogiri --use-system-libraries
RUN  bundle config build.openssl --use-system-libraries
RUN  bundle config build.pg --use-system-libraries
RUN  bundle config sassc.pg --use-system-libraries

# We install all the dependencies
RUN bundle install
# We copy all the files from our current application to the /app container
COPY . .

RUN yarn install --check-files

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# We expose the port
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]