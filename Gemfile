source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.2.3'
gem 'devise', '~> 4.9', '>= 4.9.2'
gem 'devise_invitable', '~> 2.0', '>= 2.0.8'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.5'
gem 'redis', '~> 4.0'
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'acts_as_tenant', '~> 0.6.1'
# gem "image_processing", "~> 1.2"
# gem "sassc-rails"
group :development, :test do
  gem 'awesome_print'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'rubocop-rails'
end

group :test do
  gem 'fuubar'
  gem 'rspec-rails'
end

group :development do
  gem 'web-console'
end
