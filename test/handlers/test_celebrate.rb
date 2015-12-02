require './test/test_helper.rb'

class CelebrateTest < Minitest::Test
  def setup
    super
  end

  def test_celebrate_should_return_message_by_name
    assert_output(/^おめでとう$/) { @bot.receive body: '@riety celebrate サンプル', from: @from, to: @to }
  end

  def test_celebrate_should_return_member_list
    assert_output(/^サンプル/) { @bot.receive body: '@riety celebrate list', from: @from, to: @to }
  end

  def test_celebrate_should_return_error_when_no_name_is_given
    %w[celebrate お祝い].each do |command|
      assert_output(/^名前を指定してください/) { @bot.receive body: "@riety #{command}", from: @from, to: @to }
    end
  end

  def test_celebrate_should_return_error_when_only_single_space_is_given
    %w[celebrate お祝い].each do |command|
      assert_output(/^名前を指定してください/) { @bot.receive body: "@riety #{command} ", from: @from, to: @to }
    end
  end

  def test_celebrate_should_return_error_when_only_continuous_spaces_are_given
    %w[celebrate お祝い].each do |command|
      assert_output(/^名前を指定してください/) { @bot.receive body: "@riety #{command}  　 ", from: @from, to: @to }
    end
  end

  def test_celebrate_should_return_message_when_name_with_leading_spaces_are_given
    %w[celebrate お祝い].each do |command|
      assert_output(/^おめでとう$/) { @bot.receive body: "@riety #{command}  　 サンプル", from: @from, to: @to }
    end
  end
end
