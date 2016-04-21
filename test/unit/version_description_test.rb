require 'test_helper'

class VersionDescriptionTest < ActiveSupport::TestCase

  def setup
    @vd = VersionDescription.new(:version_id=>1, :date=>DateTime.now, :responsible=>"Matheus",
    :purpose=>"ijiooijijoi", :obs=>"ohoioioiuo", :artefact_status_id=>1)
  end

  test "should have a version_id" do
    @vd.version_id = nil
    assert_equal(false, @vd.save, "Artefato deve possuir uma versão")
  end

  test "should have a status" do
    @vd.artefact_status_id = nil
    assert_equal(false, @vd.save, "Artefato deve possuir um status")
  end

  test "should have a date" do
    @vd.date = nil
    assert_equal(false, @vd.save, "deve possuir data do documento")
  end

  test "should have a responsible" do
    @vd.responsible = nil
    assert_equal(false, @vd.save, "deve possuir um responsavel")
  end

  test "should have a purpose" do
    @vd.purpose = nil
    assert_equal(false, @vd.save, "deve possuir um objetivo")
  end

  test "should check obs" do
    assert_equal(true, @vd.save, "deve salvar observação preenchido")
    @vd.obs = nil
    assert_equal(true, @vd.save, "deve salvar observação vazia")
  end

  test "should have a unique version" do
    assert_equal(true, @vd.save, "deve salvar normalmante aqui")
    new = VersionDescription.new(:version_id=> @vd.version_id, :date=>DateTime.now,
    :responsible=>"hiojio", :purpose=>"jiojio")
    assert_equal(false, new.save, "uma versao deve possuir somente um artefato")
  end

end
