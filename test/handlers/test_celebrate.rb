require './test/test_helper.rb'

class CelebrateTest < Minitest::Test
  def setup
    super
  end

  def test_celebrate_should_return_message_by_name
    said = '@riety celebrate サンプル'
    assert_output(/^おめでとう$/) { @bot.receive body: said, from: @from, to: @to }
  end

  def test_celebrate_should_return_member_list
    said = '@riety celebrate list'
    assert_output(/^サンプル/) { @bot.receive body: said, from: @from, to: @to }
  end
end
