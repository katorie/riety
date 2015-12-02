module Riety
  # Patches all_description method of Ruboty::Actions::Help
  # to avoid help messages get messed up
  #
  # Help message will show 'command' option in place of inspected pattern
  # when provided.
  module HelpPrettifier

    private

    def all_descriptions
      _descriptions = Ruboty.actions.reject(&:hidden?).sort.map do |action|
        prefix = ""
        prefix << message.robot.name << " " unless  action.all?
        command = action.command
        "#{prefix}#{command || action.pattern.inspect} - #{action.description}"
      end
    end
  end

  # Adds 'command' option to Ruboty::Action
  module CommandAttrAdder
    def command
      options[:command]
    end
  end

  ::Ruboty::Actions::Help.send(:prepend, HelpPrettifier)
  ::Ruboty::Action.send(:include, CommandAttrAdder)
end
