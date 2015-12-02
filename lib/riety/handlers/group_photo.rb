module Riety
  module Handlers
    class GroupPhoto < Ruboty::Handlers::Base
      on(
        /group photo\z/,
        name: 'group_photo',
        command: 'group_photo',
        description: 'Display group photo at random'
      )

      def group_photo(message)
        message.reply photo_urls.sample
      end

      private

        def photo_urls
          ['http://magazine.rubyist.net/?c=plugin;plugin=attach_download;p=0050-YochiyochiRbLtEventReport;file_name=Gathering.JPG']
        end
    end
  end
end
