FROM wernight/phantomjs:2.1.1

USER root
RUN apt-get update && apt-get install -y ruby2.1 ruby2.1-dev zlib1g-dev liblzma-dev patch build-essential imagemagick && apt-get clean

COPY Gemfile Gemfile.lock /tmp/
RUN cd /tmp && gem2.1 i bundler && bundle

ENTRYPOINT ["wraith"]
