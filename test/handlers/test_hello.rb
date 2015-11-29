require './test/test_helper'

class HelloTest < Minitest::Test
  def setup
    super
    @said = '@riety hello'
  end

  def test_hello
    assert_output(/^Hi$/) { @bot.receive body: @said, from: @from, to: @to }
  end
end
