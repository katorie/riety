module Riety
  module Actions
    class NiceToMeetYou < Ruboty::Actions::Base
      def call
        brain = message.robot.brain

        brain.data[:customers] ||= []

        unless brain.data[:customers].include?(message.from) || message.from_name == ENV['ROBOT_NAME']
          if message.from_name == 'katorie'
            k = <<-EOF
@#{message.from_name}
<span class="fa fa-spin">:bouquet:</span><span class="fa fa-spin">:christmas_tree:</span><span class="fa fa-spin">:bell:</span>:confetti_ball: :wedding: :rocket:<span class="fa fa-spin">:bell:</span><span class="fa fa-spin">:gift_heart:</span><span class="fa fa-spin">:bouquet:</span>
            EOF
            # message.reply "#{message.from_name}さん、結婚おめでとうございます:couple_with_heart::couple_with_heart::couple_with_heart:"
            message.reply k
          else
            message.reply "@#{message.from_name}<span class='fa fa-spin'>:hatched_chick:</span>"
          end
          brain.data[:customers] << message.from
        end
      end
    end
  end
end
