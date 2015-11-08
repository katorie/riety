module Riety
  module Handlers
    class Shiritori < Ruboty::Handlers::Base
      on /shiritori/, name: 'shiritori', description: 'しりとり'

      def shiritori(message)
        #FIXME: 引数の一番最後の文字を綺麗に取得する方法がわからなかった
        shiri = message.body[-1]
        if shiri == 'り'
          message.reply '理論'
        else
          message.reply 'えーそんな言葉わかんない...'
        end
      end
    end
  end
end
