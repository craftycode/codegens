require File.expand_path(File.dirname(__FILE__) + '/test_setup')

class TestGenerateCommand < MiniTest::Unit::TestCase
  def test_answer_named_directory

  end

  def test_answer_named_file
    refute File.exists?(generation_path('bin/exebar')), "File 'exebar' already exists."
    Codegens::Command::Generate.new('foo', ['bar'], {"executable" => "exebar"}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'bin_if_answer_executable')
    Codegens::Command::Generate.new('foo', ['bar'], {"executable" => "exebar"}).create_file('arg0/bin_if_answer_executable', 'bin', 'answer_executable')
    assert File.exists?(generation_path('bin/exebar')), "File 'exebar' does not exist."
  end

  def test_argument_named_directory
    refute File.exists?(generation_path('bar')), "Directory 'bar' already exists"
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'arg0')
    assert File.exists?(generation_path('bar')), "Directory 'bar' does not exist"
  end

  def test_argument_named_file
    refute File.exists?(generation_path('bar/bar.gemspec')), "File 'bar.gemspec' already exists."
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'arg0')
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_file('arg0', 'bar', 'arg0.gemspec')
    assert File.exists?(generation_path('bar/bar.gemspec')), "File 'bar.gemspec' does not exist."
  end

  def test_conditional_directory
    refute File.exists?(generation_path('created')), "Directory 'created' already exists."
    refute File.exists?(generation_path('not_created')), "Directory 'not_created' already exists."
    Codegens::Command::Generate.new('foo', ['bar'], {"executable" => "exebar"}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'created_if_answer_executable')
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'not_created_if_answer_executable')
    refute File.exists?(generation_path('not_created')), "Directory 'not_created' exists."
    assert File.exists?(generation_path('created')), "Directory 'created' does not exist"
  end

  def test_conditional_file

  end

  def test_explicitly_named_directory
    refute File.exists?(generation_path('lib')), "Directory 'lib' already exists."
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'lib')
    assert File.exists?(generation_path('lib')), "Directory 'lib' does not exist"
  end

  def test_explicitly_named_file
    refute File.exists?(generation_path('bar/README.rdoc')), "File 'README.rdoc' already exists."
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_directory(Codegens::Command::Generate::CURRENT_DIRECTORY, 'arg0')
    Codegens::Command::Generate.new('foo', ['bar'], {}).create_file('arg0', 'bar', 'README.rdoc')
    assert File.exists?(generation_path('bar/README.rdoc')), "File 'README.rdoc' does not exist."
  end

  def test_name_interpretation
    assert 'bar' == Codegens::Command::Generate.new('foo', ['bar'], {}).interpret('arg0'), "Name interpretation of arguments failed."
    assert_nil Codegens::Command::Generate.new('foo', ['bar'], {}).interpret('bin_if_answer_executable'), "If modifier interpretation with answers failed."
    assert_equal 'bin', Codegens::Command::Generate.new('foo', ['bar'], {"executable" => "exebar"}).interpret('bin_if_answer_executable'), "If modifier interpretation with answers failed."
    assert_equal 'exebar', Codegens::Command::Generate.new('foo', ['bar'], {"executable" => "exebar"}).interpret('answer_executable'), "Name interpretation of answers failed."
  end

end
