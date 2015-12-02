require './test/test_helper'
require 'byebug'

class ExtremeWeddingTest < Minitest::Test
  def setup
    super
  end

  def test_extreme_wedding
    assert_output(/fa-spin/) { @bot.receive body: '@riety extreme wedding', from: @from, to: @to }
  end
end
