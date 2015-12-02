require './test/test_helper'

class MemoryTest < Minitest::Test
  def setup
    super
  end

  def test_memory_return_image_url
    assert_output(/^https?:\/\/.+\.(jpe?g|gif|png)$/i) { @bot.receive body: '@riety memory', from: @from, to: @to }
  end
end
