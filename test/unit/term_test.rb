require 'test_helper'

class TermTest < ActiveSupport::TestCase

  def setup
    @term = Term.new(:name => "name", :description=>"description", :term_type_id=>1, :artefact_status_id=>1)
  end

  test "should have a type" do
    @term.term_type = nil
    assert_equal(false, @term.save, "Deve possuir tipo de termo")
  end
  
  test "should have a status" do
    @term.artefact_status = nil
    assert_equal(false, @term.save, "Deve possuir um status")
  end

  test "should have a name" do
    @term.name = nil
    assert_equal(false, @term.save, "Deve possuir um nome")
  end

  test "should have a description" do
    @term.description = nil
    assert_equal(false, @term.save, "Deve possuir uma descrição")
  end

  test "should check a name lenght" do
    @term.name = "1"
    assert_equal(false, @term.save, "Nome do termo deve ter mais de 1 caractere")
    @term.name = "1" * 251
    assert_equal(false, @term.save, "Tamanho do nome deve ser menor que 251")
  end
end
