FROM ruby:3
WORKDIR /app
COPY Gemfile Gemfile
COPY . /app
RUN bundle install
COPY . /myapp

# RUN curl -o /usr/local/bin/waitforit -sSL https://github.com/maxcnunes/waitforit/releases/download/$WAITFORIT_VERSION/waitforit-linux_amd64 && \
    # chmod +x /usr/local/bin/waitforit

# CMD [ "waitforit", "-address=http://localstack:4571", "-timeout=120", "--", "bundle", "exec", "shoryuken", "-q", "ramm.store", "-r", "./receiver.rb"]
CMD ['bundle exe ruby daemon.rb']
