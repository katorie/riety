require './test/test_helper'

class HelloTest < Minitest::Test
  def setup
    super
  end

  def test_hello
    assert_output(/^Hi$/) { @bot.receive body: '@riety hello', from: @from, to: @to }
  end
end
