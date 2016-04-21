require 'test_helper'

class VersionScheduleTest < ActiveSupport::TestCase

  def setup
    @a = VersionSchedule.new(:version_id=>1, :activity_name => "Nome", :activity_date => DateTime.now, :artefact_status_id=>1)
  end

  test "should have a version" do
    @a.version_id = nil
    assert_equal(false, @a.save, "Cronograma deve possuir uma versão")
  end

  test "should have a status" do
    @a.artefact_status_id = nil
    assert_equal(false, @a.save, "Artefato deve possuir um status")
  end

  test "should have a name" do
    @a.activity_name = nil
    assert_equal(false, @a.save, "deve possuir um nome")
  end

  test "should have a date" do
    @a.activity_date = nil
    assert_equal(false, @a.save, "Deve possuir uma data")
  end

  test "check description" do
    assert_equal(true, @a.save, "Deve salvar descrição vazia")
    @a.activity_description = "iooiuiouio"
    assert_equal(true, @a.save, "Deve salvar descrição preenchida")
  end

end
