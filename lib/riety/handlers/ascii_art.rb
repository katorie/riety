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
        begin
          message.reply data(message[:keyword])
        rescue
          message.reply art_list
        end
      end

      private

        def art_list
          ls = files.reduce([]) do |arts, f|
            f.rindex(/\/(.*)\.txt/)
            arts << "- #{$1}"
          end
          "aa の後に:arrow_double_down:のどれかを入力してね:ghost:\n\n" + ls.join("\n")
        end

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

        def files
          Dir.glob(File.expand_path('../../db/ascii_art/*', __FILE__))
        end
    end
  end
end
