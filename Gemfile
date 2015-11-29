# A sample Gemfile
source "https://rubygems.org"

ruby '2.2.3'
gem 'ruboty'
gem 'ruboty-idobata', github: 'ta1kt0me/ruboty-idobata', ref: '614d3c5e555d1e026fe01f28dbe8dbbe3a192277', group: :production
gem 'ruboty-redis'

group :development, :test do
  gem 'byebug'
end

group :test do
  gem 'minitest'
  gem 'fakeredis', require: 'fakeredis/minitest'
end
