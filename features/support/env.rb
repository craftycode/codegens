require 'aruba/cucumber'

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
ENV['CODE_GENERATOR_PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../test/generators')}"
ENV['CODE_GENERATION_PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../tmp/aruba')}"

Before do
  # Using "announce" causes massive warnings on 1.9.2
  @puts = true
end
