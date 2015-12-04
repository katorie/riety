require './test/test_helper'

class ShiritoriTest < Minitest::Test
  def setup
    super
    @commands = %w(shiritori しりとり)
  end

  def test_shiritori_should_return_expected_reply_which_ends_shiritori
    Riety::Handlers::Shiritori.stub_any_instance(:words, {'わ' => 'ワッペン', 'あ' => 'アサーション'}) do
      @commands.each do |command|
        assert_output(/^アサーション$/) { @bot.receive body: "@riety #{command} ...あ", from: @from, to: @to }
        assert_output(/^ワッペン$/) { @bot.receive body: "@riety #{command} ...わ", from: @from, to: @to }
      end
    end
  end

  def test_shiritori_executes_with_the_last_word_given
    Riety::Handlers::Shiritori.stub_any_instance(:words, {'わ' => 'ワッペン'}) do
      @commands.each do |command|
        assert_output(/^ワッペン$/) { @bot.receive body: "@riety #{command} ちーず まめだいふく えいわ", from: @from, to: @to }
      end
    end
  end

  def test_shiritori_cannot_understand_non_hiragana_word
    @commands.each do |command|
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: "@riety #{command} ...a", from: @from, to: @to }
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: "@riety #{command} ...1", from: @from, to: @to }
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: "@riety #{command} ...亜", from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_argument_error_lack_word
    @commands.each do |command|
      assert_output(/^なんか言ってくれないとしりとりできない...$/) { @bot.receive body: "@riety #{command}", from: @from, to: @to }
    end
  end

  def test_shiritori_should_not_allow_to_contain_invalid_characters
    @commands.each do |command|
      assert_silent { @bot.receive body: "@riety #{command}あ はにわ", from: @from, to: @to }
      assert_silent { @bot.receive body: "@riety あ#{command} はにわ", from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_error_when_only_single_space_is_given
    @commands.each do |command|
      assert_output(/^なんか言ってくれないとしりとりできない...$/) { @bot.receive body: "@riety #{command} ", from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_error_when_only_continuous_spaces_are_given
    @commands.each do |command|
      assert_output(/^なんか言ってくれないとしりとりできない...$/) { @bot.receive body: "@riety #{command}  　 ", from: @from, to: @to }
    end
  end

  def test_shiritori_should_return_expected_word_when_keyword_with_leading_spaces_are_given
    Riety::Handlers::Shiritori.stub_any_instance(:words, {'わ' => 'ワッペン'}) do
      @commands.each do |command|
        assert_output(/^ワッペン$/) { @bot.receive body: "@riety #{command}  　 こんにちわ", from: @from, to: @to }
      end
    end
  end
end
