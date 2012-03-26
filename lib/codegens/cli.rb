module Codegens
  class CLI < Thor
    default_task :generate

    desc "generate NAME[, options]", "Generate files and/or directories."
    def generate(name, *args)
      name = name.to_s
      Codegens::Command::Generate.new(name, args, answers(name)).execute
    end

    private

    def method_missing(*args)
      generate *args 
    end

    def answers(name)
      questions = Codegens.specification(name)["questions"] || [] 
      questions.inject({}) do |responses, question|
        responses[question["id"]] = ask(question["text"])
        responses
      end
    end

  end
end
