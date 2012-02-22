require 'thor'
require 'json/ext'
require 'codegens/command/generate'

module Codegens
  def self.classify(string)
    string.capitalize
  end
  
  def self.directory_contents(path)
    Dir.new(path).reject{|content| ['.', '..'].include?(content) }
  end

  def self.generation_path(path)
    File.join(ENV['CODE_GENERATION_PATH'] || File.expand_path("./"), path)
  end

  def self.generator_path(path="")
    File.join(ENV['CODE_GENERATOR_PATH'] || File.expand_path("./"), path)
  end

  def self.specification(name)
    # @specification ||= JSON.parse('{"questions": "yo"}')    
    @specification ||= JSON.parse(File.open(File.join(generator_path, name, "#{name}.genspec"), "r").read)    
  end
end
