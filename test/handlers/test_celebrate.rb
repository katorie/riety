require './test/test_helper.rb'

class CelebrateTest < Minitest::Test
  def setup
    super
    @commands = %w(celebrate お祝い)
  end

  def test_celebrate_with_no_arguments_should_reply_header_message
    Riety::Handlers::Celebrate.stub_any_instance(:wait_a_bit, wait_a_bit) do
      @commands.each do |command|
        assert_output(/^.+yochiyochi.rb celebration messages!.+$/) { @bot.receive body: "@riety #{command}", from: @from, to: @to }
      end
    end
  end

  def test_celebrate_with_no_arguments_should_reply_all_messages
    Riety::Handlers::Celebrate.stub_any_instance(:wait_a_bit, wait_a_bit) do
      @commands.each do |command|
        assert_output(/^.+きたむら.+おがさわら.+$/m) { @bot.receive body: "@riety #{command}", from: @from, to: @to }
      end
    end
  end

  def test_celebrate_should_reply_messages_when_only_single_space_is_given
    Riety::Handlers::Celebrate.stub_any_instance(:wait_a_bit, wait_a_bit) do
      @commands.each do |command|
        assert_output(/^.+きたむら.+おがさわら.+$/m) { @bot.receive body: "@riety #{command} ", from: @from, to: @to }
      end
    end
  end

  def test_celebrate_should_return_error_when_only_continuous_spaces_are_given
    Riety::Handlers::Celebrate.stub_any_instance(:wait_a_bit, wait_a_bit) do
      @commands.each do |command|
        assert_output(/^.+きたむら.+おがさわら.+$/m) { @bot.receive body: "@riety #{command}  　 ", from: @from, to: @to }
      end
    end
  end

  def test_celebrate_should_return_message_by_name
    @commands.each do |command|
      assert_output(/^おめでとう$/) { @bot.receive body: "@riety #{command} サンプル", from: @from, to: @to }
    end
  end

  def test_celebrate_should_return_member_list
    @commands.each do |command|
      assert_output(/^サンプル/) { @bot.receive body: "@riety #{command} list", from: @from, to: @to }
    end
  end

  def test_celebrate_should_return_message_when_name_with_leading_spaces_are_given
    @commands.each do |command|
      assert_output(/^おめでとう$/) { @bot.receive body: "@riety #{command}  　 サンプル", from: @from, to: @to }
    end
  end

  private

    def wait_a_bit
      # do nothing
    end
end
