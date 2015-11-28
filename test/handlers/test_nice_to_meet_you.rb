require './test/test_helper'

class NiceToMeetYouTest < Minitest::Test
  def setup
    @bot = ::Ruboty::Robot.new
    @to = '#general'
    @from = 'alice'
    @said = 'hi'
  end

  def test_nice_to_meet_you
    assert_output(/@#{@from}.*\:hatched_chick\:/) { @bot.receive body: @said, from: @from, to: @to }
    assert_silent { @bot.receive body: @said, from: @from, to: @to }
    assert_output(/\@katorie\n.*\:wedding\:/) { @bot.receive body: @said, from: 'katorie', to: @to }
  end
end
