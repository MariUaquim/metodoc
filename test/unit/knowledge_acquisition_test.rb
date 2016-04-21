require 'test_helper'

class KnowledgeAcquisitionTest < ActiveSupport::TestCase

  def setup
    @k = KnowledgeAcquisition.new(:version_id=>1, :sources=>"ijijoi", :strategies=>"ijiojio", :artefact_status_id=>1)
  end

  test "should have a version" do
    @k.version_id = nil
    assert_equal(false, @k.save, "Necessita de uma versão")
  end

  test "should have a status" do
    @k.artefact_status_id = nil
    assert_equal(false, @k.save, "Deve possuir um status")
  end

  test "should have sources of information" do
    @k.sources = nil
    assert_equal(false, @k.save, "Fontes de Informação é obrigatório")
  end

  test "should have analysis strategies" do
    @k.strategies = nil
    assert_equal(false,@k.save, "Estratégias de Análise é obrigatório")
  end

  test "should have a unique version" do
    assert_equal(true, @k.save, "deve salvar normalmante aqui")
    new = KnowledgeAcquisition.new(:version_id=> @k.version_id, :sources=>"kjk",
    :strategies=>"hiojio")
    assert_equal(false, new.save, "uma versao deve possuir somente um artefato")
  end
end
