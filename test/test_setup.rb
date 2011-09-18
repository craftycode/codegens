require 'rubygems'
require 'minitest/autorun'
require 'fileutils'

$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require 'codegens'

ENV['CODE_GENERATOR_PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../test/generators')}"
ENV['CODE_GENERATION_PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../tmp/units')}"

def generation_path(path)
  Codegens.generation_path(path)
end

MiniTest::Unit::TestCase.add_setup_hook do
  Codegens.clean_up
end

MiniTest::Unit::TestCase.add_teardown_hook do
  Codegens.clean_up
end
