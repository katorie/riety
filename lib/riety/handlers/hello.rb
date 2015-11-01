module Riety
  module Handlers
    class Hello < Ruboty::Handlers::Base
      on /hello/, name: 'hello', description: 'greet'

      def hello(message)
        message.reply 'Hi'
      end
    end
  end
end
