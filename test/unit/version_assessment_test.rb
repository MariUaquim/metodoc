require 'test_helper'

class VersionAssessmentTest < ActiveSupport::TestCase

  def setup
    @va = VersionAssessment.new(:version_id=>1, :technical_assessment=>"iiji", 
      :user_assessment=>"iji", :artefact_status_id=>1)
  end

  test "should have a version" do
    @va.version = nil
    assert_equal(false, @va.save, "Deve possuir uma versao da ontologia")
  end

  test "should have a artefact status" do
    @va.artefact_status = nil
    assert_equal(false, @va.save, "Deve possuir um status do artefato")
  end

  test "should have a technical assessment" do
    @va.technical_assessment = nil
    assert_equal(false, @va.save, "Deve possuir avaliaçao técnica")
  end

  test "should have a user assessment" do
    @va.user_assessment = nil
    assert_equal(false, @va.save, "Deve possuir avaliacao do usuario")
  end


end
