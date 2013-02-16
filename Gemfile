source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request', '0.2.1'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass', '~> 2.2.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'asset_sync'
end
gem 'jquery-rails'
gem 'haml-rails'
gem 'kaminari'
gem 'texticle', '~> 2.0', require: 'texticle/rails'
gem 'acts-as-taggable-on', '~> 2.3.1'
gem 'sidekiq'

group :production do
  gem 'newrelic_rpm'
  gem 'memcachier'
  gem 'dalli'
  gem 'fog'
end
