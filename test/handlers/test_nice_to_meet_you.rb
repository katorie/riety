require './test/test_helper'

class NiceToMeetYouTest < Minitest::Test
  def setup
    @bot = ::Ruboty::Robot.new
    @to = '#general'
    @from = 'alice'
    @said = 'hi'
  end

  def test_nice_to_meet_you
    assert_output(/^Nice to meet #{@from}$/) { @bot.receive body: @said, from: @from, to: @to }
    assert_silent { @bot.receive body: @said, from: @from, to: @to }
    assert_output(/^katorieさん、結婚おめでとうございます/) { @bot.receive body: @said, from: 'katorie', to: @to }
  end
end
