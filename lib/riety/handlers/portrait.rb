module Riety
  module Handlers
    class Portrait < Ruboty::Handlers::Base
      on(
        /portrait(\s|　)*\z/,
        name: 'portrait',
        command: 'portrait',
        description: 'Display a large size portrait'
      )

      def portrait(message)
        image_url = "https://s3-ap-northeast-1.amazonaws.com/llio-pub/rie_icon_large.jpg"
        message.reply <<-EOS
![portrait](#{image_url})
by __yucao24hours__ :gift_heart:
        EOS
      end
    end
  end
end
