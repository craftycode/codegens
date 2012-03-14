module Codegens
  class CLI < Thor
    default_task :generate

    desc "generate NAME[, options]", "Generate files and/or directories."
    def generate(name, *args)
      Codegens::Command::Generate.new(name, args, answers(name)).execute
    end

    private

    def answers(name)
      questions = Codegens.specification(name)["questions"] || [] 
      questions.inject({}) do |responses, question|
        responses[question["id"]] = ask(question["text"])
        responses
      end
    end

  end
end
