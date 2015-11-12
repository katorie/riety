module Riety
  module Actions
    class NiceToMeetYou < Ruboty::Actions::Base
      def call
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
