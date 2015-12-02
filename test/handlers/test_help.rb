require './test/test_helper.rb'

class HelpTest < Minitest::Test
  def setup
    super
  end

  def test_help_should_returns_original_pattern_when_command_is_not_provided
    assert_output(/riety \/hello\\z\/ - greet/) { @bot.receive body: '@riety help', from: @from, to: @to }
  end

  def test_help_should_returns_command_text_when_it_is_provided
    assert_output(/riety extreme wedding - Never ending spiral/) { @bot.receive body: '@riety help', from: @from, to: @to }
  end
end
