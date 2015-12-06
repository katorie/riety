require './test/test_helper'

class TestAsciiArt < Minitest::Test
  def setup
    super
    @art = 'test'
  end

  def test_ascii_art
    Riety::Handlers::AsciiArt.new(@bot).stub_any_instance(:file_path, file_path(@art)) do
      aa = <<-"EOF"
```
__________.__        __
\______   \__| _____/  |_ ___.__.
 |       _/  |/ __ \   __<   |  |
 |    |   \  \  ___/|  |  \___  |
 |____|_  /__|\___  >__|  / ____|
        \/        \/      \/
```
EOF
      assert_output(aa) { @bot.receive body: "@riety aa #{@art}", from: @from, to: @to }
    end
  end

  private

    def file_path(name)
      File.join(File.expand_path('../../db/ascii_art', __FILE__), "#{name}.txt")
    end
end
