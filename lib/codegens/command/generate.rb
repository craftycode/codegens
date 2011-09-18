module Codegens
  module Command
    class Generate
      CURRENT_DIRECTORY = ""

      attr_accessor :template_args, :template_name, :template_path

      def initialize(name)
        self.template_name = name
        self.template_path = Codegens.generator_path(File.join(name, 'template'))
        self.template_args = [name]
      end

      def create_content(relative_template_path, relative_content_path, content)
        if File.directory?(File.join(template_path, relative_template_path, content))
          relative_content_path = create_directory(relative_content_path, content)
          render_directory(File.join(relative_template_path, content), relative_content_path)
        end
      end

      def create_directory(relative_content_path, path)
        while /arg(\d+)/.match(path)
          path = path.gsub("arg#{$1}", template_args[$1.to_i])
        end
        path = File.join(relative_content_path, path)
        Dir.mkdir(Codegens.generation_path(path))

        return path
      end

      def execute
        render_directory(CURRENT_DIRECTORY, CURRENT_DIRECTORY)
      end

      def render_directory(relative_template_path, relative_content_path)
        Codegens.directory_contents(File.join(template_path, relative_template_path)).each do |content|
          create_content(relative_template_path, relative_content_path, content)
        end
      end
    end
  end
end
