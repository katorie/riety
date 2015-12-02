module Riety
  module Handlers
    class NiceToMeetYou < Ruboty::Handlers::Base
      on(
        //,
        all: true,
        name: 'nice_to_meet_you',
        description: 'Welcome message',
        hidden: true
      )

      def nice_to_meet_you(message)
        Riety::Actions::NiceToMeetYou.new(message).call
      end
    end
  end
end
