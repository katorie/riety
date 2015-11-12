module Riety
  module Handlers
    class NiceToMeetYou < Ruboty::Handlers::Base
      on //, all: true, name: 'nice_to_meet_you', description: 'Welcome message'

      def nice_to_meet_you(message)
        brain = message.robot.brain

        brain.data[:customers] ||= []

        unless brain.data[:customers].include?(message.from) || message.from_name == ENV['ROBOT_NAME']
          if message.from_name == 'katorie'
            message.reply "#{message.from_name}さん、結婚おめでとうございます:couple_with_heart::couple_with_heart::couple_with_heart:"
          else
            message.reply "Nice to meet #{message.from_name}"
          end
          brain.data[:customers] << message.from
        end
      end
    end
  end
end
