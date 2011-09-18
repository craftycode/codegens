module Codegens
  module Command
    module Generate
      def self.execute(name)
        template_path = File.join(name, 'template')
        Codegens.directory_contents(template_path).each do |content|
          create_content(template_path, "", content, [name])
        end
      end

      def self.create_content(template_path, content_path, content, args)
        if File.directory?(Codegens.generator_path(File.join(template_path, content)))
          content_path = create_directory(File.join(content_path, content), args)
        end
      end

      def self.create_directory(pattern, args)
        path = pattern
        /arg(\d+)/.match(pattern).to_a[1..-1].each do |match|
          path.gsub!("arg#{match}", args[match.to_i])
        end
        Dir.mkdir(Codegens.generation_path(path))
        return path
      end
    end
  end
end
