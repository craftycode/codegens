require 'thor'
require 'codegens/command/generate'

module Codegens
  def self.clean_up
    Dir.new(Codegens.generation_path("")).each do |name|
      FileUtils.rm_rf(Codegens.generation_path(name)) unless ['.', '..'].include?(name)
    end
  end

  def self.directory_contents(path)
    Dir.new(path).reject{|content| content =~ /^\./ }
  end

  def self.generation_path(path)
    File.join(ENV['CODE_GENERATION_PATH'] || File.expand_path("./"), path)
  end

  def self.generator_path(path)
    File.join(ENV['CODE_GENERATOR_PATH'] || File.expand_path("./"), path)
  end
end
