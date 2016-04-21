require 'test_helper'

class VersionTest < ActiveSupport::TestCase
  fixtures :versions, :ontologies, :users

  def setup
    @version = Version.new(:ontology_id => 1, :number => 1)
  end

  test "should have a ontology_id" do
    @version.ontology_id = nil
    assert_equal(false, @version.save, "Versão deve possuir uma ontologia")
  end

  test "should have many versions of a ontology" do
    assert_equal(true, @version.save, "Versao deve ser salvo")
    x = @version.number + 1
    new = Version.new(:ontology_id=> @version.ontology_id, :number=> x)
    assert_equal(true, new.save, "Nova versao deve ser salva tambem")
  end

  test "should have a version number" do
    @version.number = nil
    assert_equal(false, @version.save, "Versao salva sem numero")
  end

  test "should deny non integer ontology" do
    @version.ontology_id = "a"
    assert_equal(false, @version.save, "Id da ontologia naum eh inteiro")
    @version.ontology_id = 1.9984
    assert_equal(false, @version.save, "Id da ontologia nao eh inteiro")
  end

  test "should deny non integer number" do
    @version.number = "a"
    assert_equal(false, @version.save, "Salvou STRING no numero da versao")
    @version.number = 1.88
    assert_equal(false, @version.save, "Salvou FLOAT no numero da versao")
  end
end