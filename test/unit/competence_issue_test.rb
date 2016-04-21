require 'test_helper'

class CompetenceIssueTest < ActiveSupport::TestCase

  def setup
    @ci = CompetenceIssue.new(:version_id=>1, :question=>"ijiojii", :artefact_status_id=>1)
  end

  test "should have a version id" do
    @ci.version_id = nil
    assert_equal(false, @ci.save, "Deve possuir uma versão")
  end

  test "should have a status" do
    @ci.artefact_status_id = nil
    assert_equal(false, @ci.save, "Deve possuir um status")
  end

  test "should have a question" do
    @ci.question = nil
    assert_equal(false, @ci.save,"Deve possuir uma pergunta")
  end

  test "check question's lenght" do
    @ci.question = "111"
    assert_equal(false, @ci.save, "Deve ser maior que 3")
    @ci.question = "2" * 251
    assert_equal(false, @ci.save, "Deve ser menor que 250")
  end
end
