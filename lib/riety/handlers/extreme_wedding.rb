module Riety
  module Handlers
    class ExtremeWedding < Ruboty::Handlers::Base
      on /extreme wedding/, name: 'extreme_wedding', description: 'Never ending spiral'

      def extreme_wedding(message)
        res =<<-EOF
<div class='center'>
<span class='fa fa-spin'>:bouquet:
<span class='fa fa-spin'>:christmas_tree:
<span class='fa fa-spin'>:bell:
<span class='fa fa-spin'>:confetti_ball:
<span class='fa fa-spin'>:wedding:
<span class='fa fa-spin'>:rocket:
<span class='fa fa-spin'>:gift_heart:
<span class='fa fa-spin'>:couplekiss:
<span class='fa fa-spin'>H
<span class='fa fa-spin'>A
<span class='fa fa-spin'>P
<span class='fa fa-spin'>P
<span class='fa fa-spin'>Y
<span class='fa fa-spin'>W
<span class='fa fa-spin'>E
<span class='fa fa-spin'>D
<span class='fa fa-spin'>D
<span class='fa fa-spin'>I
<span class='fa fa-spin'>N
<span class='fa fa-spin'>G
<span class='fa fa-spin'>:hatched_chick:
<span class='fa fa-spin'>:gift_heart:
<span class='fa fa-spin'>:rocket:
<span class='fa fa-spin'>:wedding:
<span class='fa fa-spin'>:confetti_ball:
<span class='fa fa-spin'>:bell:
<span class='fa fa-spin'>:christmas_tree:
<span class='fa fa-spin'>:bouquet:
</span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></span></div>
        EOF
        message.reply res
      end
    end
  end
end
