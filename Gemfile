# A sample Gemfile
source "https://rubygems.org"

ruby '2.2.3'
gem 'ruboty'
gem 'ruboty-idobata', group: :production
gem 'ruboty-redis'

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'minitest'
  gem 'minitest-stub_any_instance'
  gem 'fakeredis', require: 'fakeredis/minitest'
end
