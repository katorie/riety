require './test/test_helper'

class PortraitTest < Minitest::Test
  def setup
    @expected = %r{\A#{Regexp.escape('![portrait](http')}s?://.+(jpg|jpeg|png)\).+yucao.+\Z}im
    super
  end

  def test_portrait_should_reply_embedded_portrait_image
    assert_output(@expected) { @bot.receive body: "@riety portrait", from: @from, to: @to }
  end

  def test_portrait_should_reply_embedded_portrait_image_when_with_trailing_whitespaces
    assert_output(@expected) { @bot.receive body: "@riety portrait  　　 ", from: @from, to: @to }
  end

  def test_portrait_should_not_allow_trailing_invalid_characters
    assert_silent { @bot.receive body: "@riety portraitX", from: @from, to: @to }
    assert_silent { @bot.receive body: "@riety portraitXXX", from: @from, to: @to }
    assert_silent { @bot.receive body: "@riety portrait XXX", from: @from, to: @to }
    assert_silent { @bot.receive body: "@riety portrait 　 　XXX", from: @from, to: @to }
  end
end
