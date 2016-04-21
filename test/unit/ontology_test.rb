require 'test_helper'
require 'ontology'

class OntologyTest < ActiveSupport::TestCase

  def setup
    @ontology = Ontology.new(:project_name => "Nome do Projeto", :name => "Ontologia",
    :domain => "Dominio", :visible=>true, :formality_degree_id=>1)
  end

  test "should have a project name" do
    @ontology.project_name = nil
    assert_equal(false, @ontology.save, "Salvo sem nome do projeto")
  end

  test "should have a ontology name" do
    @ontology.name = nil
    assert_equal(false, @ontology.save, "Salvo sem o nome da ontologia")
  end

  test "should have a domain" do
    @ontology.domain = nil
    assert_equal(false, @ontology.save, "Salvo sem o nome do doominio")
  end

  test "should have a formality degree id" do
    @ontology.formality_degree_id = nil
    assert_equal(false, @ontology.save, "Salvo sem grau de formalidade")
  end

  #test "should project name be unique" do
    #assert_equal(true, @ontology.save,"Ontologia deve ser salva normal aqui")
    #ont = Ontology.new(:project_name => @ontology.project_name, :name => "ojoiji", :domain => "iojiojoij")
    #assert_equal(false, ont.save, "Nome do projeto deve ser unico")
  #end

  #test "should name be unique" do
    #assert_equal(true, @ontology.save, "Ontologia deve ser salva normal aqui")
    #ont = Ontology.new(:project_name => "oijiojio", :name => @ontology.name, :domain => "ijoj")
    #assert_equal(false, ont.save, "Nome da ontologia deve ser unico")
  #end

  test "should check project name lenght" do
    @ontology.project_name = "12"
    assert_equal(false, @ontology.save, "Nome do projeto deve ter minimo de 3 caracteres")
    @ontology.project_name = "x" * 251
    assert_equal(false, @ontology.save, "Nome do projeto deve ser menos que 251 caracteres")
  end

  test "should check name lenght" do
    @ontology.name = "12"
    assert_equal(false, @ontology.save, "Nome da ontologia deve ter minimo de 3 caracteres")
    @ontology.name = "x" * 251
    assert_equal(false, @ontology.save, "Nome da ontologia deve ser menos que 251 caracteres")
  end

  test "should check domain lenght" do
    @ontology.domain = "12"
    assert_equal(false, @ontology.save, "Nome do dominio deve ter minimo de 3 caracteres")
    @ontology.domain = "x" * 251
    assert_equal(false, @ontology.save, "Nome do dominio deve ser menos que 251 caracteres")
  end
end