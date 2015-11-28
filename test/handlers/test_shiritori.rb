require './test/test_helper'

class ShiritoriTest < Minitest::Test
  def setup
    @bot = ::Ruboty::Robot.new
    @to = '#general'
    @from = 'alice'
  end

  def test_shiritori_should_return_expected_reply_which_ends_shiritori
    %w[shiritori しりとり].each do |command|
      @said = "@ruboty #{command} ...あ"
      assert_output(/^アサーション$/) { @bot.receive body: @said, from: @from, to: @to }
      @said = "@ruboty #{command} ...わ"
      assert_output(/^ワッペン$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end

  def test_shiritori_cannot_understand_non_hiragana_word
    %w[shiritori しりとり].each do |command|
      @said = "@ruboty #{command} ...a"
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
      @said = "@ruboty #{command} ...1"
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
      @said = "@ruboty #{command} ...亜"
      assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
    end
  end
end
