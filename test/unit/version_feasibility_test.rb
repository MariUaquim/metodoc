require 'test_helper'

class VersionFeasibilityTest < ActiveSupport::TestCase
  def setup
    @p = VersionFeasibility.new(:version_id=>1, :responsible=>"Matheus Andrade",
    :opportunities=>"jjhjhj", :problems=>"ijoijio", :solutions=>"jkiuhu", :features=>"ijio",
    :conclusion=>"jhjhj", :artefact_status_id=>1)
  end

  test "should have a version" do
    @p.version_id = nil
    assert_equal(false, @p.save, "Viabilidade deve possuir versao")
  end

  test "should have a status" do
    @p.artefact_status_id = nil
    assert_equal(false, @p.save, "Deve possuir um status")
  end

  test "should have a responsible" do
    @p.responsible = nil
    assert_equal(false, @p.save, "Viabilidade deve ter um responsável")
  end

  test "should have a opportunity" do
    @p.opportunities = nil
    assert_equal(false, @p.save, "Viabilidade deve ter oportunidades")
  end

  test "should have a problems" do
    @p.problems = nil
    assert_equal(false, @p.save, "Viabilidade deve ter problemas")
  end

  test "should have a solutions" do
    @p.solutions = nil
    assert_equal(false, @p.save ,"Viabilidade deve ter soluções")
  end

  test "should have a features" do
    @p.features = nil
    assert_equal(false, @p.save, "Viabilidade deve ter recursos")
  end

  test "should check conclusion" do
    assert_equal(true,@p.save, "Deve salvar conclusao preenchido")
    @p.conclusion = nil
    assert_equal(true, @p.save, "Deve salvar conclusao vazio")
  end

  test "should have a unique version" do
    assert_equal(true, @p.save, "Deve salvar normal aqui")
    q = VersionFeasibility.new
    q.version_id = @p.version_id
    assert_equal(false, q.save, "Versao deve ser única")
  end

end
