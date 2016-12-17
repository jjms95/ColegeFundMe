source 'http://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
gem 'devise', '~> 4.2'
gem "factory_girl_rails", "~> 4.0"
gem 'factory_girl', '~> 4.7'
gem 'faker', '~> 1.6', '>= 1.6.6'
gem 'omniauth'
gem 'omniauth-twitter', '~> 1.2', '>= 1.2.1'
gem 'omniauth-facebook', '~> 4.0'
gem 'omniauth-gplus', '~> 2.0', '>= 2.0.1'
gem 'warden', github: 'acaron/warden', branch: 'fix-test-helpers'

group :development, :test do
	gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  	gem 'byebug', platform: :mri
end

group :test do
	gem 'capybara', '~> 2.11'
	gem 'rails-controller-testing'	
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
