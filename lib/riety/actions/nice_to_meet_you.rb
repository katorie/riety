module Riety
  module Actions
    class NiceToMeetYou < Ruboty::Actions::Base
      def initialize(message)
        super
        @brain ||= message.robot.brain
        @brain.data[:customers] ||= []
      end

      def call
        return unless first_timer?

        nice_to_meet_you
        @brain.data[:customers] << message.from
      end

      private

      def nice_to_meet_you
        case message.from_name
        when 'katorie'
          res = <<-"EOF"
@#{message.from_name}
<span class='fa fa-spin'>:bouquet:</span><span class='fa fa-spin'>:christmas_tree:</span><span class='fa fa-spin'>:bell:</span>:confetti_ball: :wedding: :rocket:<span class='fa fa-spin'>:bell:</span><span class='fa fa-spin'>:gift_heart:</span><span class='fa fa-spin'>:bouquet:</span>
          EOF
          message.reply res
        else
          message.reply "@#{message.from_name}<span class='fa fa-spin'>:hatched_chick:</span>"
        end
      end

      def first_timer?
        !(@brain.data[:customers].include?(message.from) || robot?)
      end

      def robot?
        message.from_name == ENV['ROBOT_NAME']
      end
    end
  end
end
