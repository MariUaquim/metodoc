require 'test_helper'

class VersionEvaluationTest < ActiveSupport::TestCase

  def setup
    @e = VersionEvaluation.new(:version_id=>1, :quality_criteria=>"kjkjkjkl", :artefact_status_id=>1)
  end

  test "should have a version" do
    @e.version_id = nil
    assert_equal(false, @e.save, "Avaliaçao deve possuir versão")
  end

  test "should have a status" do
    @e.artefact_status = nil
    assert_equal(false, @e.save, "Deve possuir status do artefato")
  end

  test "should have a unique version" do
    assert_equal(true, @e.save, "Deve salvar normal aqui")
    x = VersionEvaluation.new(:version_id => @e.version_id, :quality_criteria => "ijoijio")
    assert_equal(false, x.save, "Versao deve possuir somente uma Avaliação")
  end

  test "should have a quality criteria" do
    @e.quality_criteria = nil
    assert_equal(false, @e.save, "Avaliação deve possuir criterios de qualidade")
  end

end
