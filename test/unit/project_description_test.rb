require 'test_helper'

class ProjectDescriptionTest < ActiveSupport::TestCase

  def setup
    @pd = ProjectDescription.new(:purpose=>"kdjkjkie", :date=>Date.today, :ontology_id => 1, :artefact_status_id=>1)
  end

  test "should have a purpose" do
    @pd.purpose = nil
    assert_equal(false, @pd.save, "Artefato deve ter objetivo preenchido")
  end

  test "should have a date" do
    @pd.date = nil
    assert_equal(false, @pd.save, "Artefato deve ter data")
  end
  
  test "should have a ontology_id" do
    @pd.ontology_id = nil
    assert_equal(false, @pd.save, "Artefato deve ter ontologia")
  end

  test "should have a artefact_status_id" do
    @pd.artefact_status_id = nil
    assert_equal(false, @pd.save, "Artefato deve ter STAUTS")
  end

  #test "should have a unique ontology_id" do
    #assert_equal(true, @pd.save, "Artefato deve ser salvo normalmente aqui")
    #outro = ProjectDescription.new(:purpose=>"ijoiji", :date=>Date.today, :ontology_id=>@pd.ontology_id)
    #assert_equal(false, outro.save, "Ontologia deve ter somente um artefato")
  #end

end