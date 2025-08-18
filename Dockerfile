FROM jekyll/jekyll:4.4.1

WORKDIR /srv/jekyll

# Copy project files
COPY . .

# Install gems
RUN bundle install --quiet

EXPOSE 4000

# Use bundle exec to ensure correct gem versions; bind to all interfaces for container use
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--host", "0.0.0.0"]
