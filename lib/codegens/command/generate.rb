require 'erb'

module Codegens
  module Command
    class Generate
      CURRENT_DIRECTORY = ""

      attr_accessor :template_args, :template_name, :template_path, :template_answers

      def initialize(name, args, answers)
        self.template_name = name
        self.template_path = Codegens.generator_path(File.join(name, 'template'))
        self.template_args = args
        self.template_answers = answers
      end

      def create_content(relative_template_path, relative_content_path, content)
        if File.directory?(File.join(template_path, relative_template_path, content))
          relative_content_path = create_directory(relative_content_path, content)
          render_directory(File.join(relative_template_path, content), relative_content_path) unless relative_content_path.nil?
        else
          create_file(relative_template_path, relative_content_path, content)
        end
      end

      def create_directory(relative_content_path, path)
        if path = interpret(path)
          path = File.join(relative_content_path, path)
          Dir.mkdir(Codegens.generation_path(path))
        end

        return path
      end

      def create_file(relative_template_path, relative_content_path, file_name)
        if destination_file_name = interpret(file_name)
          source_path = File.join(template_path, relative_template_path, file_name)
          destination_path = Codegens.generation_path(File.join(relative_content_path, destination_file_name))
          
          args = self.template_args
          answers = self.template_answers
          File.open(destination_path, 'w') do |f|
            f.puts(ERB.new(File.read(source_path)).result(binding))
          end
        end
      end

      def execute
        render_directory(CURRENT_DIRECTORY, CURRENT_DIRECTORY)
      end

      def interpret(name)
        if /(.+)_if_(.+)/.match(name)
          name = $1
          condition = $2
          if /answer_(.+)/.match(condition)
            answer = self.template_answers[$1]
            if answer.nil? or answer.empty?
              return nil
            end
          end
        end

        if /answer_(.+)/.match(name)
          name = name.gsub("answer_#{$1}", self.template_answers[$1])
        end

        while /arg(\d+)/.match(name)
          name = name.gsub("arg#{$1}", self.template_args[$1.to_i])
        end

        name
      end

      def render_directory(relative_template_path, relative_content_path)
        Codegens.directory_contents(File.join(template_path, relative_template_path)).each do |content|
          create_content(relative_template_path, relative_content_path, content)
        end
      end
    end
  end
end
