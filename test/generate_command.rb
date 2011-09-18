require File.expand_path(File.dirname(__FILE__) + '/test_setup')

class TestGenerateCommand < MiniTest::Unit::TestCase
  def test_argument_named_directory
    refute File.exists?(generation_path('foo')), "Directory already exists"
    Codegens::Command::Generate.create_directory('arg0', ['foo'])
    assert File.exists?(generation_path('foo')), "Directory does not exist"
  end

  def test_execute
    refute File.exists?(generation_path('foo')), "Directory already exists"
    Codegens::Command::Generate.execute('foo')
    assert File.exists?(generation_path('foo')), "Directory does not exist"
  end
end
