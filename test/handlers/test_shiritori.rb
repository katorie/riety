require './test/test_helper'

class ShiritoriTest < Minitest::Test
  def setup
    super
  end

  def test_shiritori_should_return_expected_reply_which_ends_shiritori
    %w[shiritori しりとり].each do |command|
      @said = "@riety #{command} ...あ"
      assert_output(/^アサーション$/) { @bot.receive body: @said, from: @from, to: @to }
      @said = "@riety #{command} ...わ"
      assert_output(/^ワッペン$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end

  def test_shiritori_executes_with_the_last_word_given
    %w(shiritori しりとり).each do |command|
      assert_output(/^ワッペン$/) { @bot.receive body: "@riety #{command} ちーず まめだいふく えいわ", from: @from, to: @to }
    end
  end

  def test_shiritori_cannot_understand_non_hiragana_word
    %w[shiritori しりとり].each do |command|
      @said = "@riety #{command} ...a"
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
      @said = "@riety #{command} ...1"
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
      @said = "@riety #{command} ...亜"
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_argument_error_lack_word
    %w[shiritori しりとり].each do |command|
      @said = "@riety #{command}"
      assert_output(/^なんか言ってくれないとしりとりできない...$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end

  def test_shiritori_should_not_allow_to_contain_invalid_characters
    %w(shiritori しりとり).each do |command|
      assert_silent { @bot.receive body: "@riety #{command}あ はにわ", from: @from, to: @to }

      assert_silent { @bot.receive body: "@riety あ#{command} はにわ", from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_error_when_only_single_space_is_given
    %w(shiritori しりとり).each do |command|
      @said = "@riety #{command} "
      assert_output(/^なんか言ってくれないとしりとりできない...$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_error_when_only_continuous_spaces_are_given
    %w(shiritori しりとり).each do |command|
      @said = "@riety #{command}  　 "
      assert_output(/^なんか言ってくれないとしりとりできない...$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_expected_word_when_keyword_with_leading_spaces_are_given
    %w(shiritori しりとり).each do |command|
      @said = "@riety #{command}  　 こんにちわ"
      assert_output(/^ワッペン$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end
end
