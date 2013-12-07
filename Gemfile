source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'simplecov', :require => false, :group => :test

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem "animate-rails"
gem 'cancan'
gem 'devise'
gem 'figaro'
gem 'rolify'
gem 'simple_form'
group :assets do
  gem 'less-rails'
  gem 'therubyracer', :platform=>:ruby
  gem 'twitter-bootstrap-rails'
end
group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'hub', :require=>nil
  gem 'quiet_assets'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'thin'
  gem 'capybara'   #moved from :test
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'launchy'  #useful for debugging user stories
  gem 'database_cleaner', '1.0.1' #moved from :test
end
group :production do
  gem 'thin'
  gem 'pg'
end
group :test do
  
 
  gem 'email_spec'
  gem 'sqlite3'
end
