FROM ruby:3.0.1-alpine
RUN apk --update --no-cache add \
   bash \
   binutils-gold \
   build-base \
   curl \
   file \
   g++ \
   gcc \
   less \
   git \
   libstdc++ \
   libffi-dev \
   libc-dev \
   linux-headers \
   libxml2-dev \
   libxslt-dev \
   libgcrypt-dev \
   make \
   mysql \
   mysql-client \
   mysql-dev \
   netcat-openbsd \
   nodejs \
   openssl \
   pkgconfig \
   shared-mime-info \
   tzdata \
   yarn \
   vim \
   && rm -rf /var/cache/apk/*

ENV LANG=C.UTF-8 \
   BUNDLE_JOBS=4 \
   BUNDLE_RETRY=5 \
   BUNDLE_DISABLE_PLATFORM_WARNINGS=true
# Uncomment this line if you want to run binstubs without prefixing with `bin/` or `bundle exec`
# ENV PATH /app/bin:$PATH
RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN mkdir -p /usr/local/etc
COPY ./docker/gemrc.yml /usr/local/etc/gemrc
RUN bundle config build.nokogiri --use-system-libraries
RUN gem install bundler --version '~> 2.2.15'
RUN bundle install
COPY package.json yarn.lock ./
RUN yarn install --check-files
COPY ./ /app/
