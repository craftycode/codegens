require File.expand_path(File.dirname(__FILE__) + '/test_setup')

class TestGenerateCommand < MiniTest::Unit::TestCase
  def test_argument_named_directory
    refute File.exists?(generation_path('bar')), "Directory 'bar' already exists"
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'arg0')
    assert File.exists?(generation_path('bar')), "Directory 'bar' does not exist"
  end

  def test_explicitly_named_directory
    refute File.exists?(generation_path('lib')), "Directory 'lib' already exists."
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'lib')
    assert File.exists?(generation_path('lib')), "Directory 'lib' does not exist"
  end

  def test_static_file
    refute File.exists?(generation_path('bar/README.rdoc')), "File 'README.rdoc' already exists."
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'arg0')
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_file('arg0', 'bar', 'README.rdoc')
    assert File.exists?(generation_path('bar/README.rdoc')), "File 'README.rdoc' does not exist."
  end
end
