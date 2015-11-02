# Riety

Riety is ruboty bot.

# Development

```
# After clone this repository
% bundle install
% bundle exec ruboty -l init.rb
Type `exit` or `quit` to end the session.
> ruboty help
ruboty /hello/ - greet
ruboty /help( me)?(?: (?<filter>.+))?\z/i - Show this help message
ruboty /ping\z/i - Return PONG to PING
ruboty /who am i\?/i - Answer who you are
```

# Test

Execute `test_*.rb` files in `test` dir.

```
# All test
% bundle exec rake test
# Each file
% bundle exec ruby test/handlers/test_hello.rb
```

# Deployment

```
# Using heroku
% heroku config:set IDOBATA_API_TOKEN=foobar
% heroku config:set ROBOT_NAME=riety
% heroku create
% git push heroku master
```
