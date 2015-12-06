require './test/test_helper.rb'

class MoreHelpTest < Minitest::Test
  def setup
    super
  end

  def test_more_help
    assert_output(/# 開発部屋/) { @bot.receive body: '@riety more help', from: @from, to: @to }
  end
end
