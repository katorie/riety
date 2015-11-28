require './test/test_helper'
require 'byebug'

class ExtremeWeddingTest < Minitest::Test
  def setup
    @bot = ::Ruboty::Robot.new
    @to = '#general'
    @from = 'alice'
    @said = '@ruboty extreme wedding'
  end

  def test_extreme_wedding
    assert_output(/fa-spin/) { @bot.receive body: @said, from: @from, to: @to }
  end
end
