require File.expand_path(File.dirname(__FILE__) + '/test_setup')

class TestSpecification < MiniTest::Unit::TestCase
  def test_questions
    refute Codegens.specification("foo")["questions"].nil?, "Codegens specification does not have questions."
    assert Codegens.specification("foo")["questions"][0]["id"] == "summary"
    assert Codegens.specification("foo")["questions"][0]["text"] == "Summarize this gem's purpose."
  end
end
