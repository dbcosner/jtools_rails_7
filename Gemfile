source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

##### Stuff I added #####

# TODO : specify version once Rails 7 support is in an official release :
gem 'mongoid', git: 'https://github.com/mongodb/mongoid'

# Safer download of binary files. Read more: https://www.twilio.com/blog/download-image-files-ruby
gem 'down', '~> 5.2.0'

# Extract a wider variety of archives. Read more: https://www.rubydoc.info/gems/extracter/1.2.8
gem 'extracter', '~> 1.2.0'

# Use the command pattern for services. Read more: https://github.com/iHiD/mandate
gem 'mandate', '~> 1.0.0'

# Parse Japanese phrases and sentences. Read more: https://github.com/Kimtaro/ve
gem 've', '~> 0.0.0', '>= 0.0.4'

# Convert between hiragana, katakana, and romaji
gem 'mojinizer', '~> 0.2'

# Add Bootstrap 5 support. View more: https://www.youtube.com/watch?v=phOUsR0dm5s
gem 'cssbundling-rails'

group :development, :test do
  gem 'awesome_print'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'rspec-rails', '~> 5.1.0'
end

#####

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  
  # NOTE : I commented this out
  # gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]

  # NOTE : I commented this out
  # gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
