module Riety
  module Handlers
    class Memory < Ruboty::Handlers::Base
      on(
        /memory\z/,
        name: 'memory',
        command: 'memory',
        description: 'Display yochiyochi memory at random'
      )

      def memory(message)
        message.reply photo_urls.sample
      end

      private

        def photo_urls
          ['http://magazine.rubyist.net/?c=plugin;plugin=attach_download;p=0050-YochiyochiRbLtEventReport;file_name=Gathering.JPG']
        end
    end
  end
end
