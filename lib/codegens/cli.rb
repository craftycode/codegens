module Codegens
  class CLI < Thor
    default_task :generate

    desc "generate NAME", "Generate files and/or directories."
    def generate(name)
      Codegens::Command::Generate.new(name).execute
    end
  end
end
