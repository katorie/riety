require './test/test_helper'

class ShiritoriTest < Minitest::Test
  def setup
    @bot = ::Ruboty::Robot.new
    @to = '#general'
    @from = 'alice'
  end

  def test_shiritori_should_return_expected_reply_which_ends_shiritori
    @said = '@ruboty shiritori ...あ'
    assert_output(/^アサーション$/) { @bot.receive body: @said, from: @from, to: @to }
    @said = '@ruboty shiritori ...わ'
    assert_output(/^ワッペン$/) { @bot.receive body: @said, from: @from, to: @to }
  end

  def test_shiritori_cannot_understand_non_hiragana_word
    @said = '@ruboty shiritori ...a'
    assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
    @said = '@ruboty shiritori ...1'
    assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
    @said = '@ruboty shiritori ...亜'
    assert_output(/^えーひらがなで言ってくれないとわかんない...$/) { @bot.receive body: @said, from: @from, to: @to }
  end
end
