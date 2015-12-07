module Riety
  module Handlers
    class AsciiArt < Ruboty::Handlers::Base
      on(
        /aa((\s|　)+(?<keyword>.+))?\z/,
        name: 'ascii_art',
        command: 'aa',
        description: 'Show ascii_art aa ebi, aa doala'
      )

      def ascii_art(message)
        message.reply data(message[:keyword])
      end

      private

        def data(name)
          File.open(file_path(name)) do |file|
<<-"EOF"
```
#{file.read}
```
EOF
          end
        end

        def file_path(name)
          File.join(File.expand_path('../../db/ascii_art', __FILE__), "#{name}.txt")
        end
    end
  end
end
