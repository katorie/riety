module Riety
  module Handlers
    class NiceToMeetYou < Ruboty::Handlers::Base
      on //, all: true, name: 'nice_to_meet_you', description: 'Welcome message'

      def nice_to_meet_you(message)
        # TODO: save user who already nice to meet you
        message.reply "Nice to meet #{message.from_name}"
      end
    end
  end
end
