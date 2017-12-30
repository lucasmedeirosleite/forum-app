FROM ruby:2.4.2

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
    apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install -y build-essential \
                       libpq-dev \
                       postgresql-client \
                       nodejs \
                       procps libicu-dev --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

ENV APP_HOME /forum
ENV RAILS_ENV development

WORKDIR $APP_HOME

ENV GEM_HOME /gems
ENV BUNDLE_PATH $GEM_HOME
ENV PATH $GEM_HOME/bin:$PATH
ENV HISTFILE $APP_HOME/tmp/docker_histfile

ADD . $APP_HOME
ADD .bashrc /root/.bashrc

ENV LANG C.UTF-8
RUN bundle config --global jobs 2

CMD ./scripts/build
