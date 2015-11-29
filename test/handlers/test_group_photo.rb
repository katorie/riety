require './test/test_helper'

class GroupPhotoTest < Minitest::Test
  def setup
    super
    @said = '@ruboty group photo'
  end

  def test_gruop_photo_return_image_url
    assert_output(/^https?:\/\/.+\.(jpg|gif|png)$/i) { @bot.receive body: @said, from: @from, to: @to }
  end
end
