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
           [
             "http://magazine.rubyist.net/?c=plugin;plugin=attach_download;p=0050-YochiyochiRbLtEventReport;file_name=Gathering.JPG",
             "https://idobata.s3.amazonaws.com/uploads/attachment/image/312020/00e76a96-cec9-4a88-9867-9f976809fc11/image__1_.jpg",
             "https://idobata.s3.amazonaws.com/uploads/attachment/image/312021/b8ee7382-bdff-4465-896f-6ded3894db57/B081BigCYAAt1Hj.jpg-large.jpeg",
             "https://idobata.s3.amazonaws.com/uploads/attachment/image/313692/88386ab7-9af3-4a93-ae17-37992f08effd/P8250151.JPG"
           ]
        end
    end
  end
end
