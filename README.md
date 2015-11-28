# Riety

Riety is ruboty bot.

# Development

```
# Prepare
$ brew install redis
$ redis-server &
# After clone this repository
% bundle install
% bundle exec ruboty -l init.rb --dotenv
Type `exit` or `quit` to end the session.
> riety help
riety /hello/ - greet
riety /help( me)?(?: (?<filter>.+))?\z/i - Show this help message
riety /ping\z/i - Return PONG to PING
riety /who am i\?/i - Answer who you are
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
% heroku create
% git push heroku master
```

# Heroku

We use follow heroku add-ons.
- Heroku Redis :: Redis
- Papertrail
- Deploy Hooks for GitHub
