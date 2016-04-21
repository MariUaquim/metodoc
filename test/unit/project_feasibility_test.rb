require 'test_helper'

class ProjectFeasibilityTest < ActiveSupport::TestCase
  fixtures :ontologies, :users
  
  def setup
    @p = ProjectFeasibility.new(:ontology_id=>1, :responsible=>"Matheus Andrade",
    :opportunities=>"jjhjhj", :problems=>"ijoijio", :solutions=>"jkiuhu", :features=>"ijio",
    :conclusion=>"jhjhj", :artefact_status_id=>1)
  end

  test "should have a ontology" do
    @p.ontology_id = nil
    assert_equal(false, @p.save, "Viabilidade deve possuir ontologia")
  end

  test "should have a status" do
    @p.artefact_status_id = nil
    assert_equal(false, @p.save, "Viabilidade deve possuir um STATUS")
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

  test "should have a unique ontology" do
    assert_equal(true, @p.save, "Deve salvar normal aqui")
    q = ProjectFeasibility.new
    q.ontology_id = @p.ontology_id
    assert_equal(false, q.save, "Ontologia deve ser única")
  end

end
