require File.expand_path(File.dirname(__FILE__) + '/test_setup')

class TestSpecification < MiniTest::Unit::TestCase
  def test_questions
    refute Codegens.specification("foo")["questions"].nil?, "Codegens specification does not have questions."
    assert Codegens.specification("foo")["questions"][0]["id"] == "summary", "Summary question does not exist."
    assert Codegens.specification("foo")["questions"][0]["text"] == "Summarize this gem's purpose", "Summary question text is not correct."
  end
end
