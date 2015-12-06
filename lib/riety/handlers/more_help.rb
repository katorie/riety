module Riety
  module Handlers
    class MoreHelp < Ruboty::Handlers::Base
      on(
        /more help\z/,
        name: 'more_help',
        command: 'more help',
        description: 'Special Thanks'
      )

      def more_help(message)
        message.reply special_thanks
      end

      private

        def special_thanks
          <<-'EOF'
# 開発部屋
- https://idobata.io/organizations/riety/rooms/riety-dev/join_request/8b15b79b-adf2-40cb-89b9-2a984cbd3ce0

# GitHub
- https://github.com/suburi/riety

# waffle.io
- https://waffle.io/suburi/riety

EOF
        end
    end
  end
end
