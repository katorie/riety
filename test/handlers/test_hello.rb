require 'minitest/autorun'
require 'ruboty'
require './lib/ruboty/handlers/hello'

class HelloTest < Minitest::Test
  def setup
    @bot = ::Ruboty::Robot.new
    @to = '#general'
    @from = 'alice'
    @said = '@ruboty hello'
  end

  def test_hello
    assert_output(/^Hi$/) { @bot.receive body: @said, from: @from, to: @to }
  end
end
